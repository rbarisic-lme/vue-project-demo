import api from '@/api/stylist'

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
  async updateAvatar(state, payload) {
    await this._vm.$axios.get('/api/v1/stylists/1')
  }
}

// mutations
const mutations = {
  setProfilePicture(state, payload) {
    state.profilePicture = payload;
  }
}

export default {
  namespaced: true,
  state,
  getters,
  actions,
  mutations
}