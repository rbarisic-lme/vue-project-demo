import { getField, updateField } from 'vuex-map-fields';
import api from '@/api/stylist'
import i18n from '@/lib/i18n.js'

// initial state
// shape: [{ id, quantity }]
const state = () => ({
  first_name: undefined,
  id: undefined,
  initials: undefined,
  last_name: undefined,
  created_at: undefined,
  updated_at: undefined,
  url: undefined,
  avatar_url: undefined,
  about_me: undefined,
  accountLoading: true,
  brands: [],
  languages: [],
  extras: [],
  extras_prices: {},
  street: undefined,
  city: undefined,
  zipcode: undefined,
  country: undefined,
  service_radius: undefined,
  account_completed: false,
  workspace_street: undefined,
  workspace_city: undefined,
  workspace_zipcode: undefined,
  workspace_country: undefined,
  service_package_basic_hair_price: 0.0,
  service_package_basic_makeup_price: 0.0,
  service_package_standard_price: 0.0,
  service_package_premium_price: 0.0,
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
  }
}

// actions
const actions = {
  async loadAccount(ctx, payload) {
    let result = await this._vm.$axios.get(`/api/v1/stylists/current`)

    if(result.status == 200) {
      ctx.commit('setAccount', result.data)
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
    formData.append("stylist[brand_ids]", payload)

    return await this._vm.$axios.put(`/api/v1/stylists/${ctx.state.id}`, formData, {
      headers: { "Content-Type": "multipart/form-data" }
    })
  },
  async updateAccount(ctx, payload) {
    ctx.state.dataParsing = true

    let formData = new FormData();

    payload.forEach(attr => {
      formData.append(`stylist[${attr.name}]`, attr.value)
    })

    try {
      await this._vm.$axios.put(`/api/v1/stylists/${ctx.state.id}`, formData, {
        headers: { "Content-Type": "multipart/form-data" }
      })
      // setTimeout(() => {
        this._vm.$toast.open(i18n.t('form.message.update.success'))
      // }, 1000)
    } catch {
      this._vm.$toast.open({message: i18n.t('form.message.update.failure'), type: 'error'});
    } finally {
      setTimeout(() => {
        ctx.state.dataParsing = false
      }, 1000)
    }

  },
  async updateLanguages(ctx, payload) {
    let formData = new FormData();
    formData.append("stylist[language_ids]", payload)

    return await this._vm.$axios.put(`/api/v1/stylists/${ctx.state.id}`, formData, {
      headers: { "Content-Type": "multipart/form-data" }
    })
  },
}

// mutations
const mutations = {
  updateProp(state, payload) {
      state[payload.prop] = payload.value
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