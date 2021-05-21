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
        EcoLeaf(:leafSize="sustainable_materials_percent" :amount="sustainable_materials_percent")
        div.big-text {{sustainable_materials_percent}}%
      v-slider(v-model="sustainable_materials_percent" thumb-label="always" ticks="always" step="25" tick-size="4" min="0" max="100")
    v-btn(rounded color="primary" @click="save" :loading="$store.state.stylist.dataParsing") Speichern
</template>

<script>
import EditableOverlay from '@/components/editable_overlay.vue'
import EcoLeaf from '@/components/eco_leaf.vue'

import { createHelpers } from 'vuex-map-fields'

const { mapFields } = createHelpers({
  getterType: 'stylist/getField',
  mutationType: 'stylist/updateField',
});

export default {
  components: {
    EditableOverlay,
    EcoLeaf
  },
  props: {

  },
  data() {
    return {

    }
  },
  computed: {

    ...mapFields(['sustainable_materials_percent'])
  },
  methods: {
    save() {
      this.$store.dispatch('stylist/updateAccount', [
        {name: "sustainable_materials_percent", value: parseFloat(this.sustainable_materials_percent)},
      ]).then(() => {
        this.$refs.overlay.resetOverlay()
      })
    }
  },
  watch: {

  }
}
</script>

<style lang="scss" scoped>
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
