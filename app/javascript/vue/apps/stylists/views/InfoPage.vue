<template lang="pug">
  .container
    .row
      .col-12.col-md-3
        v-sheet.px-8.py-4.mb-8(rounded elevation="2")
          h1 {{$route.name}}
          v-list
            v-list-group(no-action v-for="(item, i) in treeItems" v-bind:key="item.text" :value="$route.path.toString().match('/'+item.url+'/')")
              template(v-slot:activator)
                v-list-item-title {{item.text}}
              v-list-item(v-for="child in item.items" :key="child.text" :disabled="child.disabled" link :to="'/info/' + item.url + '/' + child.url")
                v-list-item-content
                  v-list-item-title {{child.text}}
            v-list-item(v-for="item in plainItems" :key="item.text" link :to="item.url" :disabled="item.disabled")
              v-list-item-content
                v-list-item-title {{item.text}}
      .col-12.col-md-8.offset-lg-1
        router-view
</template>

<script>
export default {
  components: {

  },
  props: {

  },
  mounted() {
  },
  data() {
    return {
      treeItems: [
        {
          text: "Profil", url: 'profile', items: [
            {url: 'personal-information', text: 'Persönliche Informationen'},
            {url: 'my-service', text: 'Mein Service'},
          ]
        },
        { text: "Mein Business", url: 'business', items: [
            {url: 'company-data', text: 'Unternehmensdaten'},
            {url: 'bank-account', text: 'Bankverbindung', disabled: true},
            {url: 'verification', text: 'Nachweise', disabled: true},
          ]
        },
      ],
      plainItems: [
        { url: '/info/skills', text: "Skills", disabled: true},
        { url: '/info/checklist', text: "Checkliste", disabled: true},
      ]
    }
  }
}
</script>

<style lang="scss" scoped>

</style>
