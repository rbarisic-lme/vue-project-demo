<template lang="pug">
.splash
  BGVideoSlider(:videoNames="['become_a_stylist/banner_1_mobile.mp4', 'become_a_stylist/banner_2_mobile.mp4', 'become_a_stylist/banner_todo_mobile.mp4']")
    template(v-slot:default)
      v-container
        div
          h2.heading-h2(style="font-weight: 600") When passion becomes your profession.
          v-btn.mt-8(x-large color="accent" elevation="0") Jetzt anmelden
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
