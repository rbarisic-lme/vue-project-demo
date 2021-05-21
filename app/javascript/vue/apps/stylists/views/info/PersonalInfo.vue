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
      .col-12.col-lg-4
        v-sheet.h-100.px-8.py-4.text-center(rounded elevation="2")
          h3.heading-h3.serif.mb-8 Profilbild
          AvatarForm

      .col-12.col-lg-8
        v-sheet.h-100.px-8.py-4(rounded elevation="2")
          h3.heading-h3.serif.text-center.mb-8 Über dich
          AboutYouForm
    .row
      .col-12.col-lg-6.col-xl-4
        .pb-6
          v-sheet.px-8.py-4(rounded elevation="2")
            h3.heading-h3.serif.text-center.mb-8 Standort
            p.text-h6
              v-icon.text-h6.mr-2(color="black") mdi-map-marker-outline
              span Adresse
              AddressForm
        .pb-0
          v-sheet.px-8.py-4(rounded elevation="2")
            h3.heading-h3.serif.text-center.mb-8 Kommunikation
            p.text-h6
              v-icon.text-h6.mr-2(color="black") mdi-chat-processing-outline
              span Sprachen
            FormAutocompleteMulti(
              name="language_ids"
              label="Sprachen hinzufügen"
              saveAction="stylist/updateLanguages"
              getAvailableAction="languages/getLanguages"
              :backendItemsName='["languages", "languages"]'
              :itemsInStoreName='["stylist", "languages"]'
            )
      .col-12.col-lg-6.col-xl-8
        v-sheet.h-100.px-8.py-4(rounded elevation="2")
          h3.heading-h3.serif.text-center.mb-8 Arbeitsmittel
          p.text-h6
            v-icon.text-h6.mr-2(color="black") mdi-domain
            span Marken
          p Wähle die Produkte aus, die du am häufigsten verwendest.

          FormAutocompleteMulti(
            name="brand_ids[]"
            label="Marken hinzufügen"
            saveAction="stylist/updateBrands"
            getAvailableAction="brands/getBrands"
            :backendItemsName='["brands", "brands"]'
            :itemsInStoreName='["stylist", "brands"]'
          )
          v-divider.my-4
          p.text-h6
            v-icon.text-h6.mr-2(color="black") mdi-leaf
            span Nachhaltige Produkte
          SustainableMaterialForm
</template>

<script>
import EditableOverlay from '@/components/editable_overlay.vue'
import { mdiChatProcessingOutline } from '@mdi/js'
import AvatarForm from '@/components/stylist/forms/avatar.vue'
import AboutYouForm from '@/components/stylist/forms/about_you.vue'
import AddressForm from '@/components/stylist/forms/address.vue'
import SustainableMaterialForm from '@/components/stylist/forms/sustainable_materials.vue'
// import BrandsForm from '@/components/stylist/forms/brands.vue'
import FormAutocompleteMulti from '@/components/stylist/forms/form_autocomplete_multi.vue'

export default {

  components: {
    EditableOverlay,
    AvatarForm,
    AddressForm,
    AboutYouForm,
    // BrandsForm,
    SustainableMaterialForm,
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
