<template lang="pug">
.container.p-0
  BlockWithInfo(title="Profil Veröffentlichen")
    div(v-if="$store.getters['stylist/readyForPublishing']")
      p Dein Profil ist bereit zur Veröffentlichung.
      v-form(ref="form")
        v-switch(v-model="profile_published" :label="publishedLabel" :loading="$store.state.stylist.dataParsing" :disabled="$store.state.stylist.dataParsing" @click="setPublished")
    div(v-else="$store.getters['stylist/readyForPublishing']")
      p 
        span Dein Profil ist noch nicht zur Veröffentlich bereit.
        br
        span Bitte kontrolliere die&nbsp;
        a(href="/stylists/info/checklist") Checkliste
        span , um zu schauen, welche Angaben noch fehlen.
    v-btn(:href="this.$store.getters['stylist/profileLink']" target="_blank") Profilvorschau

</template>

<script>
import BlockWithInfo from '@/components/block_with_info.vue'

import { createHelpers } from 'vuex-map-fields';
const { mapFields } = createHelpers({
  getterType: 'stylist/getField',
  mutationType: 'stylist/updateField',
});

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
  computed: {
    publishedLabel() {
      return this.profile_published ? 'Öffentlich' : 'Privat'
    },
    ...mapFields(['profile_published'])
  },
  methods: {
    setPublished() {
      this.$store.dispatch('stylist/updateAccount', [
        {name: 'profile_published', value: this.profile_published}
      ])
    }
  }
}
</script>

<style lang="scss" scoped>

</style>
