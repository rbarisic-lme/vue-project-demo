// import api from '@/api/stylist'

// initial state
// shape: [{ id, quantity }]
const state = () => ({
  jwtToken: undefined,
  initials: 'CJ',
  profilePicture: '',
})

// getters
const getters = {
  
}

// actions
const actions = {
  async login(state, payload) {
    let result = await this._vm.$axios.post('/stylists/sign_in', {
      email: payload['email'],
      password: payload['password']
    })

    debugger;
  },
  async checkAuthentication(state, payload) {
    await this._vm.$axios.get('/api/v1/stylists')
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