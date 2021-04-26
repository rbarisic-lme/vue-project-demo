<template lang="pug">
  .container.p-0
    .row
      .col-12.col-lg-5
        .h-100
          v-sheet.px-8.py-4.mb-8(rounded elevation="2")
            h3.heading-h3.serif.mb-8 Auftragspräferenzen
            p.text-h6
              v-icon.text-h6.mr-2(color="black") mdi-home-city-outline
              span Workspace
            AddressForm
            v-divider.my-8
            p.text-h6
              v-icon.text-h6.mr-2(color="black") mdi-compass-outline
              span Umkreis
            RadiusForm
      .col-12.col-lg-7
        .h-100
          v-sheet.px-8.py-4.mb-8(rounded elevation="2")
            h3.heading-h3.serif.mb-8 Pakete
            PackagesForm
    .row
      .col-12
        v-sheet.px-8.py-4.mb-8(rounded elevation="2")
          h3.heading-h3.serif.mb-8.text-center Extras
          ExtrasForm
          EditableOverlay(height="200")
            template(v-slot:overlay-text)
              p
                v-icon.mr-2(color="black") mdi-chat-processing-outline
                span Erhöhe deine Chancen und biete weitere Extras an. Die Bräute werden es lieben.
</template>

<script>
import EditableOverlay from '@/components/editable_overlay.vue'
import AddressForm from '@/components/account/forms/address.vue'
import ExtrasForm from '@/components/account/forms/extras.vue'
import RadiusForm from '@/components/account/forms/radius.vue'
import PackagesForm from '@/components/account/forms/packages.vue'

import { mdiChatProcessingOutline } from '@mdi/js';

export default {
  components: {
    EditableOverlay,
    AddressForm,
    ExtrasForm,
    RadiusForm,
    PackagesForm,
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
