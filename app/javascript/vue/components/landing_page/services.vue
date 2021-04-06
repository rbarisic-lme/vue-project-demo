<template lang="pug">
  .container-fluid.bridlx-services
    .row
      .col-12
        h1.heading-h2.serif.mt-16.text-center Erkunde unsere professionellen Services
    .row
      .col-12
        SliderWithArrows(:imageNames='["bridlx-service-1-make-up.jpg", "bridlx-service-2-hairstyling.jpg", "bridlx-service-3-typberatung.jpg", "bridlx-service-4-nails.jpg", "bridlx-service-5-elearning.jpg", "bridlx-service-6-fitness.jpg", "bridlx-service-7-yoga.jpg", "bridlx-service-8-health-coaching.jpg"]', pathPrefix="lp/services/")
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
      
  }}
}
</script>

<style lang="scss" scoped>

</style>
