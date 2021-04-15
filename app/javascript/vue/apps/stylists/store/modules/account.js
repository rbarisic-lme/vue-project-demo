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
})

// getters
const getters = {
  
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

    // let result = await this._vm.$axios.put(`/api/v1/stylists/${ctx.state.id}`, formData, {
    //   headers: { "Content-Type": "multipart/form-data" }
    // })

    // if (result.status == 200) {
    //   ctx.commit('setAccount', result.data)
    // }

    return await this._vm.$axios.put(`/api/v1/stylists/${ctx.state.id}`, formData, {
      headers: { "Content-Type": "multipart/form-data" }
    })

    return result
  }
}

// mutations
const mutations = {
  setProfilePicture(state, payload) {
    state.profilePicture = payload
  },
  setAccount(state, payload) {
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