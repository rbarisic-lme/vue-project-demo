<template lang="pug">
  EditableOverlay(height="100")
    template(v-slot:hideInactive)
      v-form(name="").mb-8
        v-text-field(name="street" v-model="street" label="Strasse und Hausnummer")
        v-text-field(name="city" v-model="city" label="Stadt")
        v-text-field(name="zipcode" v-model="zipcode" label="Postleitzahl")
        v-select(v-model="country" name="country" :items="countries" label="Land" single-line append-icon="mdi-earth")
      v-btn(rounded color="primary" @click="save" :loading="loading") Speichern
    template(v-slot:overlay-text)
      .p-4
        p {{street}}
        p {{zipcode}} {{city}}
        p {{country}}
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
      loading: false,
      countries: [
        "Deutschland",
        "Österreich",
        "Schweiz"
      ]
    }
  },
  computed: {
    ...mapFields(['street', 'city', 'zipcode', 'country'])
    // ...mapState('account', ['street', 'city', 'zipcode', 'country'])
    // street() { return this.$store.state.account.street},
  },
  methods: {
    save() {
      this.loading = true

      this.$store.dispatch('account/updateAccount', [
        {name: "street", value: this.street},
        {name: "city", value: this.city},
        {name: "zipcode", value: this.zipcode},
        {name: "country", value: this.country},
      ]).then(result => {
        this.$toast.open('Adresse erfolgreich geupdated')
      })
      .catch(error => {
       this.$toast.open({message: 'Leider ist ein Fehler aufgetreten. Versuche es später erneut.', type: 'error'});
      }).finally(result => {
        this.loading = false
      })
    }
  }
}
</script>

<style lang="scss" scoped>

</style>
