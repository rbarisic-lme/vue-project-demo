<template lang="pug">
  EditableOverlay(height="200" ref="overlay")
    template(v-slot:overlay-text)
      .flex-centered.h-100.text-center(v-if="extras.length < 1")
        v-icon.mr-2(color="black") mdi-chat-processing-outline
        span.mt-2 Erhöhe deine Chancen und biete weitere Extras an. Die Bräute werden es lieben.
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
      v-form(v-model="valid").overflow-y-scroll.extras-form
        div.d-flex.extra-list(v-for="item in extrasJson")
          v-list-item(dense)
            v-list-item-content
              div
                v-checkbox(v-model="extras" :value="item.id" :label="$t(item.label || item.name)")
              div()
                v-text-field(v-model="extras" :rules="extras.includes(item.id) ? fr.stylist.extra_item : []" :disabled="!extras.includes(item.id)" :label="$t('form.label.price')" append-icon="mdi-currency-eur" :placeholder="$t('form.placeholder.extra_item')")
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
      extrasJson: ExtrasJSON,
      valid: false,
    }
  },
  computed: {
    ...mapFields(['extras'])
    // ...mapState('account', ['about_me'])
  },
  methods: {
    save() {
      this.$store.dispatch('stylist/updateAccount', [
        {name: "about_me", value: this.about_me}
      ]).then(result => {
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
