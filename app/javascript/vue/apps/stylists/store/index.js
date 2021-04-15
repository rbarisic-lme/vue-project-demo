import Vue from 'vue'
import Vuex from 'vuex'

import modules from './modules/'

// import auth from './modules/auth'
// import account from './modules/account'

Vue.use(Vuex)

export default new Vuex.Store({
  modules
  // modules: {

    // auth,
    // account,
  // },
})