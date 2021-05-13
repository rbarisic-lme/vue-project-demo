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
                v-list-item-title
                  v-list-item-title {{child.text}}

                v-list-item-icon(v-if="child.tooltip")
                  v-tooltip(bottom)
                    template(v-slot:activator="{ on, attrs }")
                      v-icon(v-bind="attrs" v-on="on") mdi-information
                    span {{child.tooltip}}

            v-list-item(v-for="item in plainItems" :key="item.text" link :to="item.url" :disabled="item.disabled")
              v-list-item-title
                v-list-item-title {{item.text}}
      .col-12.col-md-8.offset-lg-1
        router-view
</template>

<script>

import { createHelpers } from 'vuex-map-fields';
const { mapFields } = createHelpers({
  getterType: 'stylist/getField',
  mutationType: 'stylist/updateField',
});

export default {
  components: {

  },
  props: {

  },
  mounted() {
  },
  data() {
    return {
    }
  },
  computed: {
    treeItems() {
      return [
        {
          text: "Profil", url: 'profile', items: [
            {url: 'personal-information', text: 'Persönliche Informationen'},
            {url: 'my-service', text: 'Mein Service'},
          ]
        },
        { text: "Mein Business", url: 'business', items: [
            {url: 'company-data', text: 'Unternehmensdaten'},
            {url: 'bank-account', text: 'Bankverbindung', disabled: false},
            {url: 'verification', text: 'Nachweise', disabled: !this.ready_for_kyc},
          ]
        },
      ]
    },
    plainItems() {
      return [
        { url: '/info/skills', text: "Skills", disabled: true},
        { url: '/info/checklist', text: "Checkliste"},
      ]
    },
    ...mapFields(['ready_for_kyc'])
  }
}
</script>

<style lang="scss" scoped>

</style>
