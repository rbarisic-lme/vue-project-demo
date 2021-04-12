<template lang="pug">
  .container
    .row
      .col-3
        v-sheet.px-8.py-4.mb-8(rounded elevation="2")
          h3.heading-h3.serif.mb-8.text-center Bewertungen
          div Qualität
          v-rating(readonly color="yellow darken-3" background-color="yellow darken-3" length="5" :value="3")
          div Termintreue
          v-rating(readonly color="yellow darken-3" background-color="yellow darken-3" length="5" :value="3")
          div Kommunikation
          v-rating(readonly color="yellow darken-3" background-color="yellow darken-3" length="5" :value="3")
        v-sheet.px-8.py-4.mb-8.text-center(rounded elevation="2")
          h3.heading-h3.serif.mb-8 Booster
          p.lead Externe Empfehlungen
          v-btn(color="primary" rounded) Bitte um Empfehlung
          v-divider.my-4
          p.lead Mein Profil teilen
      .col-8.offset-1
        v-sheet.px-8.py-4.mb-8(rounded elevation="2")
          h3.heading-h3.serif.mb-8.text-center Du wirst wahrgenommen
        v-sheet.px-8.py-4.mb-8(rounded elevation="2")
          h3.heading-h3.serif.mb-8.text-center Du kannst stolz auf dich sein
        v-sheet.px-8.py-4.mb-8(rounded elevation="2")
          h3.heading-h3.serif.mb-8.text-center Dein Wallet
</template>

<script>
export default {
  components: {

  },
  props: {

  },
  data() {
    return {
      
    }
  }
}
</script>

<style lang="scss" scoped>

</style>
