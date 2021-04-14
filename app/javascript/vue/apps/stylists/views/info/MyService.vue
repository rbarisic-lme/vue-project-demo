<template lang="pug">
  .container
    .row
      .col-12.col-md-4
        v-sheet.px-8.py-4.mb-8.text-center(rounded elevation="2")
          h3.heading-h3.serif.mb-8 Auftragspräferenzen
          EditableOverlay.mb-4(height="100")
            template(v-slot:overlay-text)
              p
                v-icon.mr-2(color="black") mdi-home-city-outline
                span Workspace
          EditableOverlay(height="100")
            template(v-slot:overlay-text)
              p
                v-icon.mr-2(color="black") mdi-compass-outline
                span Umkreis
      .col-12.col-md-8
        v-sheet.px-8.py-4.mb-8(rounded elevation="2")
          h3.heading-h3.serif.mb-8.text-center Pakete
          EditableOverlay
            v-textarea(flat outlined name="about-you" solo auto-grow hide-details)
    .row
      .col-12
        v-sheet.px-8.py-4.mb-8(rounded elevation="2")
          h3.heading-h3.serif.mb-8.text-center Standort
          EditableOverlay(height="100")
            template(v-slot:overlay-text)
              p
                v-icon.mr-2(color="black") mdi-map-marker-outline
                span Adresse
        v-sheet.px-8.py-4.mb-8(rounded elevation="2")
          h3.heading-h3.serif.mb-8.text-center Extras
          EditableOverlay(height="200")
            template(v-slot:overlay-text)
              p
                v-icon.mr-2(color="black") mdi-chat-processing-outline
                span Erhöhe deine Chancen und biete weitere Extras an. Die Bräute werden es lieben.
</template>

<script>
import EditableOverlay from '@/components/editable_overlay.vue'
import { mdiChatProcessingOutline } from '@mdi/js';

export default {
  components: {
    EditableOverlay
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
