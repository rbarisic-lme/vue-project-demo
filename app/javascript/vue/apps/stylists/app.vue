<template lang="pug">
//- v-app
//-   v-main#app-landing
//-     Header(type="sticky")
//-     Footer

v-app(id="stylists")
  v-navigation-drawer(v-model="drawer"
 app) 
  v-app-bar(app)
    v-app-bar-nav-icon(class="hidden-md-and-up" @click="drawer = !drawer")
    v-img(:src="require('@images/logos/bridlx-dark.svg')" contain max-height="40" max-width="100" alt="bridlX")
    v-toolbar-title
    v-spacer
    v-toolbar-items(class="hidden-xs-only")
      v-btn(text v-for="item in menuItems" :key="item.text" :to="item.url") {{ item.text }}
    v-avatar.ml-3(color="primary")
      span.white--text.headline C

  v-main
    v-container(fluid) 
      transition(name="fade" mode="out-in")
        router-view
  v-footer(app)

</template>

<script>
import Header from '@/components/header.vue'
import Footer from '@/components/landing_page/footer.vue'

export default {
  components: {
    Header,
    Footer
  },
  data: () => ({
    drawer: false,
    menuItems: [
      {url: "/", text: "Dashboard"},
      {url: "/info", text: "Info"},
      {url: "/nachrichten", text: "Nachrichten"},
      {url: "/order", text: "Order"},
      {url: "/kalender", text: "Kalender"},
    ]
  }),
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
