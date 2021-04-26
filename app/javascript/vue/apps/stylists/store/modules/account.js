import { getField, updateField } from 'vuex-map-fields';
import api from '@/api/stylist'

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
  street: undefined,
  city: undefined,
  zipcode: undefined,
  country: undefined,
  service_radius: undefined,
  account_completed: false,
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
    let formData = new FormData();

    payload.forEach(attr => {
      formData.append(`stylist[${attr.name}]`, attr.value)
    })

    return await this._vm.$axios.put(`/api/v1/stylists/${ctx.state.id}`, formData, {
      headers: { "Content-Type": "multipart/form-data" }
    })
  },
  async updateLanguages(ctx, payload) {
    let formData = new FormData();
    formData.append("stylist[language_ids]", payload)

    return await this._vm.$axios.put(`/api/v1/stylists/${ctx.state.id}`, formData, {
      headers: { "Content-Type": "multipart/form-data" }
    })
  }
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