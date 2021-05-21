<template lang="pug">
.container.p-0
  BlockWithInfo(title="Unternehmensdaten" :hideImageBlock="true")
    p Diese Angaben sind für die Erstellung Ihrer Rechnungen notwendig. Sie erscheinen nicht auf Ihrem Profil.
    v-row
      v-col(md="8")
        p.body-2.mb-8
          a.sorted-banner(href="https://app.getsorted.de/#anonymous_login" target="_blank")
            img(src="@images/Bridlx_Sorted_mit_Text.png")
            //- div.sorted-banner--text
            //-   span Der perfekte Start in die Selbsständigkeit. Unsere Partner von Sorted helfen dir dabei!
            //-   br
            //-   span #getsorted
            //- img(src="@images/Bridlx_Sorted_ohne_Text.jpg")
    v-row
      v-col(md="8")
        v-form
          v-text-field(v-model="name" label="Firmenname" outlined)
          v-text-field(v-model="city" :rules="fr.stylist.city" label="Stadt" outlined)
          v-text-field(v-model="street" :rules="fr.stylist.street" label="Strasse" outlined)
          v-text-field(v-model="zipcode" :rules="fr.stylist.zipcode" label="Postleitzahl" outlined)
          v-select(select v-model="country" :items="countries" item-value="name" item-text="name" label="Land" outlined)
          v-divider.my-4
          //- v-text-field(v-model="address_extra" label="Adresszusatz" outlined)
          v-select(v-model="legal_form" :rules="fr.basic.presence" :items="legalForms" label="Rechtsform" outlined)
          v-text-field(v-model="tax_id" :rules="fr.basic.presence" label="Steuer-ID" outlined)
          v-text-field(v-model="vat" label="Umsatzsteuernummer (Ust-ID)" outlined)

          v-container
            v-row
              v-text-field(v-model="tax_rate" label="Mehrwertsteuer" placeholder="In der Regel 19%" outlined append-icon="mdi-percent" type="number")
              v-spacer
              v-spacer
              //- v-text-field(label="Umsatzsteuernummer (Ust-ID)" outlined).pl-4
              v-btn(rounded color="primary" x-large @click="save" :loading="loading") Speichern

    template(v-slot:info-text)
      div.img-and-text.mb-8
          img.img-annotation(src="@images/icons/Agreement.png")
          p.body-2 Wir erwarten gegenseitige Transparenz als Schlüssel einer tollen Zusammenarbeit.
      div.img-and-text.mb-8
          img.img-annotation(src="@images/icons/Bankdaten.png")
          p.body-2 Alle Informationen müssen der landesspezifischen Gesetzgebung deiner Rechtsform entsprechen.
      div.img-and-text
          img.img-annotation(src="@images/icons/Gesetz.png")
          p.body-2 Das Steuerrecht deines Landes gilt es einzuhalten.
</template>

<script>
import EditableOverlay from '@/components/editable_overlay.vue'
import BlockWithInfo from '@/components/block_with_info.vue'

import LegalFormsJSON from '@/data/legal_forms.json'
import CountriesJSON from '@/data/countries.json'

import FormRules from '@/data/form_rules.js'

import { createHelpers } from 'vuex-map-fields';

const { mapFields } = createHelpers({
  getterType: 'business/getField',
  mutationType: 'business/updateField',
});

export default {
  components: {
    EditableOverlay,
    BlockWithInfo,
  },
  props: {

  },
  data() {
    return {
      loading: false,
      legalForms: LegalFormsJSON,
      countries: CountriesJSON,
      fr: FormRules,
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
      ]).then(response => {
        location.reload();
      })
      .catch(error => {

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
.sorted-banner {
  display: block;
  max-width: 100%;
  position: relative;
  overflow: hidden;
    &:hover {
      img {
        transform: scale(1.05);
      }
      .overlay-lighten {
        background: rgba(255,255,255,0.1);
      }
    }
  img {
    transition: transform .2s;
  }
  .sorted-banner--text {
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
    position: absolute;
    top: 0;
    left: 10%;
    height: 100%;
    width: 60%;
    color: #fff;
    font-size: 20px;
    font-weight: bold;
  }
}
</style>
