<template lang="pug">
  .container-fluid.bridlx-services
    .row
      .col-12
        h1.heading-h2.serif.mt-16.text-center {{$t('landing.explore_services')}}
    .row
      .col-12
        SliderWithArrows(:imageNames="imageNames", pathPrefix="lp/services/")
</template>

<script>
  import SliderWithArrows from "@/components/slider_with_arrows.vue";

export default {
  components: {
    SliderWithArrows
  },
  props: {

  },
  data() {
    return {
      imageNames: [
        `${this.$config.awsPath}/bilder/lp/services/bridlx-service-1-make-up.jpg`,
        `${this.$config.awsPath}/bilder/lp/services/bridlx-service-2-hairstyling.jpg`,
        `${this.$config.awsPath}/bilder/lp/services/bridlx-service-3-typberatung.jpg`,
        `${this.$config.awsPath}/bilder/lp/services/bridlx-service-4-nails.jpg`,
        `${this.$config.awsPath}/bilder/lp/services/bridlx-service-5-elearning.jpg`,
        `${this.$config.awsPath}/bilder/lp/services/bridlx-service-6-fitness.jpg`,
        `${this.$config.awsPath}/bilder/lp/services/bridlx-service-7-yoga.jpg`,
        `${this.$config.awsPath}/bilder/lp/services/bridlx-service-8-health-coaching.jpg`
      ]
  }}
}
</script>

<style lang="scss" scoped>

</style>
