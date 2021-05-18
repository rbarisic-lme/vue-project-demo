<template lang="pug">
  PageWrapper(title="Impressum")
    StaticPageContentLoader(:name="name")
</template>

<script>
import PageWrapper from '@/components/page_wrapper.vue'
import StaticPageContentLoader from '@/components/static_page_content_loader.vue'

export default {
  components: {
    PageWrapper,
    StaticPageContentLoader,
  },
  props: ['name'],
  data() {
    return {
      
    }
  }
}
</script>

<style lang="scss" scoped>

</style>
