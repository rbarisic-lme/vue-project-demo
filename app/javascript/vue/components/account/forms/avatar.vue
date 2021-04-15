<template lang="pug">
  div
    Avatar(size="120").mb-4
    v-file-input(v-model="avatar" accept="image/png, image/jpeg, image/bmp" placeholder="Profilbild hochladen" prepend-icon="mdi-camera" label="Profilbild")
    v-btn(elevation="0" rounded v-if="avatarSize > 0" color="primary" @click="uploadAvatar" :loading="loading") Speichern
    v-snackbar(v-model="snackbar")
      span {{snackbarContent}}
      template(v-slot:action="{attrs}")
        v-btn(color="pink" text v-bind="attrs" @click="snackbar = false") schliessen
</template>

<script>
import Avatar from '@/components/stylist/avatar.vue'

export default {
  components: {
    Avatar
  },
  props: {

  },
  data() {
    return {
      snackbar: false,
      snackbarContent: null,
      loading: false,
      avatar: null,
      rules: [
        value => !value || value.size < 2000000 || 'Avatar size should be less than 2 MB!',
      ],
    }
  },
  computed: {
    avatarSize() {
      if (this.avatar === null) {
        return 0
      } else {
        return this.avatar.size
      }
    }
  },
  mounted() {
  },
  methods: {
    uploadAvatar() {
      this.loading = true

      this.$store.dispatch("account/updateAvatar", this.avatar).catch((error) => {
        // this.snackbarContent = `Fehler: ${error.message}`
        this.snackbarContent = 'Leider ist ein Fehler aufgetreten.'
        this.snackbar = true
      }).finally(response => {
        this.avatar = null
        this.loading = false
      })
    }
  }
}
</script>

<style lang="scss" scoped>

</style>
