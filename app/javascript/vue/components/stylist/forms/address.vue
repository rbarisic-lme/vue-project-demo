<template lang="pug">
  EditableOverlay(height="100" ref="overlay")
    template(v-slot:hideInactive)
      v-form(v-model="valid" ref="form").mb-8
        v-text-field(:rules="fr.stylist.street" name="street" v-model="street" label="Strasse und Hausnummer")
        v-text-field(:rules="fr.stylist.city" name="city" v-model="city" label="Stadt")
        v-text-field(:rules="fr.stylist.zipcode" name="zipcode" v-model="zipcode" label="Postleitzahl")
        v-select(:rules="fr.stylist.country" v-model="country" name="country" :items="countries" label="Land" single-line append-icon="mdi-earth")
      v-btn(rounded color="primary" @click="save" :loading="$store.state.stylist.dataParsing" :disabled="!valid") Speichern
    template(v-slot:overlay-text)
      .p-4
        p {{street}}
        p {{zipcode}} {{city}}
        p {{country}}
</template>

<script>
import EditableOverlay from '@/components/editable_overlay.vue'

import FormRules from '@/data/form_rules.js';

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
      valid: false,
      fr: FormRules,
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
    // street() { return this.$store.state.stylist.street},
  },
  methods: {
    save() {
      if(this.$refs.form.validate()) {

        this.$store.dispatch('stylist/updateAccount', [
          {name: "street", value: this.street},
          {name: "city", value: this.city},
          {name: "zipcode", value: this.zipcode},
          {name: "country", value: this.country},
        ]).then(() => {
          this.$refs.overlay.resetOverlay()
        })
      }
    }
  },
}
</script>

<style lang="scss" scoped>

</style>
