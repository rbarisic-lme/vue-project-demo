<template lang="pug">
  EditableOverlay(height="200" ref="overlay")
    template(v-slot:overlay-text)
      .flex-centered.h-100.text-center
        div(v-if="available_extras.length < 1")
          v-icon.mr-2(color="black") mdi-chat-processing-outline
          span.mt-2 Erhöhe deine Chancen und biete weitere Extras an. Die Bräute werden es lieben.

        div(v-else="available_extras.length < 1")
          span {{available_extras.length}} Angebot(e)
    template(v-slot:default="slotProps")

      //- v-form(v-model="valid" ref="form" @submit="save" @submit.prevent)
      //-   v-autocomplete(
      //-     :loading="!slotProps.overlay && extrasJson < 1"
      //-     name="brand_ids[]"
      //-     :rules="fr.stylist.service_extras" :label="slotProps.hideOverlay ? 'Marken hinzufügen' : ''"
      //-     v-model="extras"
      //-     :items="extrasJson"
      //-     item-text="name"
      //-     item-value="id"
      //-     chips deletable-chips
      //-     multiple
      //-   )
  


    template(v-slot:hideInactive)
      p.lead Wähle die Extras aus, die du den Bräuten anbieten möchtest.
      p Diese können optional dazugebucht werden.
      v-form(v-model="valid").overflow-y-scroll.extras-form
        v-container
          //- div.d-flex.extra-list(v-for="item in extrasJson")
          v-row(v-for="item in extrasJson")
            //- v-list-item(dense)
              v-list-item-content
            v-col
              v-checkbox(v-model="available_extra_ids" :value="item.id" :label="$t(`form.label.service_extra.${item.name}`)")              
            v-col
              v-text-field( :rules="available_extra_ids.includes(item.id) ? fr.stylist.extra_item : []" :disabled="!available_extra_ids.includes(item.id)" :label="$t('form.label.price')" append-icon="mdi-currency-eur" :placeholder="$t('form.placeholder.extra_item')" :ref="'available_extra_field_'+item.id" v-model="available_extra_values[item.id]")
      v-divider.my-4
      v-btn(rounded color="primary" @click="save" :disabled="!valid" :loading="$store.state.stylist.dataParsing") Speichern
</template>

<script>
import EditableOverlay from '@/components/editable_overlay.vue'
import { createHelpers } from 'vuex-map-fields'
import FormRules from '@/data/form_rules.js'
import ExtrasJSON from '@/data/service_extras.json'

const { mapFields } = createHelpers({
  getterType: 'stylist/getField',
  mutationType: 'stylist/updateField',
});

export default {
  components: {
    EditableOverlay
  },
  props: {

  },
  data() {
    return {
      fr: FormRules,
      extrasJson: [],
      valid: false,
    }
  },
  computed: {
    ...mapFields(['extras', 'available_extras', 'available_extra_ids', 'available_extra_values'])
    // ...mapState('account', ['about_me'])
  },
  mounted() {
    this.$store.dispatch('stylist/getExtrasList').then(result => {
      this.extrasJson = result.data
    })
  },
  methods: {
    calculateAvailableExtras() {
      let array = []

      this.available_extra_ids.forEach(id => {
        let price = this.available_extra_values[id]

        let included = this.available_extras.filter(item => {
          if (item['id']) {
            return item.service_extra_id == id
          }
        })

        if (included.length > 0) {
          let updatedExtra = included[0]

          delete updatedExtra.created_at
          delete updatedExtra.updated_at

          updatedExtra.price = this.available_extra_values[updatedExtra.service_extra_id]

          array.push(updatedExtra)
        } else {
          array.push({service_extra_id: id, price: price})
        }
      })

      // this.$store.dispatch('stylist/setAvailableExtras', array)
      // this.available_extras = array
      return array
    },
    save() {
      let tempExtras = this.calculateAvailableExtras()
      this.$store.dispatch('stylist/updateAvailableExtras', tempExtras).then(result => {
        this.$refs.overlay.resetOverlay()
      })
    }
  }
}
</script>

<style lang="scss" scoped>
  .extras-form {
    height: 400px;
  }

</style>
