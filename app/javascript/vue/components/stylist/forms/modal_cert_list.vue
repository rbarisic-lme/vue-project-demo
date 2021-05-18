<template lang="pug">
  Modal(name="certListModal" height="auto" :maxWidth="600" :adaptive="true")
    div.m-8.cert-modal
      p Zertifizierungen bearbeiten

      v-list
        v-list-item(v-for="cert in certifications" :key="cert.created_at")
          v-list-item-title {{cert.title}}
          v-list-item-action
            v-btn(icon @click="deleteCert(cert.id)" :loading="$store.state.stylist.dataParsing")
              v-icon mdi-delete

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
  data() {
    return {
    }
  },
  computed: {
    ...mapFields(['certifications'])
  },
  methods: {
    deleteCert(id) {
      this.$store.dispatch('stylist/updateAccount', [
        {name: 'certifications_attributes[]', value: JSON.stringify({
            id: id, '_destroy': true
        })}
      ])
    }
  }
}
</script>

<style lang="scss" scoped>
  .cert-modal {
    max-height: 80vh;
  }

</style>