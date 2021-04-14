import Vue from 'vue'
import VueRouter from 'vue-router'
import Vuex from 'vuex'
import VueCookies from 'vue-cookies'

import vuetify from '@/plugins/vuetify' // path to vuetify export
import VModal from 'vue-js-modal'

import App from '../vue/apps/stylists/app.vue'
import _ from 'lodash';

import router from '../vue/apps/stylists/router.js'
import store from '../vue/apps/stylists/store/index.js'

import axios from 'axios'

Vue.use(VueRouter)
Vue.use(Vuex)
Vue.use(VueCookies)

Vue.use(VModal)

let token = document.getElementsByName('csrf-token')[0].getAttribute('content')
axios.defaults.headers.common['X-CSRF-Token'] = token
axios.defaults.headers.common['Accept'] = 'application/json'

Vue.prototype.$axios = axios;
Vue.prototype.$cookies = VueCookies;

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    axios,
    router,
    store,
    vuetify,
    render: h => h(App)
  }).$mount()
  document.body.appendChild(app.$el)
})
