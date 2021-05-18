<template lang="pug">
  .container.p-0
    BlockWithInfo(title="Verifizierung")
      p Nachweis mittels Upload eines gültigen amtlichen Ausweisdokumentes sowie der Unternehmensregistrierung beim Finanzamt.
      p Achtung: Nach der Verifizierung können Sie bestimmte Daten 30 Tage lang nicht mehr anpassen.
      //- v-divider.my-8
      div#getid-container.mb-4
        v-skeleton-loader(type="article, actions")
      template(v-slot:info-image)
        img(style="" src="@images/icons/Sicherheit.png" width="92")
      template(v-slot:info-text)
        span bridlx erfüllt zu 100% die allgemeinen Regularien bzgl. DSGVO sowie GwG. Deine Daten werden zu jederzeit sicher und vertraulich behandelt.

    BlockWithInfo(title="Bestätigung")
      div(v-if="!invoice_mandate_accepted")
        p Wir kümmern uns bei bridlx auch um die unschöne & aufwendige Verwaltungsarbeit für dich. Die Rechnungen enthalten alle Daten, die du uns wahrheitsgemäß bereitgestellt hast.

        v-btn(color="primary" small href="/api/v1/stylists/user_mandate") Vollmacht lesen
        v-checkbox(v-model="invoice_mandate_accepted_temp" label="Ich akzeptiere die Abrechnungsvollmacht")
      div(v-else="!invoice_mandate_accepted")
        p Du hast der Abrechnungsvollmacht bereits zugestimmt.
        v-btn(color="primary" small href="/api/v1/stylists/user_mandate") Vollmacht lesen
      template(v-slot:info-image)
        img(style="" src="@images/icons/Gesetz.png" width="92")
      template(v-slot:info-text)
        span Wir geben dir nicht nur eine Oberfläche, sondern übernehmen auch die unschönen Zeitfresser. Gib uns dein Go dafür!
      template(v-slot:actions)
        div(v-if="!invoice_mandate_accepted")
          v-btn(color="primary" rounded large @click="save") Speichern
</template>

<script>
import BlockWithInfo from '@/components/block_with_info.vue'
import { init as initGetIdLauncher } from 'getid-launcher';

import { createHelpers } from 'vuex-map-fields';
const { mapFields } = createHelpers({
  getterType: 'stylist/getField',
  mutationType: 'stylist/updateField',
});


export default {
  components: {
    BlockWithInfo,
  },
  props: {

  },
  data() {
    return {
      getid_jwt: undefined,
      invoice_mandate_accepted_temp: this.invoice_mandate_accepted,
    }
  },
  computed: {
    isFreelancer() {
      return this.$store.state.business.legal_form === 'Freiberufler' ? true : false
    },
    legalForm() {
      return this.isFreelancer ? 'Freelancer' : 'Gewerbetreibende'
    },
    ...mapFields(['invoice_mandate_accepted'])
  },
  methods: {
    save() {
      this.$store.dispatch('stylist/updateAccount', [
        {name: 'invoice_mandate_accepted', value: this.invoice_mandate_accepted_temp }
      ]).then(() => {

      })
    }
  },
  mounted() {
    this.$store.dispatch('stylist/requestGetIdJwtToken').then(response => {
      this.getid_jwt = response.data.token

      initGetIdLauncher({
        apiUrl: 'https://brildlx.getid.ee',
        jwt: this.getid_jwt,
        customerId: this.$store.state.stylist.id,
        containerId: 'getid-container',
        flowName: this.legalForm,
        onComplete: (data) => { console.log("everything is complete", data)},
        onFail: ({ code, message}) => { console.log("something went wrong: " + message )},
      })
    })
  },
}
</script>

<style lang="scss" scoped>

</style>
