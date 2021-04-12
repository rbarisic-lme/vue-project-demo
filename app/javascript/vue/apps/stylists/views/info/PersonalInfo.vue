<template lang="pug">
  .container
    .row
      .col-12.col-md-4
        v-sheet.px-8.py-4.mb-8.text-center(rounded elevation="2")
          h3.heading-h3.serif.mb-8 Profilbild
          v-btn(elevation="0" fab x-large)
            v-icon.mr-2(color="black") mdi-camera-outline
      .col-12.col-md-8
        v-sheet.px-8.py-4.mb-8(rounded elevation="2")
          h3.heading-h3.serif.mb-8.text-center Über dich
          EditableOverlay
            v-textarea(flat outlined name="about-you" solo auto-grow hide-details)
    .row
      .col-12.col-md-4
        v-sheet.px-8.py-4.mb-8(rounded elevation="2")
          h3.heading-h3.serif.mb-8.text-center Standort
          EditableOverlay(height="100")
            template(v-slot:overlay-text)
              p
                v-icon.mr-2(color="black") mdi-map-marker-outline
                span Adresse
        v-sheet.px-8.py-4.mb-8(rounded elevation="2")
          h3.heading-h3.serif.mb-8.text-center Kommunikation
          EditableOverlay(height="100")
            template(v-slot:overlay-text)
              p
                v-icon.mr-2(color="black") mdi-chat-processing-outline
                span Sprachen
      .col-12.col-md-8
        v-sheet.px-8.py-4.mb-8(rounded elevation="2")
          h3.heading-h3.serif.mb-8.text-center Arbeitsmittel
          EditableOverlay(height="100").mb-4
            template(v-slot:overlay-text)
              p
                v-icon.mr-2(color="black") mdi-domain
                span Marken
          EditableOverlay(height="100")
            template(v-slot:overlay-text)
              p
                v-icon.mr-2(color="black") mdi-leaf
                span Nachhaltige Produkte
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
  .bg-locked {
    background: #d1dee6;
  }
  .text-dark {
    color: #333;
  }
</style>
