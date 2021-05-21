<template lang="pug">
BlockWithInfo(title="Bankverbindung")
  //- v-tabs.mb-4
  //-   v-tab IBAN
  //-   v-tab(disabled) Bankkonto USA
  //-   v-tab(disabled) Kanadisches Bankkonto
  //-   v-tab(disabled) Sonstige
  v-row
    v-col.col-12(sm="12" md="")
      v-form(v-model="valid")
        v-text-field(:rules="fr.bank_account.full_name" v-model="full_name" label="Name und Vorname" outlined)
        v-text-field(:rules="fr.stylist.street" v-model="street" label="Anschrift des Kontoinhabers" outlined autocomplete="street-address")
        v-text-field(:rules="fr.stylist.zipcode" v-model="zipcode" label="Postleitzahl" outlined)
        v-text-field(:rules="fr.stylist.city" v-model="city" label="Stadt" outlined)
        v-select(select v-model="country" :items="countries" item-value="name" item-text="name" label="Land" outlined)
        v-text-field(:rules="fr.bank_account.iban" v-model="iban" label="IBAN" outlined :options="cleaveIban")
        //- VCleaveInput.font-mono(:rules="fr.bank_account.iban" v-model="iban" label="IBAN" outlined :options="cleaveIban")
        .text-right
          v-btn(rounded color="primary" x-large @click="save" :loading="loading" :disabled="!valid") Speichern
  template(v-slot:info-image)
    img.img-annotation(src="@images/icons/Bankdaten.png")
  template(v-slot:info-text)
    p.body-2 Gute Leistung zahlt sich aus. Mithilfe deiner Angaben steht der Auszahlung nichts mehr im Wege.
</template>

<script>
import CountriesJSON from '@/data/countries.json'
import { createHelpers } from 'vuex-map-fields';
import FormRules from '@/data/form_rules.js';
import VCleaveInput from "vuetify-cleave";
import BlockWithInfo from '@/components/block_with_info.vue'

const { mapFields } = createHelpers({
  getterType: 'bankAccount/getField',
  mutationType: 'bankAccount/updateField',
});

export default {
  components: {
    VCleaveInput,
    BlockWithInfo,
  },
  props: {

  },
  data() {
    return {
      fr: FormRules,
      valid: false,
      loading: false,
      countries: CountriesJSON,
      // bankAccountRules: {
        // value => !value || value.size < 2000000 || 'Avatar size should be less than 2 MB!',
      // },
      cleaveIban: {
        blocks: [4,4,4,4,4,4,4,4],
        delimiter: ' ',
        uppercase: true,
      }
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
      ]).then(response => {
        this.$toast.open({message: 'Bankkonto erfolgreich aktualisiert', type: 'success'})
        
        location.reload();
      }).catch(error => {
        this.$toast.open({message: 'Leider konnte dein Bankkonto nicht aktualisiert werden', type: 'error'})
      }).finally(result => {
        setTimeout(() => {this.loading = false; }, 1000)
      })
    }
  },
  mounted() {
    this.$store.dispatch('bankAccount/loadBankAccount')
  }
}
</script>

<style lang="scss" scoped>
.img-annotation {
 width: 48px; 
}
.font-mono {
  font-family: monospace;
}
</style>
