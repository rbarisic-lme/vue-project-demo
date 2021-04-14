import Vue from 'vue'
import Vuetify from 'vuetify'
import 'vuetify/dist/vuetify.min.css'

Vue.use(Vuetify)

const opts = {
  theme: {
    themes: {
      light: {
        primary: '#2c1d69',
        accent: '#dcb6aa',
      }
    }
  }
}

export default new Vuetify(opts)