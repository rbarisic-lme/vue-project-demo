<template lang="pug">
  EditableOverlay(height="100" ref="overlay")
    template(v-slot:hideInactive)

      v-form(v-model="valid" ref="form").mb-8
        v-text-field(:rules="fr.stylist.street" name="street" v-model="workspace_street" label="Strasse und Hausnummer")
        v-text-field(:rules="fr.stylist.city" name="city" v-model="workspace_city" label="Stadt")
        v-text-field(:rules="fr.stylist.zipcode" name="zipcode" v-model="workspace_zipcode" label="Postleitzahl")
        v-select(:rules="fr.stylist.country" v-model="workspace_country" name="country" :items="countries" label="Land" single-line append-icon="mdi-earth")
      v-btn(rounded color="primary" @click="save" :loading="$store.state.stylist.dataParsing" :disabled="!valid") Speichern
    template(v-slot:overlay-text)
      .p-4
        p {{workspace_street}}
        p {{workspace_zipcode}} {{workspace_city}}
        p {{workspace_country}}
</template>

<script>
import EditableOverlay from '@/components/editable_overlay.vue'
import { createHelpers } from 'vuex-map-fields';

import FormRules from '@/data/form_rules.js';

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
    ...mapFields(['workspace_street', 'workspace_city', 'workspace_zipcode', 'workspace_country'])
    // ...mapState('account', ['street', 'city', 'zipcode', 'country'])
    // street() { return this.$store.state.stylist.street},
  },
  methods: {
    save() {
      if(this.$refs.form.validate()) {

        this.$store.dispatch('stylist/updateAccount', [
          {name: "workspace_street", value: this.workspace_street},
          {name: "workspace_city", value: this.workspace_city},
          {name: "workspace_zipcode", value: this.workspace_zipcode},
          {name: "workspace_country", value: this.workspace_country},
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
