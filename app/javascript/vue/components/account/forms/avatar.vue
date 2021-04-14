<template lang="pug">
  div
    v-btn(elevation="0" fab x-large)
      v-icon.mr-2(color="black") mdi-camera-outline
    v-file-input(v-model="avatar" accept="image/png, image/jpeg, image/bmp" placeholder="Profilbild hochladen" prepend-icon="mdi-camera" label="Profilbild")
    v-btn(elevation="0" rounded v-if="avatarSize > 0" color="primary" @click="uploadAvatar") Speichern
</template>

<script>

export default {
  components: {

  },
  props: {

  },
  data() {
    return {
      avatar: new Blob,
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
      this.$store.dispatch("account/updateAvatar", this.avatar)

    }
  }
}
</script>

<style lang="scss" scoped>

</style>
