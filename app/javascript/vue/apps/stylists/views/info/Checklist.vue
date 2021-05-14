<template lang="pug">
.container.p-0
  BlockWithInfo(title="Checkliste")
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
    template(v-slot:info-image)
      img(style="" src="@images/icons/Rakete.png" width="92")
    template(v-slot:info-text)
      span Alle Punkte abgehakt? Ready, steady, go!
</template>

<script>
import {mapGetters} from 'vuex';
import BlockWithInfo from '@/components/block_with_info.vue'

export default {
  components: {
    BlockWithInfo
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
          {title: 'Beschreibung', done: this.$store.state.stylist.about_me != null },
          {title: 'Adresse', done: this.$store.getters['stylist/addressPresent'] },
          {title: 'Sprachen', done: this.$store.state.stylist.languages.length > 0 },
        ]},
        {title: 'Mein Service', route: '/info/profile/my-service', key: 'checksPersonal', collection: [
          {title: 'Produkte & Marken', done: this.$store.state.stylist.brands.length > 0 },
          {title: 'Workspace', done: this.$store.getters['stylist/workspacePresent'] },
          {title: 'Umkreis', done: this.$store.state.stylist.service_radius != null },
          {title: 'Paketpreise', done: this.$store.getters['stylist/servicePackagePricesPresent'] },
          {title: 'Extras', done: this.$store.state.stylist.extras.length > 0 },
        ]},
        {title: 'Unternehmensdaten', route: '/info/business/company-data', key: 'checksBusiness', collection: [
          {title: 'Firmenanschrift', done: this.$store.getters['business/businessDataComplete'] },
        ]},
        {title: 'Bankkonto', route: '/info/business/bank-account', key: 'checksBankAccount', collection: [
          {title: 'Kontodaten', done: this.$store.getters['bankAccount/dataComplete']}
          ]
        },
        {title: 'Nachweise (Verifikation)', route: '/info/business/verification', key: 'checksKyc', collection: [
          {title: 'Verifizierung', done: this.$store.getters['stylist/verificationComplete']},
          {title: 'Bestätigung', done: this.$store.state.stylist.invoice_mandate_accepted},
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
