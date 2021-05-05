// import api from '@/api/stylist'
import VueCookies from 'vue-cookies'

// initial state
// shape: [{ id, quantity }]
const state = () => ({
  authenticated: false,
  jwt:  localStorage.jwt || undefined, //JSON Web Token
  initials: 'CJ',
  profilePicture: '',
})

// getters
const getters = {
  
}

// actions
const actions = {
  async checkAuthentication(ctx, payload) {
    if (ctx.state.jwt) {
      this._vm.$axios.defaults.headers.common['Authorization'] = `Bearer ${ctx.state.jwt}`
    } else {
      return Promise.reject('Not Authenticated')
    }
    
    return this._vm.$axios.get('/api/v1/auth/authenticated');
  }
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