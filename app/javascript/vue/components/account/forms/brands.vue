<template lang="pug">
  EditableOverlay(:clickPen="getAvailableBrands")
    template(v-slot:default="slotProps")

      v-form(v-model="valid" ref="form" @submit="saveBrands" @submit.prevent)
        v-autocomplete(
          :loading="!slotProps.overlay && availableBrands < 1"
          name="brands[]"
          :rules="newBrandRules" :label="slotProps.hideOverlay ? 'Marken hinzufügen' : ''"
          v-model="brands"
          :items="availableBrands"
          item-text="name"
          item-value="id"
          chips deletable-chips
          multiple
        )
        v-btn(color="primary" @click="saveBrands" :disabled="!valid" :loading="loading") Speichern
      //- v-list(class="overflow-y-auto")
        //- v-subheader Marken
        //- v-list-item(v-for="brand in $store.state.services.brands" :key="brand.name")
        //-   v-list-item-content
        //-     v-list-item-title(v-text="brand.name")

        //-   v-list-item-icon
        //-     v-icon mdi-message-outline
        //- v-list-item(v-if="brands.length < 1")
        //-   v-list-item-content
        //-     v-list-item-title Füge eine Marke hinzu
    template(v-slot:hideInactive)

      //- v-list-item
      //-   v-list-item-content
      //-     v-form(v-model="valid" ref="form" @submit="addBrand" @submit.prevent)
      //-       v-text-field(validate-on-blur :rules="newBrandRules" label="Marke hinzufügen" v-model="newBrand" append-icon="mdi-plus" @click:append="addBrand")
    //- template(v-slot:overlay-text)
</template>

<script>
import EditableOverlay from '@/components/editable_overlay.vue'

export default {
  components: {
    EditableOverlay
  },
  props: {

  },
  data() {
    return {
      valid: false,
      loading: false,
      newBrandRules: [
        // value => !!value || 'wird benötigt.',
        // value => (value && value.length >= 2) || 'Min 2 Buchstaben',
        value => !this.brandNames.includes(value) || 'Marke schon vorhanden.',
        value => value.length <= 10 || `Maximal 10 erlaubt. Bitte wähle ${value.length - 10} ab.`,
      ]
    }
  },
  computed: {
    availableBrands() {
      if (this.$store.state.brands.brands.length > 0) {
        return this.$store.state.brands.brands
      } else {
        return this.$store.state.account.brands 
      }
    },
    brandNames() {
      return this.brands.map(brand => { return brand.name })
    },
    brands() {
      return this.$store.state.account.brands 
    }
  },
  methods: {
    getAvailableBrands() {
      this.$store.dispatch('brands/getBrands')
    },
    isValid() {
      return this.$refs.form.validate();
    },
    saveBrands() {
      if(this.isValid()) {
        this.loading = true
        this.$store.dispatch('account/updateBrands', this.brands).catch(error => {
          console.log(error)
        })
        .finally(() => {
          setTimeout(() => {
            this.loading = false
          }, 1000)
        })
      }      
    },
  },
}
</script>

<style lang="scss" scoped>

</style>
