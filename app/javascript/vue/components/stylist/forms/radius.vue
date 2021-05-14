<template lang="pug">
  EditableOverlay(height="100" ref="overlay")
      template(v-slot:overlay-text)
        p.p-4(v-if="service_mobility") Bis zu {{service_radius}} Kilometer
        p.p-4(v-else="service_mobility") Kein Mobil-Dienst
      template(v-slot:hideInactive)
        v-form(name="").pt-8
          //- v-text-field(name="street" v-model="street" label="Strasse und Hausnummer")
          v-checkbox(v-model="service_mobility" label="Ich biete meine Dienste Mobil an")
          v-spacer
          v-slider(v-model="service_radius" thumb-label="always" ticks="always" step="25" tick-size="4" min="0" max="500" :disabled="!service_mobility")
            //- template(v-slot:thumb-label="{ value }")
              span {{value}} km
            template(v-slot:append) KM
        v-btn(rounded color="primary" @click="save" :loading="$store.state.stylist.dataParsing") Speichern
      
</template>

<script>
import EditableOverlay from '@/components/editable_overlay.vue'
import { createHelpers } from 'vuex-map-fields';

const { mapFields } = createHelpers({
  getterType: 'stylist/getField',
  mutationType: 'stylist/updateField',
});

export default {
  components: {
    EditableOverlay
  },
  props: {

  },
  data() {
    return {
    }
  },
  computed: {
    ...mapFields(['service_mobility', 'service_radius'])
  },
  methods: {
    save() {
      this.$store.dispatch('stylist/updateAccount', [
        {name: "service_mobility", value: this.service_mobility},
        {name: "service_radius", value: this.service_radius},
      ]).then(() => {
        this.$refs.overlay.resetOverlay()
      })
    }
  }
}
</script>

<style lang="scss" scoped>

</style>
