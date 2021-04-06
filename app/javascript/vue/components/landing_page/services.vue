<template lang="pug">
  .container-fluid.bridlx-services
    .row
      .col-12
        h1.heading-h2.serif.mt-16.text-center Erkunde unsere professionellen Services
    .row
      .col-12
        SliderWithArrows
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
