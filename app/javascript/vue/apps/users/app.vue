<template lang="pug">
//- v-app
//-   v-main#app-landing
//-     Header(type="sticky")
//-     Footer

v-app(id="stylists" :style="appStyle")
  v-navigation-drawer(v-model="drawer"
 app) 
  v-app-bar(app)
    v-app-bar-nav-icon(class="hidden-md-and-up" @click="drawer = !drawer")
    v-img(:src="require('@images/logos/bridlx-dark.svg')" contain max-height="40" max-width="100" alt="bridlX")
    v-toolbar-title
    v-spacer
    v-toolbar-items(class="hidden-xs-only")
      v-btn(text v-for="item in menuItems" :key="item.text" :to="item.url") {{ item.text }}
    v-menu(offset-y)
      template(v-slot:activator="{ on, attrs }")
        div(elevation="0" opacity="0" v-on="on" v-bind="attrs")
          Avatar(store="user")
      v-list
        v-list-item(link to="/")
          v-list-item-title Zur Hauptseite
        v-list-item(link to="/sign_out" @click="signOut")
          v-list-item-title Ausloggen
  v-main(v-if="$store.state.auth.authenticated && accountLoaded")
    v-container(fluid)
      transition(name="fade" mode="out-in")
        router-view
  v-main(v-else="$store.state.auth.authenticated && accountLoaded")
    v-container
      v-row
        v-col(md="4")
          v-skeleton-loader(type="article")
        v-col(md="8")
          v-skeleton-loader(type="article")
  v-footer(app)

</template>

<script>
import Header from '@/components/header.vue'
import Footer from '@/components/landing_page/footer.vue'

import Avatar from '@/components/user/avatar'

export default {
  components: {
    Header,
    Footer,
    Avatar,
  },
  data: () => ({
    accountLoaded: false,
    drawer: false,
    menuItems: [
      {url: "/", text: "Dashboard"},
      // {url: "/nachrichten", text: "Nachrichten"},
    ],
    appStyle: {
      background: '#f3f3f5'
    }
  }),
  methods: {
    signOut() {
      this.$cookies.remove('jwt')
      localStorage.jwt = undefined
      window.location = '/become-a-stylist'
    },
    redirectUnauthorized() {
      this.$cookies.remove('jwt')
      this.$cookies.remove('_bridlx_web_session ')
      localStorage.jwt = undefined
      window.location = '/become-a-stylist'
    }
  },
  async mounted() {
    let result = await this.$store.dispatch('auth/checkAuthentication').then(result => {
      if (result.data.authorized == false) {
        this.redirectUnauthorized()
      } else {
        this.$store.state.auth.authenticated = true
      }
    }).catch(error => {
      // todo: this.showLoginDialog()
      this.redirectUnauthorized()
    })

    await this.$store.dispatch('user/loadAccount')

    if (this.$store.getters['user/getAccountType'] == 'stylist') {
      window.location = '/stylists'
    } else if (this.$store.getters['user/getAccountType'] == 'bride') {
      this.accountLoaded = true
      // todo
    } else {
      this.accountLoaded = true
    }
  },
}
</script>

<style scoped>
.fade-enter-active, .fade-leave-active {
    transition: opacity .2s
}
.fade-enter, .fade-leave-to /* .fade-leave-active in <2.1.8 */ {
    opacity: 0
}
</style>
