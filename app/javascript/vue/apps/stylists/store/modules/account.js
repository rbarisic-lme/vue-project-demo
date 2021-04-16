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
})

// getters
const getters = {
  brands: state =>  {
    return state.brands
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
    console.log(payload)
    formData.append("stylist[brand_ids]", payload)

    return await this._vm.$axios.put(`/api/v1/stylists/${ctx.state.id}`, formData, {
      headers: { "Content-Type": "multipart/form-data" }
    })
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
  },
  brands(state, payload) {
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