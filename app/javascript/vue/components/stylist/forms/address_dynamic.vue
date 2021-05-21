<template lang="pug">
  EditableOverlay(height="100")
    template(v-slot:hideInactive)

      BForm.mb-8(:fields="fields" @onsave="save" :fieldNames="fieldNames")
        //- template(v-slot:fields)
        //-   v-text-field(:rules="fr.stylist.street" name="street" v-model="street" label="Strasse und Hausnummer")
        //-   v-text-field(:rules="fr.stylist.city" name="city" v-model="city" label="Stadt")
        //-   v-text-field(:rules="fr.stylist.zipcode" name="zipcode" v-model="zipcode" label="Postleitzahl")
        //-   v-select(:rules="fr.stylist.country" v-model="country" name="country" :items="countries" label="Land" single-line append-icon="mdi-earth")
    template(v-slot:overlay-text)
      //- .p-4
      //-   p {{street}}
      //-   p {{zipcode}} {{city}}
      //-   p {{country}}
</template>

<script>
import BForm from '@/components/b_form.vue'

import EditableOverlay from '@/components/editable_overlay.vue'

import FormRules from '@/data/form_rules.js';

export default {
  components: {
    EditableOverlay,
    BForm
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
      ],
      fieldNames: ['street', 'city', 'zipcode', 'country'],
      fields: [
        {
          type: 'text',
          name: 'street',
          rules: FormRules.stylist.street,
        },
        {
          type: 'text',
          name: 'city',
          rules: FormRules.stylist.city,
        },
        {
          type: 'text',
          name: 'zipcode',
          rules: FormRules.stylist.zipcode,
        },
        {
          type: 'select',
          name: 'country',
          options: [
            "Deutschland",
            "Österreich",
            "Schweiz"
          ],
          rules: FormRules.stylist.country
        }
      ]
    }
  },
  methods: {
    save() {
      if(this.$refs.form.validate()) {
        this.loading = true

        this.$store.dispatch('stylist/updateAccount', [
          {name: "street", value: this.street},
          {name: "city", value: this.city},
          {name: "zipcode", value: this.zipcode},
          {name: "country", value: this.country},
        ]).then(result => {
          this.$toast.open('Adresse erfolgreich geupdated')
        })
        .catch(error => {
         this.$toast.open({message: this.$t('form.message.update.failure'), type: 'error'});
        }).finally(result => {
          this.loading = false
        })
      }
    }
  },
}
</script>

<style lang="scss" scoped>

</style>
