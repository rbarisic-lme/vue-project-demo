<template lang="pug">
  v-avatar(color="accent" :size="size" :tile="tile")
    img(v-if="avatar" :src="avatar")
    span(v-else="avatar").white--text.headline {{getInitials}}
</template>

<script>
export default {
  components: {

  },
  props: {
    tile: Boolean,
    avatarImg: undefined,
    initials: undefined,
    store: String,
    size: {
      type: String,
      default: undefined
    }
  },
  data() {
    return {
    }
  },
  computed: {
    getInitials() {
      return this.store ? this.$store.state[this.store].initials : this['initials']
    },
    avatar() {
      return this.store ? this.$store.state[this.store].avatar_url : this['avatarImg']
    }
  },
}
</script>

<style lang="scss" scoped>

</style>
