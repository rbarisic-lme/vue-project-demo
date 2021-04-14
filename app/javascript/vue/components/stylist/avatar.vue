<template lang="pug">
  v-avatar.ml-3(color="primary")
    img(v-if="avatarPresent" :src="$store.state.account.profilePicture")
    span(v-else="avatarPresent").white--text.headline {{$store.state.account.initials}}
</template>

<script>
export default {
  components: {

  },
  props: {

  },
  data() {
    return {
      avatar: this.$store.state.account.profilePicture
    }
  },
  computed: {
    avatarPresent() {
      if (typeof this.avatar == File) {
        return true
      } else {
        return false
      }
    }
  },
}
</script>

<style lang="scss" scoped>

</style>
