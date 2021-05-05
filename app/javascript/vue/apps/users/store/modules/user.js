import { getField, updateField } from 'vuex-map-fields';
import i18n from '@/lib/i18n.js'

// initial state
// shape: [{ id, quantity }]
const state = () => ({
  id: undefined,
  type: undefined,
  role: undefined,
  initials: undefined,
  first_name: undefined,
  last_name: undefined,
  created_at: undefined,
  updated_at: undefined,
  url: undefined,
  avatar_url: undefined,
  about_me: undefined,
  accountLoading: true,
  snackSuccess: false,
  snackError: false,
  dataParsing: false,
})

// getters
const getters = {
  getField,
  getProp: (state, payload) => {
      state[payload.prop]
  }
}

// actions
const actions = {
  async loadAccount(ctx, payload) {
    let result = await this._vm.$axios.get(`/api/v1/users/current`)

    if(result.status == 200) {
      ctx.commit('setAccount', result.data)
    } else {

    }
  },
  async updateAccount(ctx, payload) {
    ctx.state.dataParsing = true

    let formData = new FormData();

    payload.forEach(attr => {
      formData.append(`user[${attr.name}]`, attr.value)
    })

    try {
      await this._vm.$axios.put(`/api/v1/users/${ctx.state.id}`, formData, {
        headers: { "Content-Type": "multipart/form-data" }
      })
      // setTimeout(() => {
        this._vm.$toast.open(i18n.t('form.message.update.success'))
      // }, 1000)
    } catch {
      this._vm.$toast.open({message: i18n.t('form.message.update.failure'), type: 'error'});
    } finally {
      setTimeout(() => {
        ctx.state.dataParsing = false
      }, 1000)
    }

  },
}

// mutations
const mutations = {
  setAccount(state, payload) {
    Object.keys(payload).forEach( key => {
      state[key] = payload[key]
    })

    state.account = payload
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