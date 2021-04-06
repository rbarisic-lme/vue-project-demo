<template lang="pug">
  transition(name="fade" mode="out-in")
    transition-group.bg-slider-wrapper(name="bg-slider" tag="div")
      .bg-slider(v-for="(image, index) in images" :key="index" :style="`background-image: url(${images[index]})`" v-show="active == index")
        h1 {{active}}
        h1 {{index}}
</template>

<script>
export default {
  components: {
  },
  props: {
  },
  data() {
    return {
      images: [],
      loadImagesCount: 6, // Images to be loaded
      active: 0,
      interval: 0,
      transitionSpeed: 3000, // in milliseconds
      loadedImages: [],
    }
  },
  mounted() {
    for (var i = 1; i <= this.loadImagesCount; i++) {
      let image = new Image();
      image.src = require(`@images/banner/Model${i}.jpeg`);
      image.onload = this.onImgLoad(image);
    }
    this.interval = this.setNewInterval();
  },
  computed: {
    imagesCount() {
      return this.images.length;
    }
  },
  methods: {
    setActive(val) {
      this.active = val
    },
    onImgLoad(val) {
      this.images.push (val.src)
    },
    setNewInterval() {
      clearInterval(this.interval);
      return setInterval(() => {
            this.setActive(this.active + 1);
          }, this.transitionSpeed)
    }
  },
  watch: {
    images() {
      this.setNewInterval();
    },
    active(val) {
      if(val >= this.imagesCount) {
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
  .bg-slider {
    background-color: #81ae76;
    position: absolute;
    top: 0;
    left: -60px;
    width: calc(100% + 60px);
    height: 100%;
    background: #fff;
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
