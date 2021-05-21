<template lang="pug">
  div
    Header(:links="headerLinks")
    Splash
    Mentions
    Services
    WhyBridlX
    BridlXFeatures
    BecomeStylist
    BridlXForTomorrow
    Footer
</template>

<script>
import Header from '@/components/header.vue'
import Splash from '@/components/landing_page/splash.vue'
import Mentions from '@/components/landing_page/mentions.vue'
import Services from '@/components/landing_page/services.vue'
import WhyBridlX from '@/components/landing_page/why_bridlx.vue'
import BridlXFeatures from '@/components/landing_page/bridlx_features.vue'
import BecomeStylist from '@/components/landing_page/become_stylist.vue'
import BridlXForTomorrow from '@/components/landing_page/bridlx_for_tomorrow.vue'
import Footer from '@/components/landing_page/footer.vue'

export default {
  components: {
    Header,
    Splash,
    Mentions,
    Services,
    WhyBridlX,
    BridlXFeatures,
    BecomeStylist,
    BridlXForTomorrow,
    Footer
  },
  props: {

  },
  data() {
    return {
      position: 0,
      headerLinks: [
        {url: "#", text: "discover"},
        {url: "/become-a-stylist", text: "become_a_stylist", active: true},
        {url: "#", text: "login", modal: "signIn"},
      ]
    }
  }
}
</script>

<style lang="scss" scoped>

</style>
