<template lang="pug">
  .container.p-0
    .row
      .col-12
        .h-100
          v-sheet.px-8.py-4.mb-8(rounded elevation="2")
            h3.heading-h3.serif.mb-8 Nachweise
            p Verifizieren Sie Ihre persönlichen Daten, um als Stylist bei bridlx autorisiert zu werden.
            p Achtung: Nach der Verifizierung können Sie bestimmte Daten 30 Tage lang nicht mehr anpassen.
            v-divider.my-8
            div#getid-container.mb-4
              v-skeleton-loader(type="article, actions")
</template>

<script>
import { init as initGetIdLauncher } from 'getid-launcher';

export default {
  components: {

  },
  props: {

  },
  data() {
    return {
      getid_jwt: undefined
    }
  },
  computed: {
    isFreelancer() {
      return this.$store.state.business.legal_form === 'Freiberufler' ? true : false
    },
    legalForm() {
      return this.isFreelancer ? 'Freelancer' : 'Gewerbetreibende'
    },
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

  }
}
</script>

<style lang="scss" scoped>

</style>
