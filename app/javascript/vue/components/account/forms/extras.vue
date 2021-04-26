<template lang="pug">
  EditableOverlay(height="200")
    template(v-slot:default="slotProps")
      v-textarea.mb-4(flat :outlined="!slotProps.overlay" name="about-me" solo auto-grow hide-details placeholder="Beschreibe dich hier mit einem kurzen Text", v-model="about_me" rows="4")
    template(v-slot:hideInactive)
      v-btn(rounded color="primary" @click="save") Speichern
</template>

<script>
import EditableOverlay from '@/components/editable_overlay.vue'
import { createHelpers } from 'vuex-map-fields';

const { mapFields } = createHelpers({
  getterType: 'account/getField',
  mutationType: 'account/updateField',
});

export default {
  components: {
    EditableOverlay
  },
  props: {

  },
  data() {
    return {
    }
  },
  computed: {
    ...mapFields(['extras'])
    // ...mapState('account', ['about_me'])
  },
  methods: {
    save() {
      this.$store.dispatch('account/updateAccount', [
        {name: "about_me", value: this.about_me}
      ]).catch(error => {

      }).finally(result => {
      })
    }
  }
}
</script>

<style lang="scss" scoped>

</style>
