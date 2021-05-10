<template lang="pug">
  div
    .flex-leaf
      div Ich benutze nachhaltige Produkte:
      .eco-leaf-bg.ml-4
        LeafSVG.eco-leaf--gray(:size="leafSize" fillStyle="#333333")
        LeafSVG.eco-leaf(:size="leafSize" fillStyle="#62C370" :style="leafStyle")
      div.big-text {{sustainable_materials}}%
    v-slider(v-model="sustainable_materials" thumb-label="always" ticks="always" step="25" tick-size="4" min="0" max="100")
</template>

<script>
import Leaf from '@images/leaf.svg'
import LeafSVG from './leaf.vue'

export default {
  components: {
    LeafSVG
  },
  props: {

  },
  data() {
    return {
      leaf: Leaf,
      leafSize: 24,
      leafImg: new Image(),
      sustainable_materials: 0,
    }
  },
  computed: {
    fillAmount() {
      return this.inverseNormalize(this.sustainable_materials, 0, 100) * 64
    },
    leafStyle() {
      console.log(this.fillAmount)
      return {
        'opacity': 0.1 + this.sustainable_materials * 0.01,
        'clip-path': `inset(${this.fillAmount}px 0 0 0)`,
      }
    }
  },
  methods: {
    normalize(val, min, max) {
      let delta = max - min;
      return (val - min) / delta;
    },
    inverseNormalize(val, min, max) {
      let delta = max - min;
      return (max - val) / delta;
    }
  },
  mounted() {
    this.leafImg.src = this.leaf
  },
  watch: {

  }
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

  .flex-leaf {
    display: flex;
    justify-content: center;
    align-items: center;
    .big-text {
      font-size: 32px;
      min-width: 92px;
    }
  }
</style>
