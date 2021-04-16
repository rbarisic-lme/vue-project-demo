<template lang="pug">
  .container.p-0
    .row
      .col-12
        .h-100
          v-sheet.px-8.py-4.mb-8(rounded elevation="2")
            h3.heading-h3.serif.mb-8 Unternehmensdaten
            p Diese Angaben sind für die Erstellung Ihrer Rechnungen notwendig. Sie erscheinen nicht auf Ihrem Profil.
            p.body-2.mb-8
              span Zu kompliziert? Lassen Sie sich den Vorgang von unserem Partner
              a(href="#")
                |  GetSorted
              span
                |  vereinfachen.
            v-row
              v-col(md="8")
                v-form
                  v-text-field(v-model="name" label="Firmenname" outlined)
                  v-text-field(v-model="city" label="Stadt" outlined)
                  v-text-field(v-model="street" label="Strasse" outlined)
                  v-text-field(v-model="zipcode" label="Postleitzahl" outlined)
                  v-text-field(v-model="country" label="Land" outlined)
                  //- v-text-field(v-model="address_extra" label="Adresszusatz" outlined)
                  v-select(v-model="legal_form" :items="legalForms" label="Rechtsform" outlined)
                  v-text-field(v-model="tax_id" label="Steuer-ID" outlined)
                  v-text-field(v-model="vat" label="Umsatzsteuernummer (Ust-ID)" outlined)

                  v-container
                    v-row
                      v-text-field(v-model="tax_rate" label="Mehrwertsteuer" placeholder="In der Regel 19%" outlined append-icon="mdi-percent" type="number")
                      v-spacer
                      v-spacer
                      //- v-text-field(label="Umsatzsteuernummer (Ust-ID)" outlined).pl-4
                      v-btn(color="primary" x-large @click="save" :loading="loading") Speichern
              v-col(md="3")
                v-row
                  v-col(sm="12" md="6").d-flex.justify-center.align-center
                    img.img-annotation(src="@images/icons/bridlx icon complete set_page_25.svg")
                  v-col(sm="12" md="6")
                    p.body-2 Wir erwarten gegenseitige Transparenz als Schlüssel einer tollen Zusammenarbeit.
                v-row
                  v-col(sm="12" md="6").d-flex.justify-center.align-center
                    img.img-annotation(src="@images/icons/bridlx icon complete set_page_16.svg")
                  v-col(sm="12" md="6")
                    p.body-2 Alle Informationen müssen der landesspezifischen Gesetzgebung deiner Rechtsform entsprechen.
                v-row
                  v-col(sm="12" md="6").d-flex.justify-center.align-center
                    img.img-annotation(src="@images/icons/bridlx icon complete set_page_31.svg")
                  v-col(sm="12" md="6")
                    p.body-2 Das Steuerrecht deines Landes gilt es einzuhalten.
</template>

<script>
import EditableOverlay from '@/components/editable_overlay.vue'

import LegalFormsJSON from '@/data/legal_forms.json'

import { createHelpers } from 'vuex-map-fields';

const { mapFields } = createHelpers({
  getterType: 'business/getField',
  mutationType: 'business/updateField',
});

export default {
  components: {
    EditableOverlay,
  },
  props: {

  },
  data() {
    return {
      loading: false,
      legalForms: LegalFormsJSON
    }
  },
  computed: {
    ...mapFields(["name", "city", "street", "zipcode", "country", "address_extra", "legal_form", "tax_id", "vat", "tax_rate"])
  },
  methods: {
    save() {
      this.loading = true
      this.$store.dispatch('business/updateBackend', [
        {name: "name", value: this.name},
        {name: "city", value: this.city},
        {name: "street", value: this.street},
        {name: "zipcode", value: this.zipcode},
        {name: "country", value: this.country},
        // {name: "address_extra", value: this.address_extra},
        {name: "legal_form", value: this.legal_form},
        {name: "tax_id", value: this.tax_id},
        {name: "vat", value: this.vat},
        {name: "tax_rate", value: this.tax_rate},
      ]).catch(error => {

      }).finally(result => {
        setTimeout(() => {this.loading = false}, 1000)
      })
    }
  }
}
</script>

<style lang="scss" scoped>
.img-annotation {
 width: 48px; 
}
</style>
