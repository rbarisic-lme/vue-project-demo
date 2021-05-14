<template lang="pug">
EditableOverlay(height="100" ref="overlay")
  template(v-slot:overlay-text)
      .flex-centered.h-100.text-center
        span(v-if="sustainable_materials_percent > 0") Du verwendest zu {{sustainable_materials_percent}}% nachhaltige Produkte.
        span(v-else="sustainable_materials_percent > 0") Wähle aus, wie nachhaltig deine Produkte sind.
  template(v-slot:hideInactive)
    div
      .flex-leaf
        div Ich benutze nachhaltige Produkte:
        .eco-leaf-bg.ml-4
          LeafSVG.eco-leaf--gray(:size="leafSize" fillStyle="#333333" :style="bgLeafStyle")
          LeafSVG.eco-leaf(:size="leafSize" fillStyle="#62C370" :style="leafStyle")
        div.big-text {{sustainable_materials_percent}}%
      v-slider(v-model="sustainable_materials_percent" thumb-label="always" ticks="always" step="25" tick-size="4" min="0" max="100")
    v-btn(rounded color="primary" @click="save" :loading="$store.state.stylist.dataParsing") Speichern
</template>

<script>
import EditableOverlay from '@/components/editable_overlay.vue'
import Leaf from '@images/leaf.svg'
import LeafSVG from './leaf.vue'
import { createHelpers } from 'vuex-map-fields';

const { mapFields } = createHelpers({
  getterType: 'stylist/getField',
  mutationType: 'stylist/updateField',
});

export default {
  components: {
    EditableOverlay,
    LeafSVG
  },
  props: {

  },
  data() {
    return {
      leaf: Leaf,
      leafSize: 24,
      leafImg: new Image(),
    }
  },
  computed: {
    fillAmount() {
      return this.inverseNormalize(this.sustainable_materials_percent, 0, 100) * 64
    },
    fillScale() {
      return this.normalize(this.sustainable_materials_percent / 8, 0, 100) + 0.825
    },
    bgLeafStyle() {
      return {
        'transform': `scale(${this.fillScale})`
      }
    },
    leafStyle() {
      return {
        'opacity': 0.1 + this.sustainable_materials_percent * 0.01,
        'clip-path': `inset(${this.fillAmount}px 0 0 0)`,
        'transform': `scale(${this.fillScale})`
      }
    },
    ...mapFields(['sustainable_materials_percent'])
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
    save() {
      this.$store.dispatch('stylist/updateAccount', [
        {name: "sustainable_materials_percent", value: parseFloat(this.sustainable_materials_percent)},
      ]).then(() => {
        this.$refs.overlay.resetOverlay()
      })
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
