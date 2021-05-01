<template lang="pug">
  .container.p-0
    .row
      .col-12
        .h-100
          v-sheet.px-8.py-4.mb-8(rounded elevation="2")
            h3.heading-h3.serif.mb-8 Checkliste
            p Schauen wir, ob alles abgehakt ist!
            v-container(fluid)
              v-row(v-for="category in checkCategories")
                v-col(sm="12")
                  h4.text-h6 {{category.title}}
                v-divider
                v-col(v-for="check in category.collection" :key="check.title" sm="6")
                  p
                    v-icon(color="green" v-if="check.done") mdi-check
                    v-icon(color="red" v-else="check.done") mdi-plus
                    v-btn(text :to="category.route") {{check.title}}
</template>

<script>
import {mapGetters} from 'vuex';

export default {
  components: {

  },
  props: {

  },
  data() {
    return {
    }
  },
  mounted() {
  },
  computed: {
    // ...mapGetters({
        // getterName: 'addressPresent'
    // })
    checkCategories() {
      return [
        {title: 'Persönliche Informationen', route: '/info/profile/personal-information', key: 'checksPersonal', collection: [
          {title: 'Beschreibung', done: this.$store.state.account.about_me != null },
          {title: 'Adresse', done: this.$store.getters['account/addressPresent'] },
          {title: 'Sprachen', done: this.$store.state.account.languages.length > 0 },
        ]},
        {title: 'Mein Service', route: '/info/profile/my-service', key: 'checksPersonal', collection: [
          {title: 'Produkte & Marken', done: this.$store.state.account.brands.length > 0 },
          {title: 'Workspace', done: this.$store.getters['account/workspacePresent'] },
          {title: 'Umkreis', done: this.$store.state.account.service_radius != null },
          {title: 'Paketpreise', done: this.$store.getters['account/servicePackagePricesPresent'] },
          {title: 'Extras', done: this.$store.state.account.extras.length > 0 },
        ]},
        {title: 'Unternehmensdaten', route: '/info/business/company-data', key: 'checksBusiness', collection: [
          {title: 'Firmenanschrift', done: this.$store.getters['business/businessDataComplete'] },
        ]},
        {title: 'Bankkonto', route: '/info/business/bank-account', key: 'checksBusiness', collection: [
          {title: 'Kontodaten', done: this.$store.getters['bankAccount/dataComplete']}
          ]
        },
        // {title: 'Verifizierung', route: '/info/business/bank-account', key: 'checksBusiness', collection: [

        //   ]
        // },
        // {title: 'Skills', route: '/info/skills', key: 'checksSkills', collection: [
        //   {title: 'Portfolio', done: this.personalInfoDone() },
        //   {title: 'Fähigkeiten', done: this.personalInfoDone() },
        //   {title: 'Zertifizierung', done: this.personalInfoDone() },
        // ]},
      ]
    }
  },
  methods: {
    personalInfoDone() {
      return true
    }
  }
}
</script>

<style lang="scss" scoped>

</style>
