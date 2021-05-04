<template lang="pug">
  .container.pt-8.pb-8.for-tomorrow
    .row
      .col-12.col-md-8.offset-md-2
        .text-center
          h2.heading-h2 Mit jedem Lächeln pflanzen wir gemeinsam Bäume!
      .col-12.col-md-2
          .text-center
            img.tree-logo(src="@images/bridlx-for-tomorrow.png")
    .row
      .col-12.text-center
        a(href="#")
          img.for-tomorrow(src="@images/bridlx-x-forTomorrow.png")
</template>

<script>
export default {
  components: {

  },
  props: {

  },
  data() {
    return {
      
    }
  }
}
</script>

<style lang="scss" scoped>
  img.tree-logo {
    display: inline-block;
    max-height: 96px;
  }
  img.for-tomorrow {
    max-height: 120px;
    margin: 0 auto;
  }
</style>
