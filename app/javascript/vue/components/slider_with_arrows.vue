<template lang="pug">
  .overflow-container(ref="ofContainer")
    .bg-fade-left
    .bg-fade-right
    .ui-arrows
      img(src="@images/icons/ui/arrow-left-circled.svg" @click="decrActive").i-arrow.i-arrow-left-circled
      img(src="@images/icons/ui/arrow-right-circled.svg" @click="incrActive").i-arrow.i-arrow-right-circled
    .arrow-slider-wrapper.mt-8(:style="wrapperStyle" ref="wrapper")
      .arrow-slider(v-for="(image, index) in images")
        img(:src="image" :class="{active: index == active ? true : false}")
      //- .arrow-slider(v-for="(image, index) in images" :key="index" :style="`background-image: url(${images[index]})`")
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
      transitionSpeed: 2000, // in milliseconds,
      slideOffset: 40,
      wrapperStyle: {},
    }
  },
  mounted() {
    for (var i = 1; i <= this.loadImagesCount; i++) {
      let image = new Image();
      image.src = require(`@images/banner/Model${i}.jpeg`);
      image.onload = this.onImgLoad(image);
    }
  },
  computed: {
    imagesCount() {
      return this.images.length;
    },
  },
  methods: {
    incrActive() {
      this.active++;
      this.setNewInterval();
    },
    decrActive() {
      this.active--;
      this.setNewInterval();
    },
    setWrapperStyle() {
      this.wrapperStyle = {
        left: this.getOffset() + "px",
      };
    },
    getOffset() {
      let offsetWidth = (this.$refs.ofContainer.offsetWidth / 2) - (this.$refs.wrapper.children[this.active].offsetWidth / 2);
      let previousElements = Array.from(this.$refs.wrapper.children).slice(0, this.active);        

      previousElements.forEach((val, i) => {
        offsetWidth -= (val.offsetWidth + parseInt(getComputedStyle(val).marginRight) + parseInt(getComputedStyle(val).marginLeft));
      })

      return offsetWidth;
    },
    setActive(val) {
      this.active = val
    },
    onImgLoad(val) {
      this.images.push (val.src);
    },
    setNewInterval() {
      clearInterval(this.interval);
      this.interval = setInterval(() => {
            this.setActive(this.active + 1);
          }, this.transitionSpeed)
    },
  },
  watch: {
    images() {
      this.setNewInterval();
    },
    active(val) {
      if(val >= this.imagesCount) {
        this.active = 0;
      } else if (val < 0) {
        this.active = this.imagesCount - 1;
      }

      this.setWrapperStyle();
    }
  },
  beforeDestroy() {
    clearInterval(this.interval)
  }
}
</script>

<style lang="scss" scoped>
  .overflow-container {
    position: relative;

    display: flex;
    justify-content: center;
    align-items: center;

    height: 420px;
    width: 100%;

    overflow: hidden;

    .bg-fade-left, .bg-fade-right {
      position: absolute;
      z-index: 990;
      top: 0;
      height: 100%;
      width: 20%;
      @media screen and (max-width: 720px) {
        display: none;
      }
    }
    .bg-fade-left {
      left: 0;
      background: linear-gradient(90deg, rgba(255,255,255,1.0) 50%, rgba(255,255,255,0.0));
    }
    .bg-fade-right {
      right: 0;
      background: linear-gradient(270deg, rgba(255,255,255,1.0) 50%, rgba(255,255,255,0.0));
    }
  }
  .arrow-slider-wrapper {
    transition: left .3s;

    display: flex;
    position: absolute;
    width: 100%;
    left: 0;
  }
  .arrow-slider {
    margin-right: 80px;
    width: 500px;
    img {
      max-width: unset;
      width: inherit;
      height: inherit;
      transition: all .3s;
      transform: scale(1.0);

      &.active {
        transform: scale(1.2);
      }
      @media screen and (max-width: 720px) {
      }
    }
  }
  .ui-arrows {
    position: absolute;
    display: flex;
    justify-content: space-between;
    align-items: center;

    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    z-index: 992;
  }
  .i-arrow {
    transition: all .3s;
    cursor: pointer;
    &:hover {
      transform: scale(1.1);
    }
  }
  .i-arrow-left-circled,
  .i-arrow-right-circled {
    padding: 8px;
    height: 80px;
  }
  // .bg-slider-enter-active, {
  //   transition: all 1s;
  // }
  // .bg-slider-leave-active {
  //   transition: all 1s;
  // }
  // .bg-slider-enter {
  //   opacity: 0;
  // }
  // .bg-slider-leave-to {
  //   opacity: 0;
  //   transform: translateX(-60px) scale(1.2);
  // }

</style>
