<template lang="pug">
  div
    .container
      .row
        .col-12.col-lg-3
          v-sheet.px-8.py-4.mb-8(rounded elevation="2")
            Ratings
          v-sheet.px-8.py-4.mb-8.text-center(rounded elevation="2")
            h3.heading-h3.serif.mb-8 Booster
            p.lead Externe Empfehlungen
            v-btn(color="primary" rounded @click="$modal.show('reviewBooster')") Bitte um Empfehlung
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
            h3.heading-h3.serif.mb-8.text-center {{$t('dashboard.title')}}
            p.lead {{$t('dashboard.no_items')}}
          //- v-sheet.px-8.py-4.mb-8(rounded elevation="2")
          //-   h3.heading-h3.serif.mb-8.text-center Du wirst wahrgenommen
          //- v-sheet.px-8.py-4.mb-8(rounded elevation="2")
          //-   h3.heading-h3.serif.mb-8.text-center Du kannst stolz auf dich sein
          //- v-sheet.px-8.py-4.mb-8(rounded elevation="2")
          //-   h3.heading-h3.serif.mb-8.text-center Dein Wallet
    Modal(name="reviewBooster" height="auto" :maxWidth="600" :adaptive="true")
      div.m-8.review-modal.text-center
        h4.mb-4.heading-h4 Empfehlungs-Booster
        p Link zum teilen:
        div.pretty-link
          v-text-field(outlined readonly :value="shareLink" append-icon="mdi-content-copy" @click:append="copyLink" ref="copyfield" hide-details)
        v-divider.my-6
        p Per E-Mail einladen:

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
    shareLink() {
      return window.location.host + this.$store.getters['stylist/profileLink']
    },
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
  },
  methods: {
    copyLink() {
      this.$refs.copyfield.$refs.input.focus()
      this.$refs.copyfield.$refs.input.select()
      document.execCommand('copy')
      this.$toast.open(this.$t('form.message.clipboard_copy_success'))
      this.$modal.hide('reviewBooster')
    },
  }
}
</script>

<style lang="scss" scoped>
  .review-modal {
    max-height: 80vh;
  }
</style>
