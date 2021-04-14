import Vue from 'vue'
import vuetify from '@/plugins/vuetify' // path to vuetify export
import VModal from 'vue-js-modal'

import App from '../vue/apps/become_a_stylist/app.vue'

import axios from 'axios'

Vue.use(VModal)

let token = document.getElementsByName('csrf-token')[0].getAttribute('content')
axios.defaults.headers.common['X-CSRF-Token'] = token
axios.defaults.headers.common['Accept'] = 'application/json'

Vue.prototype.$axios = axios;

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    axios,
    vuetify,
    render: h => h(App)
  }).$mount()
  document.body.appendChild(app.$el)

  console.log(app)
})
