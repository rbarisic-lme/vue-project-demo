<template lang="pug">
  BlockWithInfo(title="Portfolio")
    template(v-slot:info-text)      
      span Das Portfolio ist dein persönliches Aushängeschild und dient primär zur Entscheidungsfindung zukünftiger Kunden. Teile deine Highlights mit uns!
    template(v-slot:info-image)      
      img(style="" src="@images/icons/Profilsichtbarkeit.png" width="92")
    template(v-slot:actions)
      v-btn(color="primary" rounded @click="$modal.show('skillsModal')") Hinzufügen
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
    BlockWithInfo,
  },
  props: {

  },
  data() {
    return {
      
    }
  }
}
</script>

<style lang="scss" scoped>

</style>
