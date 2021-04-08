<template lang="pug">
  .overflow-container(:style="styleHeight")
    .indicators
      .indicator-wrapper(v-for="item in this.slideCount" :key="item" :data-index="item" @click="clickIndicator")
        .indicator(:class="{active: active == item - 1}")
    .container-slider-wrapper(:style="wrapperStyle" ref="wrapper")
      slot
</template>

<script>
export default {
  components: {

  },
  props: {
      transitionSpeed: String,
      height: [String, Number],
  },
  data() {
    return {
      slideCount: 0,
      active: 0,
      intervalId: 0,
      wrapperStyle: {},
    }
  },
  computed: {
    styleHeight() {
      return {
        height: this.height + "px",
      }
    }
  },
  mounted() {
    this.slideCount = this.$refs.wrapper.childElementCount;
    this.setNewInterval();
  },
  methods: {
    incrActive() {
      this.active++;
      // this.setNewInterval();
    },
    decrActive() {
      this.active--;
      // this.setNewInterval();
    },
    setNewInterval() {
      clearInterval(this.intervalId);
      this.intervalId = setInterval(() => {
        this.active++
      }, this.transitionSpeed)
    },
    setWrapperStyle() {
      this.wrapperStyle = {
        bottom: this.getOffset() + "px",
      };
    },
    getOffset() {
      let offset = (this.active * this.height) / -1
      return offset;
    },
    clickIndicator(e) {
      this.active = e.currentTarget.dataset.index - 1;
      this.setNewInterval();
    }
  },
  watch: {
    active(val) {
      if(val >= this.slideCount) {
        this.active = 0;
      } else if (val < 0) {
        this.active = this.slideCount - 1;
      }

      this.setWrapperStyle();
    }
  },
  beforeDestroy() {
    clearInterval(this.intervalId)
  }
}
</script>

<style lang="scss" scoped>
.overflow-container {
    position: relative;

    display: flex;
    justify-content: center;
    align-items: center;

    width: 100%;

    overflow: hidden;
  .container-slider-wrapper {
    transition: bottom .3s;

    display: flex;
    position: absolute;
    width: 100%;
    bottom: 0;
    left: 0;

    flex-direction: column-reverse;
  }
  .container-slider {
  }
  .indicators {
    position: absolute;
    top: 0;
    right: 0;
    display: flex;
    align-items: flex-end;
    height: 100%;
    z-index: 998;
    justify-content: center;
    flex-direction: column;
    padding: 6px;
    .indicator-wrapper {
      padding: 12px;
      cursor: pointer;

      &:hover {
        .indicator {
          background-color: rgba(255,255,255,0.5);
        }
      }

      &:last-child {
        margin-bottom: 0;
      }
      .indicator {
        height: 1rem;
        width: 1rem;
        border: 1px solid #fff;
        border-radius: 9999px;
        background: rgba(255,255,255,0.0);
        box-shadow: 0 0 2px rgba(0,0,0,0.4);
        &.active {
          background: rgba(255,255,255,1.0);
        }
      }
    }
  }
}
</style>
