<template lang="pug">
  EditableOverlay(height="200")
    template(v-slot:overlay-text)
      .flex-centered.h-100.text-center
        v-icon.mr-2(color="black") mdi-chat-processing-outline
        span.mt-2 Erhöhe deine Chancen und biete weitere Extras an. Die Bräute werden es lieben.
    template(v-slot:default="slotProps")

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
       this.$toast.open({message: 'Leider ist ein Fehler aufgetreten. Versuche es später erneut.', type: 'error'});
      }).finally(result => {
      })
    }
  }
}
</script>

<style lang="scss" scoped>

</style>
