/* eslint no-console: 0 */
// Run this example by adding <%= javascript_pack_tag 'hello_vue' %> (and
// <%= stylesheet_pack_tag 'hello_vue' %> if you have styles in your component)
// to the head of your layout file,
// like app/views/layouts/application.html.erb.
// All it does is render <div>Hello Vue</div> at the bottom of the page.

import Vue from 'vue'
import VueRouter from 'vue-router'
import Vuex from 'vuex'

import vuetify from '@/plugins/vuetify' // path to vuetify export
import VModal from 'vue-js-modal'

import App from '../vue/apps/stylists/app.vue'
import _ from 'lodash';

import router from '../vue/apps/stylists/router.js'
import store from '../vue/apps/stylists/store/index.js'

import axios from 'axios'

Vue.use(VModal)
Vue.use(VueRouter)
Vue.use(Vuex)

let token = document.getElementsByName('csrf-token')[0].getAttribute('content')
axios.defaults.headers.common['X-CSRF-Token'] = token
axios.defaults.headers.common['Accept'] = 'application/json'

Vue.prototype.$axios = axios;

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
