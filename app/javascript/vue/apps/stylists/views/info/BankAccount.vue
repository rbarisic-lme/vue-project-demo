<template lang="pug">
  .container.p-0
    .row
      .col-12
        .h-100
          v-sheet.px-8.py-4.mb-8(rounded elevation="2")
            h3.heading-h3.serif.mb-8 Bankverbindung
            v-tabs.mb-4
              v-tab IBAN
              v-tab(disabled) Bankkonto USA
              v-tab(disabled) Kanadisches Bankkonto
              v-tab(disabled) Sonstige
            v-row
              v-col(sm="12" md="8")
                v-form(rules="bankAccountRules")
                  v-text-field(v-model="full_name" label="Name und Vorname" outlined)
                  v-text-field(v-model="street" label="Anschrift des Kontoinhabers" outlined autocomplete="street")
                  v-text-field(v-model="zipcode" label="Postleitzahl" outlined)
                  v-text-field(v-model="city" label="Stadt" outlined)
                  v-select(select v-model="country" :items="countries" item-value="name" item-text="name" label="Land" outlined)
                  v-text-field(v-model="iban" label="IBAN" outlined)

                  .text-right
                    v-btn(rounded color="primary" x-large @click="save" :loading="loading") Speichern
              v-col(sm="12" md="3").d-flex.justify-center.align-center
                v-row
                  v-col(sm="12" md="6").d-flex.justify-center.align-center
                    img.img-annotation(src="@images/icons/bridlx icon complete set_page_16.svg")
                  v-col(sm="12" md="6").h-100
                    .flex-centered
                      p.body-2 Gute Leistung zahlt sich aus. Mithilfe deiner Angaben steht der Auszahlung nichts mehr im Wege.
</template>

<script>
import CountriesJSON from '@/data/countries.json'
import { createHelpers } from 'vuex-map-fields';

const { mapFields } = createHelpers({
  getterType: 'business/getField',
  mutationType: 'business/updateField',
});

export default {
  components: {

  },
  props: {

  },
  data() {
    return {
      loading: false,
      countries: CountriesJSON,
      bankAccountRules: {
        // value => !value || value.size < 2000000 || 'Avatar size should be less than 2 MB!',
      },
    }
  },
  computed: {
    ...mapFields(["full_name", "street", "zipcode", "city", "country", "iban"])
  },
  methods: {
    save() {
        this.loading = true
        this.$store.dispatch('bankAccount/updateBackend', [
          {name: "full_name", value: this.full_name},
          {name: "city", value: this.city},
          {name: "street", value: this.street},
          {name: "zipcode", value: this.zipcode},
          {name: "country", value: this.country},
          {name: "iban", value: this.iban},
        ]).catch(error => {
          this.$toast.open({message: 'Leider konnte dein Bankkonto nicht aktualisiert werden', type: 'error'})
        }).finally(result => {
          setTimeout(() => {this.loading = false}, 1000)
        })
      }
  }
}
</script>

<style lang="scss" scoped>
.img-annotation {
 width: 48px; 
}
</style>
