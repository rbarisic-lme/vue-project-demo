<template lang="pug">
  v-container
    .text-center
      h1.heading-h1.mt-8.mb-4 Danke für Ihre Anmeldung bei bridlx!
      v-skeleton-loader(article)
      //- p.lead.mb-8 Entscheiden Sie sich, auf welche Art Sie die Seite benutzen möchten.
      //- .d-flex.justify-center.align-center.myc
      //-   v-card(max-width="240")
      //-     v-card-title Ich bin eine Braut
      //-     v-divider.mb-4
      //-     //- v-card-text.text--primary
      //-       p Lorem ipsum dolor, sit amet consectetur adipisicing, elit. Saepe vitae officiis et minima? Beatae id dolore vero repudiandae, enim, ipsum eaque iusto sit velit facere! Aperiam, ad voluptatem quasi blanditiis?
      //-     v-card-actions
      //-       v-btn(center color="primary" block @click="setUserType('Bride','bride')") Auswählen
      //-   v-divider(vertical).mx-4
      //-   v-card(max-width="240")
      //-     v-card-title Ich bin Stylist*In
      //-     v-divider.mb-4
      //-     //- v-card-text.text--primary
      //-       p Lorem ipsum dolor, sit amet consectetur adipisicing, elit. Saepe vitae officiis et minima? Beatae id dolore vero repudiandae, enim, ipsum eaque iusto sit velit facere! Aperiam, ad voluptatem quasi blanditiis?
      //-     v-card-actions
      //-       v-btn(center color="primary" block @click="setUserType('Stylist','stylist')") Auswählen
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
    setUserType(type, role) {
      this.$store.dispatch('user/updateAccount', [
        {name: 'type', value: type},
        {name: 'role', value: role},
      ]).then(response => {
        window.location = `${role}s`
      })
    }
  },
  mounted() {
    this.setUserType('Stylist', 'stylist')
  }
}
</script>

<style lang="scss" scoped>
  .myc {
    @media screen and (max-width: 720px) {
      .v-card:first-child {
        margin-bottom: 32px;
      }
      flex-direction: column;
      hr {
        display: none !important;
      }
    }
  }
</style>
