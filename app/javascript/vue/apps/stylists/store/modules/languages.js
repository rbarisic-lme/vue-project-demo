// Get Available Languages from Backend

// import api from '@/api/stylist'
// import VueCookies from 'vue-cookies'

// initial state
// shape: [{}]
const state = () => ({
  languages: []
})
// getters
const getters = {
  languages: state => {
    return state.languages
  }  
}

// actions
const actions = {
  async getLanguages(ctx) {
     let result = await this._vm.$axios.get('/api/v1/languages')

     if (result.status === 200) {
      ctx.commit('setLanguages', result.data)
     }
  }
}

// mutations
const mutations = {
  setLanguages(state, payload) {
    state.languages = payload
  },
  languages(state, payload) {
    state.languages = payload
  }
}

export default {
  namespaced: true,
  state,
  getters,
  actions,
  mutations
}