<template lang="pug">
  .container.bridlx-features.pt-8.pb-8
    h2.heading-h2.serif.mt-4.mb-8.text-center Sag „JA“- ohne Stress
    .row.feature-elements
      .col-md.p-4.feature-element
        img.mb-3.text-center(src="@images/icons/bridlx-icons-complete-set-watch.svg")
        h3.small-title.text-center.mb-2 Effizienz
        p Spare dir wertvolle Zeit während deiner Hochzeitsplanung und genieße stattdessen die Vorfreude.
        p Mithilfe unserer intelligenten Matching-Tools erleichtern wir dir die Entscheidungsfindung.
      .col-md.p-4.feature-element
        img.mb-3.text-center(src="@images/icons/bridlx-icons-complete-set--lock.svg")
        h3.small-title.text-center.mb-2 100%ige Absicherung
        p Verlasse dich zu jeder Zeit auf eine abgesicherte Buchung sowie Serviceleistung mit Zufriedenheitsgarantie.
      .col-md.p-4.feature-element
        img.mb-3.text-center(src="@images/icons/bridlx-icons-complete-set-magnifier.svg")
        h3.small-title.text-center.mb-2 Perfect Match
        p Finde deinen verifizierten Top- Stylisten gemäß deiner Wünsche und Vorstellungen.
      .col-md.p-4.feature-element
        img.mb-3.text-center(src="@images/icons/bridlx-icons-complete-set-messages.svg")
        h3.small-title.text-center.mb-2 Kommunikation
        p Profitiere von einer zielgerichteten und transparenten Kommunikation. Du kannst uns an deinen Wünschen messen.
      .col-md.p-4.feature-element
        img.mb-3.text-center(src="@images/icons/bridlx-icons-complete-set-pinpoint.svg")
        h3.small-title.text-center.mb-2 Wunschlocation
        p Genieße an deinem Hochzeitstag ein stressfreies, auf dich abgestimmtes Brautstyling an deinem Wunschort.
</template>

<script>
export default {
  components: {

  },
  props: {

  },
  data() {
    return {
      
  }}
}
</script>

<style lang="scss" scoped>
  .bridlx-features {
    .feature-elements {
      .feature-element {
        transition: all .3s;
        position: relative;
        top: 8px;
        img {
          display: block;
          margin: 0 auto;
          max-height: 5rem
        }
        &:nth-child(2n) {
          padding-top: 80px !important;
          @media screen and (max-width: 720px) {
            padding-top: inherit;
          }
        }
        &:hover {
          background: #fff;
          box-shadow: 0 4px 6px 0 rgba(0,0,0,0.1);
          border-radius: 12px;
          top: 0px;
        }
      }
    }
  }
</style>
