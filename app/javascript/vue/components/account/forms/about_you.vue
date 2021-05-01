<template lang="pug">
  EditableOverlay(height="200")
    template(v-slot:default="slotProps")
      v-textarea.mb-4(flat :outlined="!slotProps.overlay" name="about-me" solo auto-grow hide-details placeholder="Beschreibe dich hier mit einem kurzen Text", v-model="about_me" rows="4")
    template(v-slot:hideInactive)
      v-btn(rounded color="primary" @click="save" :loading="loading" :disabled="loading") Speichern
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
      loading: false
    }
  },
  computed: {
    ...mapFields(['about_me'])
    // ...mapState('account', ['about_me'])
  },
  methods: {
    save() {
      this.loading = true

      this.$store.dispatch('account/updateAccount', [
        {name: "about_me", value: this.about_me}
      ]).then(response => {
        this.$toast.open('Beschreibung erfolgreich hochgeladen');
      })
      .catch(error => {
        this.$toast.open({message: 'Leider ist ein Fehler aufgetreten. Versuche es später erneut.', type: 'error'});
      }).finally(result => {
        this.loading = false
      })
    }
  }
}
</script>

<style lang="scss" scoped>

</style>
