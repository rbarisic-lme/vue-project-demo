<template lang="pug">
  .container
    .row
      .col-12.col-lg-3
        v-sheet.px-8.py-4.mb-8(rounded elevation="2")
          Ratings
        v-sheet.px-8.py-4.mb-8.text-center(rounded elevation="2")
          h3.heading-h3.serif.mb-8 Booster
          p.lead Externe Empfehlungen
          v-btn(color="primary" rounded) Bitte um Empfehlung
          v-divider.my-4
          p.lead Mein Profil teilen
          v-item-group
            v-btn(elevation="0" text fab small target="_blank" :href="fbLink")
              v-icon(color="black") mdi-facebook
            v-btn(elevation="0" text fab small target="_blank" :href="twitterLink")
              v-icon(color="black") mdi-twitter
            v-btn(elevation="0" text fab small target="_blank" :href="pinterestLink")
              v-icon(color="black") mdi-pinterest
            v-btn(elevation="0" text fab small target="_blank" :href="liLink")
              v-icon(color="black") mdi-linkedin
            //- v-btn(elevation="0" text fab small)
            //-   v-icon(color="black") mdi-email-outline

      .col-12.col-lg-8.offset-lg-1
        v-sheet.px-8.py-4.mb-8(rounded elevation="2")
          h3.heading-h3.serif.mb-8.text-center Dein Dashboard
          p.lead Sobald du Kundenanfragen erhältst, wirst du hier deine Dashboard Informationen sehen können.
        //- v-sheet.px-8.py-4.mb-8(rounded elevation="2")
        //-   h3.heading-h3.serif.mb-8.text-center Du wirst wahrgenommen
        //- v-sheet.px-8.py-4.mb-8(rounded elevation="2")
        //-   h3.heading-h3.serif.mb-8.text-center Du kannst stolz auf dich sein
        //- v-sheet.px-8.py-4.mb-8(rounded elevation="2")
        //-   h3.heading-h3.serif.mb-8.text-center Dein Wallet
</template>

<script>
import Ratings from '@/components/stylist/ratings.vue'

export default {
  components: {
    Ratings
  },
  props: {

  },
  data() {
    return {
      
    }
  },
  computed: {
    fbLink() {
      return "https://www.facebook.com/sharer/sharer.php?u=https://www.bridlx.com&t=Besuche%20mein%20Profil%20auf%20bridlx.%20Dort%20biete%20ich%20meine%20Dienste%20als%20Stylist%20an!"
      // return "https://www.facebook.com/dialog/share"
      // + "&app_id=303970554540350"
      // + "&display=popup"
      // + "?href=https://www.bridlx.com"
      // + "&t=Schau dir mein Profil auf bridlx an!"
    },
    twitterLink() { return "https://twitter.com/intent/tweet?url=https://www.bridlx.com&text=Check%20out%20my%20profile%20on%20bridlx.com!"},
    pinterestLink() { return "https://pinterest.com/pin/create/button/?url=https://www.bridlx.com&media=&description=Check%20out%20my%20profile%20on%20bridlx.com!"},
    liLink() { return "https://www.linkedin.com/shareArticle?mini=true&url=https://www.bridlx.com" }
  }
}
</script>

<style lang="scss" scoped>

</style>
