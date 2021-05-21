<template lang="pug">
.container
  v-sheet.p-4(elevation="2")
    h2.heading-h2.serif Hier beginnt deine Reise mit bridlx.
    h3.heading-h3.serif Das sind die nächsten Schritte:
    .my-8
    .container
      .row
        .col-12.col-md-6
          .container
            .row
              .col-12.col-md-2.content-end
                img(style="max-width: 48px" src="@images/icons/Person.png")
              .col-12.col-md-9
                p.lead
                  b Profil anlegen
                p Trage alle wichtigen Informationen ein, lade dein Profil hoch und verifiziere dich.
        .col-12.col-md-6
          .container
            .row
              .col-12.col-md-2.content-end
                img(style="max-width: 48px" src="@images/icons/Kalender.png")
              .col-12.col-md-9
                p.lead
                  b Kalender pflegen
                p Du wirst Bräuten mit entsprechender Suchanfrage automatisiert vorgeschlagen. Halte deine Verfügbarkeiten immer up-to-date.
        .col-12.col-md-6
          .container
            .row
              .col-12.col-md-2.content-end
                img(style="max-width: 48px" src="@images/icons/Profilsichtbarkeit.png")
              .col-12.col-md-9
                p.lead
                  b Sichtbarkeit erhöhen
                p Für das Ranking berücksichtigt der Algorithmus u.a. Antwortzeiten, Bewertungen und dein Dienstleistungsspektrum.
        .col-12.col-md-6
          .container
            .row
              .col-12.col-md-2.content-end
                img(style="max-width: 48px" src="@images/icons/Agreement.png")
              .col-12.col-md-9
                p.lead
                  b Buchungen entgegennehmen
                p Wir alle lieben schnelles Feedback. Mache die ersten Schritte für eine vielversprechende Zusammenarbeit.
        .col-12.col-md-6
          .container
            .row
              .col-12.col-md-2.content-end
                img(style="max-width: 48px" src="@images/icons/Message.png")
              .col-12.col-md-9
                p.lead
                  b Kommunikation
                p Stimme alle notwendigen Details mit deiner Braut ab.
        .col-12.col-md-6
          .container
            .row
              .col-12.col-md-2.content-end
                img(style="max-width: 48px" src="@images/icons/Bewertung v2.png")
              .col-12.col-md-9
                p.lead
                  b Performance
                p Großartige Arbeit zahlt sich aus. Mach weiter so.
      .row
        .col-12
          .text-center
            v-btn(color="primary" @click="tutorialRead" :loading="$store.state.stylist.dataParsing") Verstanden
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
  },
  methods: {
    tutorialRead() {
      this.$store.dispatch('stylist/updateAccount', [{
        name: "stylist_tutorial_read", value: true
      }]).then(result => {
        this.$store.state.stylist['stylist_tutorial_read'] = true
      })
    }
  }
}
</script>

<style lang="scss" scoped>

</style>
