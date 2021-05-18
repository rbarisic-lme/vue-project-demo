<template lang="pug">
  div
    div(v-if="this.loading")
      v-skeleton-loader(type="article")
    div(v-else="this.loading")
      VueMarkdownPlus {{body}}
</template>

<script>
import VueMarkdownPlus from 'vue-markdown-plus'

export default {
  components: {
    VueMarkdownPlus
  },
  props: ['name'],
  data() {
    return {
      title: "",
      body: "",
      loading: true,
    }
  },
  mounted() {
    this.$axios.get(`/static_pages/${this.name}`).then(result => {
      this.title = result.data.title
      this.body = result.data.body
      this.loading = false
    })
  }
}
</script>

<style lang="scss" scoped>

</style>
