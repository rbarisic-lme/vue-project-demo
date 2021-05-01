import { getField, updateField } from 'vuex-map-fields';
// import api from '@/api/stylist'
// import VueCookies from 'vue-cookies'

// initial state
// shape: [{}]
const state = () => ({
  id: undefined,
  name: undefined,
  city: undefined,
  street: undefined,
  zipcode: undefined,
  country: undefined,
  legal_form: undefined,
  tax_id: undefined,
  vat: undefined,
  tax_rate: 19,
  created_at: undefined,
  updated_at: undefined,
  stylist_id: undefined,
})
// getters
const getters = {
  getField,
  businessDataComplete: state => {
    if ( state.name
      && state.city
      && state.street
      && state.zipcode
      && state.country
      && state.legal_form
      && state.tax_id
      && state.vat
      && state.tax_rate
    ) {
      return true
    } else {
      return false
    }
  }
}

// actions
const actions = {
  async loadBusiness(ctx, payload) {
    let result = await this._vm.$axios.get('/api/v1/businesses/current')
    if(result.status == 200) {
      ctx.commit('setBusiness', result.data)
    } else {

    }
  },
  async updateBackend(ctx, payload) {
    let formData = new FormData();

    payload.forEach(attr => {
      formData.append(`business[${attr.name}]`, attr.value)
    })

    return await this._vm.$axios.put(`/api/v1/businesses/${ctx.state.id}`, formData, {
      headers: { "Content-Type": "multipart/form-data" }
    })
  },
}

// mutations
const mutations = {
  updateField,
  setBusiness(state, payload) {
    Object.keys(payload).forEach( key => {
      if (payload[key] === "null") {
        payload[key] = ''
      }

      state[key] = payload[key]
    })

    state.business = payload
  }
}

export default {
  namespaced: true,
  state,
  getters,
  actions,
  mutations
}