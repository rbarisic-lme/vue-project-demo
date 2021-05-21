<template lang="pug">
  EditableOverlay(height="200" ref="overlay")
    template(v-slot:default="slotProps")
      v-form(v-model="valid" ref="form")
    template(v-slot:overlay-text)
      .p-4 {{aboutMeMini}}
    template(v-slot:hideInactive)
      v-textarea.mb-4(flat outlined name="about-me" solo auto-grow hide-details placeholder="Hallo ich bin Hannah, 32 Jahre alt und bereits seit 11 Jahren leidenschaftlich als Make-up Artistin und Hairstylistin tätig. Es ist für mich eine große Erfüllung die innere Schönheit einer jeden Frau für diesen besonderen Tag zu unterstreichen und sie in ihrer schönsten Facette erstrahlen zu lassen. Bei mir bleiben keine Wünsche unerfüllt, da ich neben klassischen Looks auch stets aktuelle Make-up und Hairstyling Trends aufgreife. Bei Fragen zu den angebotenen Extras kannst du dich jederzeit vorab melden.", v-model="about_me" rows="4")
      v-btn(rounded color="primary" @click="save" :loading="$store.state.stylist.dataParsing" :disabled="!valid") Speichern
</template>

<script>
import EditableOverlay from '@/components/editable_overlay.vue'
import { createHelpers } from 'vuex-map-fields';

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
      valid: false,
      loading: false
    }
  },
  computed: {
    aboutMeMini() {
      if(this.about_me) {
        return this.about_me.slice(0,100)
      } else {
        return ''
      }
    },
    ...mapFields(['about_me'])
    // ...mapState('account', ['about_me'])
  },
  methods: {
    save() {
      if(this.$refs.form.validate()) {
        this.$store.dispatch('stylist/updateAccount', [
          {name: "about_me", value: this.about_me},
        ]).then(() => {
          this.$refs.overlay.resetOverlay()
        })
      }
    }
  }
}
</script>

<style lang="scss" scoped>

</style>
