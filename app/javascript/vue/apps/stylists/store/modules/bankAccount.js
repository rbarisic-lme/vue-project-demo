import { getField, updateField } from 'vuex-map-fields';
// import api from '@/api/stylist'
// import VueCookies from 'vue-cookies'

// initial state
// shape: [{}]
const state = () => ({
  name: undefined,
  city: undefined,
  street: undefined,
  zipcode: undefined,
  country: undefined,
  iban: undefined,
})
// getters
const getters = {
  getField,
}

// actions
const actions = {
  async loadBankAccount(ctx, payload) {
    let result = await this._vm.$axios.get('/api/v1/bank_account/current')
    if(result.status == 200) {
      ctx.commit('setBankAccount', result.data)
    } else {

    }
  },
  async updateBackend(ctx, payload) {
    let formData = new FormData();

    payload.forEach(attr => {
      formData.append(`bank_account[${attr.name}]`, attr.value)
    })

    return await this._vm.$axios.put(`/api/v1/bank_account/${ctx.state.id}`, formData, {
      headers: { "Content-Type": "multipart/form-data" }
    })
  },
}

// mutations
const mutations = {
  updateField,
  setBankAccount(state, payload) {
    Object.keys(payload).forEach( key => {
      state[key] = payload[key]
    })

    state.account = payload
  }
}

export default {
  namespaced: true,
  state,
  getters,
  actions,
  mutations
}