<template lang="pug">
  v-card
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
            v-row
              v-col
                EditableOverlay(height="100" ref="overlay")
                  template(v-slot:hideInactive)
                    v-btn(rounded color="primary" @click="savePackage(pack.attribute)") Speichern
                  v-text-field(label="Paketpreis" append-icon="mdi-currency-eur" v-model="myself[pack.attribute]")
          //- v-card-text My Package

</template>

<script>
import EditableOverlay from '@/components/editable_overlay.vue'

import { createHelpers } from 'vuex-map-fields';

import ServicePackagesJSON from '@/data/service_packages.json'

const { mapFields } = createHelpers({
  getterType: 'account/getField',
  mutationType: 'account/updateField',
});

export default {
  components: {
    EditableOverlay,
  },
  props: {

  },
  data() {
    return {
      tab: 0,
      myself: this
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
    savePackage(attr) {
      this.$store.dispatch('account/updateAccount', [
        { name: attr, value: this.$store.state.account[attr] },
      ]).then(() => {
        this.$refs.overlay.resetOverlay()
      }).catch(error => {
       this.$toast.open({message: 'Leider ist ein Fehler aufgetreten. Versuche es später erneut.', type: 'error'});
      })
    }
  }
}
</script>

<style lang="scss" scoped>

</style>
