<template lang="pug">
  .container
    .row
      .col-12
        v-sheet.px-8.py-4.mb-8(rounded elevation="2")
          h3.heading-h3.serif.mb-8 Unternehmensdaten
          p Diese Angaben sind für die Erstellung Ihrer Rechnungen notwendig. Sie erscheinen nicht auf Ihrem Profil.
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
</template>

<script>
import EditableOverlay from '@/components/editable_overlay.vue'

export default {
  components: {
    EditableOverlay,
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
