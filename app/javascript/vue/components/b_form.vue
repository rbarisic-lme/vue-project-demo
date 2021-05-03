<template lang="pug">
  div
    v-form(v-model="valid" ref="form").mb-8
      slot(name="fields")
        div(v-for="field in fields" :key="field.name")
          div(v-if="field.type == 'text'")
            v-text-field(:rules="field.rules" :name="field.name" :label="$t('form.label.' + field.name)" :model="getFieldName(field.name)")
            //- div {{formDataFields}}

    slot(name="buttons")
      v-btn(rounded color="primary" @click="save" :loading="loading" :disabled="!valid") Speichern
</template>

<script>
import EditableOverlay from '@/components/editable_overlay.vue'
import { createHelpers } from 'vuex-map-fields';

import FormRules from '@/data/form_rules.js';

const { mapFields } = createHelpers({
  getterType: 'stylist/getField',
  mutationType: 'stylist/updateField',
});

export default {
  components: {
    EditableOverlay
  },
  props: [
    'action', 'fields'
  ],
  data() {
    return {
      valid: false,
      loading: false,
    }
  },
  computed: {
    // fieldNames() {
    //   return this.fields.map(field => {
    //     return field.name
    //   })
    // },
    // formDataFields() {
    //   return this.fields.map(field => {
    //     return {name: field.name, value: this[field.name]}
    //   })
    // },
    ...mapFields(fieldNames)
  },
  mounted() {
    console.log(this)
  },
  methods: {
    getFieldName(val) {
      return this[val]
    },
    save() {
      if(this.$refs.form.validate()) {
        this.loading = true

        this.$store.dispatch(this.action, this.formDataFields)
        .then(result => {
          this.$toast.open('Adresse erfolgreich geupdated')
        })
        .catch(error => {
         this.$toast.open({message: 'Leider ist ein Fehler aufgetreten. Versuche es später erneut.', type: 'error'});
        }).finally(result => {
          this.loading = false
        })
      }
    }
  },
}
</script>

<style lang="scss" scoped>

</style>
