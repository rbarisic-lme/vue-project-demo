<template lang="pug">
  .container-fluid.why-bridlx
    .container.pt-5.pb-4.mt-5
      .row
        .col-12.col-md-5
          h2.heading-h2.serif.mb-4.font-light Warum bridlX?
          p Wir begleiten dich auf deiner Reise zu deinem schönsten Tag.
          p Genieße den einzigartigen Service eines individuell auf dich abgestimmten Brautstylings.
          a.lead-btn-why.mt-2.serif(href="#") Jetzt entdecken
        .col-12.col-md-7
          video(autoplay loop muted playsinline preload="metadata")
            source(src="@assets/videos/bridlx-business-trailer.mp4" type="video/mp4")
            | Your browser does not support the video tag.

</template>

<script>
export default {
  components: {

  },
  props: {

  },
  data() {
    return {
      
  }}
}
</script>

<style lang="scss" scoped>
  $bg: #c9ccd5;
  $color: #595959;

  .why-bridlx {
    color: $color;
    background: $bg;
    .lead-btn-why {
      transition: all .2s;
      display: inline-block;
      font-size: 16px;
      padding: 12px 40px;
      border: 2px solid $color;
      color: #333;
      font-weight: 600;
      &:hover {
        color: #fff;
        background: $color;
      }
    }
    video {
      width: 100%;
      @media screen and (max-width: 720px) {
        margin-top: 32px;
      }
    }
  }
</style>
