<template lang="pug">
  v-app
    v-main#app-become-a-stylist
      Header
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
    }
  },
}
</script>

<style scoped>

</style>
