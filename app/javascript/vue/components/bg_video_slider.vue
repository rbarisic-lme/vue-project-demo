<template lang="pug">
  div
    transition(name="fade" mode="out-in")
      transition-group.bg-slider-wrapper(name="bg-slider" tag="div" ref="videoWrapper")
        .bg-video-slider(v-for="(video, index) in videos" :key="video" v-show="active == index")
          video(autoplay loop muted playsinline preload="metadata")
            source(:src="videos[index]" type="video/mp4")
            | Your browser does not support the video tag.
    .overlay-x
      slot
</template>

<script>
export default {
  components: {
  },
  props: {
    videoNames: Array,
  },
  data() {
    return {
      videos: [],
      videoDurations: [],
      pathPrefix: 'videos',
      active: 0,
      interval: 0,
      transitionSpeed: 7000,
    }
  },
  mounted() {
    for(let i = 0; i < this.videoNames.length; i++) {
      this.videos.push(require(`@assets/${this.pathPrefix}/${this.videoNames[i]}`));
    }
    this.interval = this.setNewInterval();
  },
  computed: {
    videosCount() {
      return this.videos.length;
    }
  },
  methods: {
    setActive(val) {
      this.active = val

      // this.$refs.videoWrapper.children[0].children[0].elm.load();
    },
    setNewInterval() {
      clearInterval(this.interval);
      return setInterval(() => {
          this.setActive(this.active + 1);
        }, 7000);
    }
  },
  watch: {
    active(val) {
      if(val >= this.videos.length) {
        this.active = 0;
      }
    }
  },
  beforeDestroy() {
    clearInterval(this.interval)
  }
}
</script>

<style lang="scss" scoped>
  .bg-slider-wrapper {
    video {
      width: 100%;
      height: 80vh;
      object-fit: cover;

    }
  }

  .overlay-x {
    position: absolute;
    left: 0;
    top: 0;
    padding-top: 500px;
    height: 100%;
    width: 100%;
  }

  .bg-video-slider {
    background-color: #81ae76;
    position: absolute;
    top: 0;
    left: -60px;
    width: calc(100% + 60px);
    height: 100%;
    background: #000;
    background-size: cover;
    background-position-x: right;
    background-position-y: top;
    background-repeat: no-repeat;

    animation-name: image;
    animation-duration: .5s;

    transform: scale(1.1);
    @media screen and (max-width: 720px) {
      background-position: top;
    }
  }
  .bg-slider-enter-active, {
    transition: all 1s;
  }
  .bg-slider-leave-active {
    transition: all 1s;
  }
  .bg-slider-enter {
    opacity: 0;
  }
   /* .bg-slider-leave-active below version 2.1.8 */
  .bg-slider-leave-to {
    opacity: 0;
    transform: translateX(-60px) scale(1.2);
  }
  @keyframes image {
    // 0% { transform: scale(1.0)}
    // 100% { transform: scale(1.1)}
  }

</style>
