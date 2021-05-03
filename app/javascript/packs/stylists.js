import Vue from 'vue'
import VueRouter from 'vue-router'
import Vuex from 'vuex'
import VueCookies from 'vue-cookies'

import VueI18n from 'vue-i18n'

import vuetify from '@/plugins/vuetify' // path to vuetify export
import VModal from 'vue-js-modal'

import App from '../vue/apps/stylists/app.vue'
import _ from 'lodash';

import router from '../vue/apps/stylists/router.js'
import store from '../vue/apps/stylists/store/index.js'

import axios from 'axios'

import VueToast from 'vue-toast-notification';
import 'vue-toast-notification/dist/theme-sugar.css';
Vue.use(VueToast, { position: 'bottom' });

Vue.use(VueRouter)
Vue.use(Vuex)
Vue.use(VueCookies)

Vue.use(VModal)
// Vue.use(VueI18n)

import i18n from '@/lib/i18n.js'

let token = document.getElementsByName('csrf-token')[0].getAttribute('content')
axios.defaults.headers.common['X-CSRF-Token'] = token
axios.defaults.headers.common['Accept'] = 'application/json'

Vue.prototype.$axios = axios;
Vue.prototype.$cookies = VueCookies;

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    i18n,
    axios,
    router,
    store,
    vuetify,
    render: h => h(App)
  }).$mount()
  document.body.appendChild(app.$el)
})
