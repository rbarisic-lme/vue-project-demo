<template lang="pug">
  .container.p-0
    //- .row
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
      .col-12.col-xl-4
        v-sheet.h-100.px-8.py-4.text-center(rounded elevation="2")
          h3.heading-h3.serif Profilbild
          AvatarForm

      .col-12.col-xl-8
        v-sheet.h-100.px-8.py-4(rounded elevation="2")
          h3.heading-h3.serif.text-center Über dich
          AboutYouForm
    .row
      .col-12.col-xl-4
        .pb-6
          v-sheet.px-8.py-4(rounded elevation="2")
            h3.heading-h3.serif.text-center Standort
            p.text-h6
              v-icon.text-h6.mr-2(color="black") mdi-map-marker-outline
              span Adresse
              AddressForm
        .pb-0
          v-sheet.px-8.py-4(rounded elevation="2")
            h3.heading-h3.serif.text-center Kommunikation
            p.text-h6
              v-icon.text-h6.mr-2(color="black") mdi-chat-processing-outline
              span Sprachen
            FormAutocompleteMulti(
              name="language_ids"
              label="Sprachen hinzufügen"
              saveAction="account/updateLanguages"
              getAvailableAction="languages/getLanguages"
              :backendItemsName='["languages", "languages"]'
              :itemsInStoreName='["account", "languages"]'
            )
      .col-12.col-xl-8
        v-sheet.h-100.px-8.py-4(rounded elevation="2")
          h3.heading-h3.serif.text-center Arbeitsmittel
          p.text-h6
            v-icon.text-h6.mr-2(color="black") mdi-domain
            span Marken

          FormAutocompleteMulti(
            name="brand_ids[]"
            label="Marken hinzufügen"
            saveAction="account/updateBrands"
            getAvailableAction="brands/getBrands"
            :backendItemsName='["brands", "brands"]'
            :itemsInStoreName='["account", "brands"]'
          )
          v-divider.my-4
          p.text-h6
            v-icon.text-h6.mr-2(color="black") mdi-leaf
            span Nachhaltige Produkte
          EditableOverlay(height="100")
            template(v-slot:overlay-text)
</template>

<script>
import EditableOverlay from '@/components/editable_overlay.vue'
import { mdiChatProcessingOutline } from '@mdi/js'
import AvatarForm from '@/components/account/forms/avatar.vue'
import AboutYouForm from '@/components/account/forms/about_you.vue'
import AddressForm from '@/components/account/forms/address.vue'
// import BrandsForm from '@/components/account/forms/brands.vue'
import FormAutocompleteMulti from '@/components/account/forms/form_autocomplete_multi.vue'

export default {

  components: {
    EditableOverlay,
    AvatarForm,
    AddressForm,
    AboutYouForm,
    // BrandsForm,
    FormAutocompleteMulti,
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
