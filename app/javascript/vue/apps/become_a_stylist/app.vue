<template lang="pug">
  v-app
    v-main#app-become-a-stylist
      Header(:links="headerLinks")
      Splash
      Footer
</template>

<script>
import Header from '@/components/header.vue'
import Splash from '@/components/become_a_stylist/splash.vue'
import Footer from '@/components/landing_page/footer.vue'

export default {
  components: {
    Header,
    Splash,
    Footer
  },
  data() {
    return {
      position: 0,
      headerLinks: [
        {url: "#", text: "Entdecken"},
        {url: "/become-a-stylist", text: "Stylist werden", active: true},
        {url: "#", text: "Login (Stylist)", modal: "stylistSignIn"},
      ]
    }
  },
}
</script>

<style scoped>

</style>
