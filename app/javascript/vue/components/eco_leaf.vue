<template lang="pug">
.eco-leaf-bg
  LeafSVG.eco-leaf--gray(:size="leafSize" fillStyle="#333333" :style="bgLeafStyle")
  LeafSVG.eco-leaf(:size="leafSize" fillStyle="#62C370" :style="leafStyle")
</template>

<script>
import Leaf from '@images/leaf.svg'
import LeafSVG from '@/components/stylist/forms/leaf.vue'

export default {
  components: {
    LeafSVG
  },
  props: ['leafSize', 'amount'],
  data() {
    return {
      leaf: Leaf,
      leafImg: new Image(),
    }
  },
  computed: {
    fillAmount() {
      return this.inverseNormalize(this.amount, 0, 100) * 64
    },
    fillScale() {
      return this.normalize(this.amount / 8, 0, 100) + 0.825
    },
    bgLeafStyle() {
      return {
        'transform': `scale(${this.fillScale})`
      }
    },
    leafStyle() {
      return {
        'opacity': 0.1 + this.amount * 0.01,
        'clip-path': `inset(${this.fillAmount}px 0 0 0)`,
        'transform': `scale(${this.fillScale})`
      }
    },
  },
  methods: {
    normalize(val, min, max) {
      let delta = max - min;
      return (val - min) / delta;
    },
    inverseNormalize(val, min, max) {
      let delta = max - min;
      return (max - val) / delta;
    },
  },
  mounted() {
    this.leafImg.src = this.leaf
  },
}
</script>

<style lang="scss" scoped>
  .eco-leaf {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;

    transition: all .2s;
    opacity: 0.2;
  }
  .eco-leaf--gray {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;

    transition: all .2s;
    opacity: 0.2;
  }
  .eco-leaf-bg {
    position: relative;

    height: 64px;
    width: 64px;
    margin: 0;
  }
</style>
