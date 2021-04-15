// import api from '@/api/stylist'
import VueCookies from 'vue-cookies'

// initial state
// shape: [{ id, quantity }]
const state = () => ({
  brands: [],
})

// getters
const getters = {
  
}

// actions
const actions = {
  async getBrands() {
    let result = await this._vm.$axios.post('/api/v1/brands')
  }
  // async login(state, payload) {
  //   let result = await this._vm.$axios.post('/stylists/sign_in', {
  //     email: payload['email'],
  //     password: payload['password']
  //   })
  // },
}

// mutations
const mutations = {
}

export default {
  namespaced: true,
  state,
  getters,
  actions,
  mutations
}