<template lang="pug">
  EditableOverlay(height="100")
      template(v-slot:overlay-text)
        p.p-4 {{service_radius}} Kilometer
      template(v-slot:hideInactive)
        v-form(name="").pt-8
          //- v-text-field(name="street" v-model="street" label="Strasse und Hausnummer")
          v-spacer
          v-slider(v-model="service_radius" thumb-label="always" ticks="always" step="25" tick-size="4" min="0" max="500")
            //- template(v-slot:thumb-label="{ value }")
              span {{value}} km
            template(v-slot:append) KM
        v-btn(color="primary" @click="save") Speichern

</template>

<script>
import EditableOverlay from '@/components/editable_overlay.vue'
import { createHelpers } from 'vuex-map-fields';

const { mapFields } = createHelpers({
  getterType: 'account/getField',
  mutationType: 'account/updateField',
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
    ...mapFields(['service_radius'])
  },
  methods: {
    save() {
      this.$store.dispatch('account/updateAccount', [
        {name: "service_radius", value: this.service_radius},
      ]).catch(error => {

      }).finally(result => {
      })
    }
  }
}
</script>

<style lang="scss" scoped>

</style>
