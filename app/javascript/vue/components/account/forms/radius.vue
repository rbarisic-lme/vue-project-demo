<template lang="pug">
  EditableOverlay(height="100")
      template(v-slot:hideInactive)
        v-form(name="").pt-8
          //- v-text-field(name="street" v-model="street" label="Strasse und Hausnummer")
          v-spacer
          v-slider(v-model="radiusKm" thumb-label="always" ticks="always" step="25" tick-size="4" min="0" max="500")
            template(v-slot:append) KM
        v-btn(color="primary" @click="save") Speichern
        //- template(v-slot:thumb-label="{ value }")
          span {{value}} km

</template>

<script>
import EditableOverlay from '@/components/editable_overlay.vue'

export default {
  components: {
    EditableOverlay
  },
  props: {

  },
  data() {
    return {
      radiusKm: 50
    }
  },
  methods: {
    save() {
      this.$store.dispatch('account/updateAccount', [
        {name: "service_radius", value: this.radiusKm},
      ]).catch(error => {

      }).finally(result => {
      })
    }
  }
}
</script>

<style lang="scss" scoped>

</style>
