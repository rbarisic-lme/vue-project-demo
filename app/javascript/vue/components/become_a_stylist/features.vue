<template lang="pug">
  .container.bridlx-features.pt-8.pb-8
    h2.heading-h2.serif.mt-4.mb-8.text-center Wie es funktioniert
    .row.feature-elements
      .col-md.p-4.feature-element
        img.banner-img.mb-3.text-center(src="@images/icons/Person.png")
        h3.small-title.text-center.mb-2
          span.big-text 1.
          | Profil
        p Lege dein Profil an und lege nach der Verifizierung sofort los! 
      .col-md.p-4.feature-element
        img.banner-img.mb-3.text-center(src="@images/icons/Rakete.png")
        h3.small-title.text-center.mb-2
          span.big-text 2.
          | Marketing
        p Lade ein aussagekräftiges Portfolio hoch und mache mit deinen besten Arbeiten auf dich aufmerksam.
      .col-md.p-4.feature-element
        img.banner-img.mb-3.text-center(src="@images/icons/Bewertung v2.png")
        h3.small-title.text-center.mb-2
          span.big-text 3.
          | Performance
        p Kundenzufriedenheit steht bei bridlx an oberster Stelle. Kommunikation und professionelle Arbeit sind der Schlüssel zum Erfolg.
      .col-md.p-4.feature-element
        img.banner-img.mb-3.text-center(src="@images/icons/Geld.png")
        h3.small-title.text-center.mb-2
          span.big-text 4.
          | Honorierung
        p Deine Leistungen werden belohnt. Wir kümmern uns automatisiert um die Rechnungsstellung und den Geldfluss.
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
    min-height: 40vh;
    .feature-elements {
      .feature-element {
        transition: all .3s;
        position: relative;
        img {
          display: block;
          margin: 0 auto;
          max-height: 5rem
        }
        &:nth-child(2n) {
          // padding-top: 80px !important;
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
  .banner-img {
    width: 64px;
  }

  .big-text {
    font-size: 2rem;
    margin-right: 8px;
  }
</style>
