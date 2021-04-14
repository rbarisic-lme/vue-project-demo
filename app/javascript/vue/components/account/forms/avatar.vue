<template lang="pug">
  div
    Avatar(size="120").mb-4
    v-file-input(v-model="avatar" accept="image/png, image/jpeg, image/bmp" placeholder="Profilbild hochladen" prepend-icon="mdi-camera" label="Profilbild")
    v-btn(elevation="0" rounded v-if="avatarSize > 0" color="primary" @click="uploadAvatar" :loading="loading") Speichern
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
    async uploadAvatar() {
      this.loading = true
      let result = await this.$store.dispatch("account/updateAvatar", this.avatar).then(() => {
        this.loading = false
        this.avatar = null
      })
    }
  }
}
</script>

<style lang="scss" scoped>

</style>
