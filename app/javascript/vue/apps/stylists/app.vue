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
    StylistAvatar

  v-main(v-if="$store.state.auth.authenticated")
    v-container(fluid)
      transition(name="fade" mode="out-in")
        router-view
  v-main(v-else="$store.state.auth.authenticated")
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

import StylistAvatar from '@/components/stylist/avatar'

export default {
  components: {
    Header,
    Footer,
    StylistAvatar,
  },
  data: () => ({
    drawer: false,
    menuItems: [
      {url: "/", text: "Dashboard"},
      {url: "/info/profile/personal-information", text: "Info"},
      {url: "/nachrichten", text: "Nachrichten"},
      {url: "/order", text: "Order"},
      {url: "/kalender", text: "Kalender"},
    ],
    appStyle: {
      background: '#f3f3f5'
    }
  }),
  methods: {
    redirectUnauthorized() {
      this.$cookies.remove('jwt')
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

    await this.$store.dispatch('account/loadAccount')
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
