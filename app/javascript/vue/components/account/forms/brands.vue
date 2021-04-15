<template lang="pug">
  EditableOverlay.mb-4
    template(v-slot:default)
      v-list(subheader)
        v-subheader Marken
        v-list-item(v-for="brand in $store.state.services.brands" :key="brand.name")
          v-list-item-content
            v-list-item-title(v-text="brand.name")

          v-list-item-icon
            v-icon mdi-message-outline
        v-list-item(v-if="brands.length < 1")
          v-list-item-content
            v-list-item-title Füge eine Marke hinzu
      v-form(v-model="valid" ref="form")
        v-text-field(validate-on-blur :rules="newBrandRules" label="Marke hinzufügen" v-model="newBrand" append-icon="mdi-plus" @click:append="addBrand")
    //- template(v-slot:overlay-text)
      p
        v-icon.mr-2(color="black") mdi-domain
        span Marken
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
      brands: this.$store.state.services.brands,
      newBrand: null,
      newBrandRules: [
        // value => !!value || 'wird benötigt.',
        value => (value && value.length >= 2) || 'Min 2 Buchstaben',
        value => !this.brandNames.includes(value) || 'Marke schon vorhanden.',
      ]
    }
  },
  computed: {
    brandNames() {
      return this.brands.map(brand => { return brand.name })
    }
  },
  methods: {
    addBrand() {
      let isValid = this.$refs.form.validate();
      if(isValid) {
        this.brands.push({name: this.newBrand})
        this.newBrand = null
        this.$refs.form.resetValidation()
      }
      // if (this.newBrand && this.newBrand.length > 0 && this.brands.length > 0 && this.brandNames.includes(this.newBrand)) {
      // } else {
      // }
    }
  }
}
</script>

<style lang="scss" scoped>

</style>
