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
                    v-icon(color="red" v-else="check.done") mdi-cross
                    v-btn(text) {{check.title}}

</template>

<script>
export default {
  components: {

  },
  props: {

  },
  data() {
    return {
      checkCategories: [
        {title: 'Persönliche Informationen', key: 'checksPersonal', collection: [
          {title: 'Beschreibung', done: this.personalInfoDone() },
          {title: 'Adresse', done: this.personalInfoDone() },
          {title: 'Sprachen', done: this.personalInfoDone() },
        ]},
        {title: 'Mein Service', key: 'checksPersonal', collection: [
          {title: 'Produkte & Marken', done: this.personalInfoDone() },
          {title: 'Workspace', done: this.personalInfoDone() },
          {title: 'Umkreis', done: this.personalInfoDone() },
          {title: 'Paketpreise', done: this.personalInfoDone() },
          {title: 'Extras', done: this.personalInfoDone() },
        ]},
        {title: 'Unternehmensdaten', key: 'checksBusiness', collection: [
          {title: 'Firmenanschrift', done: this.personalInfoDone() },
        ]},
        {title: 'Skills', key: 'checksSkills', collection: [
          {title: 'Portfolio', done: this.personalInfoDone() },
          {title: 'Fähigkeiten', done: this.personalInfoDone() },
          {title: 'Zertifizierung', done: this.personalInfoDone() },
        ]},
      ],
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
