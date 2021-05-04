<template lang="pug">
  v-card
    v-card-actions
      v-btn(color="primary" v-show="showPrices" :loading="$store.state.stylist.dataParsing" :disabled="!valid" @click="save") {{ $t('form.btn.save') }}
      v-spacer
      v-btn(text color="primary" right text-right @click="showPrices = !showPrices")
        v-icon.mr-0 mdi-pencil
        span(v-if="!showPrices") {{$t('form.btn.edit.service_packages.prices')}}
        span(v-if="showPrices") {{$t('form.btn.cancel')}}
    v-expand-transition
      div(v-show="showPrices")
        v-form(v-model="valid" ref="form")
          v-container
            v-row
              v-col(v-for="(pack, i) in servicePacks" :key="pack.title")
                VCleaveInput(:rules="fr.stylist[pack.attribute]" :label="'Preis ' + pack.title" :placeholder="`${(i + 1) * 100}`" @click.native="tab = i" autocomplete="off" append-icon="mdi-currency-eur" :options="cleavePrice" v-model="myself[pack.attribute]")
                //- v-text-field(:rules="fr.stylist[pack.attribute]" :label="'Preis ' + pack.title" :placeholder="`${(i + 1) * 100}`" @click="tab = i" autocomplete="off" append-icon="mdi-currency-eur" v-model.lazy="$store.state.stylist['zipcode']" :options="{ date: true, datePattern: ['d', 'm', 'Y'] }" )

    v-divider

    v-tabs(v-model="tab" grow show-arrows)
      v-tab(v-for="pack in servicePacks" :key="pack.title" color="green") {{pack.title}}
    v-tabs-items(v-model="tab")
      v-tab-item(v-for="pack in servicePacks" :key="pack.title")
        v-card(flat)
          v-card-subtitle Im Paket enthalten:
          v-container(fluid)
            v-row
              v-col(v-for="service in pack.services" :key="service" sm="6")
                p
                  v-icon(color="green") mdi-check
                  span {{service}}
    //- v-row
    //-   v-col
    //-     EditableOverlay(height="100" ref="overlay")
    //-       template(v-slot:hideInactive)
    //-         v-btn(rounded color="primary" @click="savePackage(pack.attribute)") Speichern
    //-       v-text-field(label="Paketpreis" append-icon="mdi-currency-eur" v-model="myself[pack.attribute]")

</template>

<script>
import VCleaveInput from "vuetify-cleave";

import EditableOverlay from '@/components/editable_overlay.vue'

import { createHelpers } from 'vuex-map-fields';

import ServicePackagesJSON from '@/data/service_packages.json'

import FormRules from '@/data/form_rules.js';

const { mapFields } = createHelpers({
  getterType: 'stylist/getField',
  mutationType: 'stylist/updateField',
});

export default {
  components: {
    VCleaveInput,
    EditableOverlay,
  },
  props: {

  },
  data() {
    return {
      tab: 0,
      myself: this,
      fr: FormRules,
      showPrices: false,
      valid: false,
      cleavePrice: {
        numeral: true,
        numeralPositiveOnly: true,
        stripLeadingZeroes: true,
        numeralDecimalMark: ',',
        delimiter: '.',

        // numeralDecimalScale: 2
      }
    }
  },
  computed: {
    servicePacks() {
      return [
        {title: "Basic Hair", attribute: 'service_package_basic_hair_price', services: ServicePackagesJSON['basic_hair']},
        {title: "Basic Make-up", attribute: 'service_package_basic_makeup_price', services: ServicePackagesJSON['basic_makeup']},
        {title: "Standard", attribute: 'service_package_standard_price', services: ServicePackagesJSON['standard']},
        {title: "Premium", attribute: 'service_package_premium_price', services: ServicePackagesJSON['premium']},
      ]
    },
    ...mapFields(['service_package_basic_hair_price', 'service_package_basic_makeup_price', 'service_package_standard_price', 'service_package_premium_price'])
  },
  methods: {
    save(attr) {
      this.$store.dispatch('stylist/updateAccount', [
        {name: "service_package_basic_hair_price", value: this.service_package_basic_hair_price},
        {name: "service_package_basic_makeup_price", value: this.service_package_basic_makeup_price},
        {name: "service_package_standard_price", value: this.service_package_standard_price},
        {name: "service_package_premium_price", value: this.service_package_premium_price},
      ]).then(() => {
        this.showPrices = false
      })
    }
  }
}
</script>

<style lang="scss" scoped>

</style>
