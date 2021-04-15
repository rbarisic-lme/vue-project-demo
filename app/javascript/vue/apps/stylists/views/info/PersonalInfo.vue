<template lang="pug">
  .container
    .row
      .col-12
        v-card.p-4
          v-banner(single-line sticky)
            span Alle aktuellen Änderungen speichern
            template(v-slot:actions)
              v-btn(color="primary") Speichern
        //- v-card.p-4.pb-2
          v-banner
            p Alle Änderungen speichern
    .row
      .col-12.col-md-4
        v-sheet.h-100.px-8.py-4.mb-8.text-center(rounded elevation="2")
          h3.heading-h3.serif.mb-8 Profilbild
          AvatarForm

      .col-12.col-md-8
        v-sheet.h-100.px-8.py-4.mb-8(rounded elevation="2")
          h3.heading-h3.serif.mb-8.text-center Über dich
          EditableOverlay(height="200")
            template(v-slot:default="slotProps")
              v-textarea.mb-4(flat :outlined="!slotProps.overlay" name="about-me" solo auto-grow hide-details placeholder="Beschreibe dich hier mit einem kurzen Text")
            template(v-slot:hideInactive)
              v-btn(rounded color="primary") Speichern
    .row
      .col-12.col-md-4
        v-sheet.h-50.px-8.py-4.mb-8(rounded elevation="2")
          h3.heading-h3.serif.mb-8.text-center Standort
          EditableOverlay(height="100")
            template(v-slot:overlay-text)
              p
                v-icon.mr-2(color="black") mdi-map-marker-outline
                span Adresse
        v-sheet.h-50.px-8.py-4.mb-8.mb-8(rounded elevation="2")
          h3.heading-h3.serif.mb-8.text-center Kommunikation
          EditableOverlay(height="100")
            template(v-slot:overlay-text)
              p
                v-icon.mr-2(color="black") mdi-chat-processing-outline
                span Sprachen
      .col-12.col-md-8
        v-sheet.h-100.px-8.py-4.mb-8(rounded elevation="2")
          h3.heading-h3.serif.mb-8.text-center Arbeitsmittel
          BrandsForm
          //- EditableOverlay(height="100").mb-4
          EditableOverlay(height="100")
            template(v-slot:overlay-text)
              p
                v-icon.mr-2(color="black") mdi-leaf
                span Nachhaltige Produkte
</template>

<script>
import EditableOverlay from '@/components/editable_overlay.vue'
import { mdiChatProcessingOutline } from '@mdi/js'
import AvatarForm from '@/components/account/forms/avatar.vue'
import BrandsForm from '@/components/account/forms/brands.vue'

export default {

  components: {
    EditableOverlay,
    AvatarForm,
    BrandsForm,
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
