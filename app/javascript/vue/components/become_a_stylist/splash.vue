<template lang="pug">
.splash
  BGVideoSlider(:videoNames="[`https://assets.mixkit.co/videos/preview/mixkit-makeup-artist-working-in-her-beauty-salon-40540-large.mp4`, `https://assets.mixkit.co/videos/preview/mixkit-hands-of-a-bride-with-the-ring-and-her-bouquet-5223-large.mp4`, `https://assets.mixkit.co/videos/preview/mixkit-newlyweds-entering-their-wedding-car-5219-large.mp4`]")
    template(v-slot:default)
      v-container
        div
          h2.heading-h2(style="font-weight: 600") {{$t('stylist_landing.slogan')}}
          v-btn.mt-8(x-large color="accent" elevation="0" @click="$modal.show('signIn')") {{$t('stylist_landing.sign_up')}}
</template>

<script>
import SearchStylist from '@/components/search_stylist.vue';
import ContainerSlider from '@/components/container_slider.vue';
import BGVideoSlider from '@/components/bg_video_slider.vue';

export default {
  components: {
    SearchStylist,
    BGVideoSlider,
    ContainerSlider,
  },
  data() {
    return {
    }
  },
  computed: {
  },
  methods: {
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
    overflow: hidden;

    height: 80vh;
    // @media screen and (max-width: 720px) {
    //   max-height: 50vh;
    // }
  }

  .splash {
    .slogan {
      margin-top: 16rem;
      @media screen and (max-width: 720px) {
        margin-top: 4rem;
      }
    }
    .search {
      margin-top: 40px;
    }
  }

  .align-bottom {
    margin-bottom: 80px;
  }

</style>
