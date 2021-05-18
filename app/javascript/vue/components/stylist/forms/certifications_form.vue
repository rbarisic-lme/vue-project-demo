<template lang="pug">
  div
    BlockWithInfo(title="Zertifizierungen")
      div(v-if="certifications.length < 1")
        p.lead Lass dir deine Skills bestätigen
      div(v-else="certifications.length < 1")
        div(v-for="cert in certifications")
          div {{cert.title}}

      template(v-slot:info-text)      
        span Dein Können wurde bereits prämiert- Gratulation! Teile es mit deinen Kunden.
      template(v-slot:info-image)      
        img(style="" src="@images/icons/Zertifikat.png" width="92")
      template(v-slot:actions)
        v-btn.mr-2(v-if="certifications.length > 0" rounded @click="$modal.show('certListModal')") Bearbeiten
        v-btn(color="primary" rounded @click="$modal.show('certModal')") Hinzufügen
    ModalCertList(v-if="certifications.length > 0")
    ModalNewCert
</template>

<script>
import BlockWithInfo from '@/components/block_with_info.vue'
import ModalNewCert from '@/components/stylist/forms/modal_new_cert.vue'
import ModalCertList from '@/components/stylist/forms/modal_cert_list.vue'

import { createHelpers } from 'vuex-map-fields';
const { mapFields } = createHelpers({
  getterType: 'stylist/getField',
  mutationType: 'stylist/updateField',
});

export default {
  components: {
    BlockWithInfo,
    ModalNewCert,
    ModalCertList,
  },
  props: {

  },
  data() {
    return {
      
    }
  },
  computed: {
    ...mapFields(['certifications'])
  }
}
</script>

<style lang="scss" scoped>

</style>
