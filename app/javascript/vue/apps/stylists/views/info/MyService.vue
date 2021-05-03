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
            WorkspaceAddressForm
            v-divider.my-8
            p.text-h6
              v-icon.text-h6.mr-2(color="black") mdi-compass-outline
              span Umkreis
            RadiusForm
      .col-12.col-lg-7
        .h-100
          v-sheet.px-8.py-4.mb-8(rounded elevation="2")
            h3.heading-h3.serif.mb-8.text-center Extras
            ExtrasForm
    .row
      .col-12
        v-sheet.px-8.py-4.mb-8(rounded elevation="2")
          h3.heading-h3.serif.mb-8 Pakete
          PackagesForm
</template>

<script>
import EditableOverlay from '@/components/editable_overlay.vue'
import WorkspaceAddressForm from '@/components/stylist/forms/workspace_address.vue'
import ExtrasForm from '@/components/stylist/forms/extras.vue'
import RadiusForm from '@/components/stylist/forms/radius.vue'
import PackagesForm from '@/components/stylist/forms/packages.vue'

import { mdiChatProcessingOutline } from '@mdi/js';

export default {
  components: {
    EditableOverlay,
    WorkspaceAddressForm,
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
