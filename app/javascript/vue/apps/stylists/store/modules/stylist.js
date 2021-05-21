import { getField, updateField } from 'vuex-map-fields';
import api from '@/api/stylist'
import i18n from '@/lib/i18n.js'

// initial state
// shape: [{ id, quantity }]
const state = () => ({
  id: undefined,
  md5_identifier: undefined,
  type: undefined,
  role: undefined,
  profile_published: undefined,
  stylist_tutorial_read: undefined,
  ready_for_kyc: false,
  kyc_verified: false,
  kyc_pending: false,
  initials: undefined,
  first_name: undefined,
  last_name: undefined,
  created_at: undefined,
  updated_at: undefined,
  url: undefined,
  avatar_url: undefined,
  about_me: undefined,
  accountLoading: true,
  brands: [],
  languages: [],
  skills: [],
  certifications: [],
  extras: [],
  available_extras: [],
  available_extra_ids: [],
  available_extra_values: {},
  portfolio_images: [],
  street: undefined,
  city: undefined,
  zipcode: undefined,
  country: undefined,
  service_radius: undefined,
  service_mobility: undefined,
  account_completed: false,
  workspace_street: undefined,
  workspace_city: undefined,
  workspace_zipcode: undefined,
  workspace_country: undefined,
  service_package_basic_hair_price: 0.0,
  service_package_basic_makeup_price: 0.0,
  service_package_standard_price: 0.0,
  service_package_premium_price: 0.0,
  sustainable_materials_percent: 0,
  reviews: undefined,
  overall_ratings_detailed: {},
  invoice_mandate_accepted: false,
  snackSuccess: false,
  snackError: false,
  dataParsing: false,
})

// getters
const getters = {
  getField,
  getProp: (state, payload) => {
      state[payload.prop]
  },
  profileLink: state => { return '/profiles/' + state.md5_identifier},
  reviewLink:  state => { return '/review/' + state.md5_identifier},
  brands: state =>  {
    return state.brands
  },
  languages: state => { // don't deprecate yet
    return state.languages
  },
  addressPresent: state => {
    if (state.street && state.city && state.zipcode && state.country) {
      return true
    } else {
      return false
    }
  },
  servicePackagePricesPresent: state => {
    if (state.service_package_basic_hair_price
        && state.service_package_basic_makeup_price
        && state.service_package_standard_price
        && state.service_package_premium_price) {
      return true
    } else {
      return false
    }
  },
  workspacePresent: state => {
    if (state.workspace_street && state.workspace_city && state.workspace_zipcode && state.workspace_country) {
      return true
    } else {
      return false
    }
  },
  verificationComplete: state => {
    return state.kyc_verified
  },
  readyForPublishing: (state, getters) => {
    console.log(getters)
    if (state.about_me != null
      && getters.addressPresent
      && state.languages.length > 0
      && state.brands.length > 0
      && getters.workspacePresent
      && state.service_radius != null
      && getters.servicePackagePricesPresent
      && state.available_extras.length > 0
      // && getters['business/businessDataComplete']
      // && getters['bankAccount/dataComplete']
      // && getters.verificationComplete
      // && state.invoice_mandate_accepted
    ) {
      return true
    } else {
      return false
    }


  }
}

// actions
const actions = {
  getExtrasList(ctx, payload) {
     return this._vm.$axios.get('/api/v1/service_extras')
  },
  setAvailableExtras(ctx, payload) {
    ctx.commit('updateProp', {prop: 'available_extras_attributes', value: payload})
  },
  async loadAccount(ctx, payload) {
    let result = await this._vm.$axios.get(`/api/v1/stylists/current`)
    if(result.status == 200) {
      ctx.commit('setAccount', result.data)
      ctx.commit('setAvailableExtrasValues')
    } else {

    }
  },
  async updateAvatar(ctx, payload) {
    let formData = new FormData();
    
    formData.append("stylist[avatar]", payload);

    let result =  await this._vm.$axios.put(`/api/v1/stylists/${ctx.state.id}`, formData, {
      headers: { "Content-Type": "multipart/form-data" }
    })

    if (result.status == 200) {
      ctx.commit('setAccount', result.data)
    }

    return result
  },
  async updateBrands(ctx, payload) {
    let formData = new FormData();

    payload.forEach(item => {
      formData.append("stylist[brand_ids][]", item)
    })

    if(payload.length === 0) {
      formData.append("stylist[reset_brands]", "_empty")
    }

    return await this._vm.$axios.put(`/api/v1/stylists/${ctx.state.id}`, formData, {
      headers: { "Content-Type": "multipart/form-data" }
    })
  },
  async addNewCert(ctx, payload) {
    ctx.state.dataParsing = true

    let formData = new FormData();
    formData.append("stylist[certifications_attributes][]", JSON.stringify(payload))

    try {  
      let result = await this._vm.$axios.put(`/api/v1/stylists/${ctx.state.id}`, formData, {
        headers: { "Content-Type": "multipart/form-data" }
      })

      await ctx.dispatch('loadAccount')

      this._vm.$toast.open(i18n.t('form.message.update.success'))

      return result
    } catch {
      this._vm.$toast.open({message: i18n.t('form.message.update.failure'), type: 'error'});
      return {error: 'update failed'}
    } finally {
      ctx.state.dataParsing = false      
    }
  },
  async updateSkills(ctx, payload) {
    ctx.state.dataParsing = true

    let formData = new FormData();

    payload.forEach(skill => {
      formData.append("stylist[skills_attributes][]", JSON.stringify(skill))
    })

    try {  
      let result = await this._vm.$axios.put(`/api/v1/stylists/${ctx.state.id}`, formData, {
        headers: { "Content-Type": "multipart/form-data" }
      })

      await ctx.dispatch('loadAccount')

      this._vm.$toast.open(i18n.t('form.message.update.success'))

      return result
    } catch {
      this._vm.$toast.open({message: i18n.t('form.message.update.failure'), type: 'error'});
      return {error: 'update failed'}
    } finally {
      ctx.state.dataParsing = false      
    }
  },
  async updateAvailableExtras(ctx, payload) {
    ctx.state.dataParsing = true
    let formData = new FormData();

    if(payload.length > 0) {
      payload.forEach(available_extra => {
        formData.append("stylist[available_extras_attributes][]", JSON.stringify(available_extra))
      })
    } else {
      formData.append("stylist[empty_available_extras]", true)
    }

    ctx.state.available_extras.forEach(available_extra => {
      let stillUsed = ctx.state.available_extra_ids.includes(available_extra.service_extra_id)

      if (!stillUsed) {
        let tempExtra = available_extra
        tempExtra['_destroy'] = true

        delete tempExtra.created_at
        delete tempExtra.updated_at

        formData.append("stylist[available_extras_attributes][]", JSON.stringify(tempExtra))
      }
    })

    try {
      let result = await this._vm.$axios.put(`/api/v1/stylists/${ctx.state.id}`, formData, {
        headers: { "Content-Type": "multipart/form-data" }
      })
      
      this._vm.$toast.open(i18n.t('form.message.update.success'))

      await ctx.dispatch('loadAccount')

      return result
    } catch {
      this._vm.$toast.open({message: i18n.t('form.message.update.failure'), type: 'error'});
      return {error: 'update failed'}
    } finally {
      setTimeout(() => {
        ctx.state.dataParsing = false
      }, 500)
    }

  },
  async updatePortfolioImages(ctx, payload) {
    ctx.state.dataParsing = true
    let formData = new FormData();
    formData.append('portfolio_image[user_id]', ctx.state.id)
    formData.append('portfolio_image[image]', payload.image)

    try {
      let result = await this._vm.$axios.post(`/api/v1/portfolio_images/`, formData, {
        headers: { "Content-Type": "multipart/form-data" }
      })

      this._vm.$toast.open(i18n.t('form.message.update.success'))
      await ctx.dispatch('loadAccount')

      return result
    } catch {
      this._vm.$toast.open({message: i18n.t('form.message.update.failure'), type: 'error'});
      return {error: 'update failed'}
    } finally {
      setTimeout(() => {
        ctx.state.dataParsing = false
      }, 500)
    }
  },
  async updateAccount(ctx, payload) {
    ctx.state.dataParsing = true

    let formData = new FormData();

    payload.forEach(attr => {
      if (attr.name.includes('[]')) {
        formData.append(`stylist[${attr.name.replace('[]', '')}][]`, attr.value)
      } else {
        formData.append(`stylist[${attr.name}]`, attr.value)
      }
    })

    try {
      let result = await this._vm.$axios.put(`/api/v1/stylists/${ctx.state.id}`, formData, {
        headers: { "Content-Type": "multipart/form-data" }
      })
      // setTimeout(() => {
        this._vm.$toast.open(i18n.t('form.message.update.success'))
      // }, 500)

        await ctx.dispatch('loadAccount')

      return result
    } catch {
      this._vm.$toast.open({message: i18n.t('form.message.update.failure'), type: 'error'});
      return {error: 'update failed'}
    } finally {
      setTimeout(() => {
        ctx.state.dataParsing = false
      }, 500)
    }

  },
  async updateLanguages(ctx, payload) {
    let formData = new FormData();

    payload.forEach(item => {
      formData.append("stylist[language_ids][]", item)
    })

    if(payload.length === 0) {
      formData.append("stylist[reset_languages]", "_empty")
    }

    return await this._vm.$axios.put(`/api/v1/stylists/${ctx.state.id}`, formData, {
      headers: { "Content-Type": "multipart/form-data" }
    })
  },
  async requestGetIdJwtToken(ctx, payload) {
    try {
      let result = await this._vm.$axios.get(`/api/v1/users/request_jwt_getid`, {
        headers: { "Content-Type": "multipart/form-data" }
      })

      return result
    } catch(err) {
      console.log(err)
    }
  }
}

// mutations
const mutations = {
  updateProp(state, payload) {
      state[payload.prop] = payload.value
  },
  setAvailableExtrasValues(state) {
    state.available_extra_ids = [];
    
    state.available_extras.forEach(item => {
      state.available_extra_values[item.service_extra_id] = item.price
      state.available_extra_ids.push(item.service_extra_id)
    })
  },
  setProfilePicture(state, payload) {
    state.profilePicture = payload
  },
  setAccount(state, payload) {
    Object.keys(payload).forEach( key => {
      state[key] = payload[key]
    })

    state.account = payload
  },
  brands(state, payload) {
    state.brands = payload
  },
  languages(state, payload) {
    state.languages = payload
  },
  updateField
}

export default {
  namespaced: true,
  state,
  getters,
  actions,
  mutations
}