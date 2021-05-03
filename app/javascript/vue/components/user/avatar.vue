<template lang="pug">
  v-avatar.ml-3(color="accent" :size="size")
    img(v-if="avatar" :src="$store.state.stylist.avatar_url")
    span(v-else="avatar").white--text.headline {{$store.state.stylist.initials}}
</template>

<script>
export default {
  components: {

  },
  props: {
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
    avatar() {
      return this.$store.state.stylist.avatar_url
    }
  },
}
</script>

<style lang="scss" scoped>

</style>
