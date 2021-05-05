import Vue from 'vue'
import VueRouter from 'vue-router'
import Vuex from 'vuex'
import VueCookies from 'vue-cookies'

import VueI18n from 'vue-i18n'

import vuetify from '@/plugins/vuetify' // path to vuetify export
import VModal from 'vue-js-modal'
 
import _ from 'lodash';

import axios from 'axios'

import VueToast from 'vue-toast-notification';
import 'vue-toast-notification/dist/theme-sugar.css';

import i18n from '@/lib/i18n.js'

const initApp = function(appName, routerName = false, storeName = false) {

  Vue.use(VueToast, { position: 'bottom' });

  Vue.use(VueRouter)
  Vue.use(Vuex)
  Vue.use(VueCookies)

  Vue.use(VModal)
  // Vue.use(VueI18n)

  const App = require(`../vue/apps/${appName}/app.vue`).default

  const router = routerName ? require(`../vue/apps/${appName}/router.js`).default : undefined
  const store = storeName ? require(`../vue/apps/${appName}/store/index.js`).default : undefined

  let token = document.getElementsByName('csrf-token')[0].getAttribute('content')
  axios.defaults.headers.common['X-CSRF-Token'] = token
  axios.defaults.headers.common['Accept'] = 'application/json'

  Vue.prototype.$axios = axios;
  Vue.prototype.$cookies = VueCookies;

  document.addEventListener('DOMContentLoaded', () => {
    const app = new Vue({
      i18n,
      router,
      store,
      axios,
      vuetify,
      render: h => h(App)
    }).$mount()
    document.body.appendChild(app.$el)
  })
} 


export default initApp