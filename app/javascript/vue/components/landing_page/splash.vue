<template lang="pug">
.splash.px-1.py-4
  BGSlider(transitionSpeed="4000")
  .align-bottom
    .container
      .row
        .col-12.col-md-8
          .slogan.animate__animated.animate__bounce
            h1.heading-h1
              span Du heiratest?
              br.visible-md-up
              span Finde dein perfektes Brautstyling
        .col-12
          .search
            SearchStylist
</template>

<script>
import SearchStylist from '@/components/search_stylist.vue';
import BGSlider from '@/components/bg_slider.vue';
import gsap from "gsap";


export default {
  components: {
    SearchStylist,
    BGSlider,
  },
  data() {
    return {

    }
  },
  computed: {
  }
}
</script>

<style lang="scss" scoped>
  .splash {
    display: flex;
    flex-direction: column;
    justify-content: flex-end;

    position: relative;
    color: #fff;
    background: #000;
    /*background-image: url(~@images/splash-landing-page.jpg);*/
    min-height: 80vh;
    overflow: hidden;
    @media screen and (max-width: 720px) {
      min-height: 20vh;
    }
  }

  .splash {
    .slogan {
      margin-top: 16rem;
    }
    .search {
      margin-top: 40px;
    }
  }

  .align-bottom {
    margin-bottom: 80px;
  }
</style>
