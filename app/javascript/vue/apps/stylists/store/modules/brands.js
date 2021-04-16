// Get Available Brands from Backend

// import api from '@/api/stylist'
// import VueCookies from 'vue-cookies'

// initial state
// shape: [{}]
const state = () => ({
  brands: []
})
// getters
const getters = {
  
}

// actions
const actions = {
  async getBrands(ctx) {
     let result = await this._vm.$axios.get('/api/v1/brands')

     if (result.status === 200) {
      ctx.commit('setBrands', result.data)
     }
  }
}

// mutations
const mutations = {
  setBrands(state, payload) {
    state.brands = payload
  }
}

export default {
  namespaced: true,
  state,
  getters,
  actions,
  mutations
}