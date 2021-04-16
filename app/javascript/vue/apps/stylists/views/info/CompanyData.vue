<template lang="pug">
  .container.p-0
    .row
      .col-12.col-lg-6
        .h-100
          v-sheet.px-8.py-4.mb-8(rounded elevation="2")
            h3.heading-h3.serif.mb-8 Unternehmensdaten
            p Diese Angaben sind für die Erstellung Ihrer Rechnungen notwendig. Sie erscheinen nicht auf Ihrem Profil.
            p.text-h6
              v-icon.text-h6.mr-2(color="black") mdi-home-city-outline
              span Workspace
            AddressForm
            v-divider.my-8
            p.text-h6
              v-icon.text-h6.mr-2(color="black") mdi-compass-outline
              span Umkreis
            EditableOverlay(height="100")
      .col-12.col-lg-6
        .h-100
          v-sheet.px-8.py-4.mb-8(rounded elevation="2")
            h3.heading-h3.serif.mb-8 Pakete
            PackagesForm
</template>

<script>
import EditableOverlay from '@/components/editable_overlay.vue'
import AddressForm from '@/components/account/forms/address.vue'
import PackagesForm from '@/components/account/forms/packages.vue'

export default {
  components: {
    EditableOverlay,
    AddressForm,
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
