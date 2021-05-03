import Vue from 'vue'
import VueI18n from 'vue-i18n'
import messages from '@/data/localizations.js'

Vue.use(VueI18n)


const i18n = new VueI18n({
  locale: 'de', // set locale
  messages, // set locale messages
})


export default i18n