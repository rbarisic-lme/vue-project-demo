<template lang="pug">
  div
    Header(:links="headerLinks" :static="true")
    v-container.page-content.p-4.mb-4
      h1.heading-h1 {{title}}
      slot
    Footer
</template>

<script>
import Header from '@/components/header.vue'
import Footer from '@/components/landing_page/footer.vue'

export default {
  components: {
    Header,
    Footer
  },
  props: ['title'],
  data() {
    return {
      position: 0,
      headerLinks: [
        {url: "/", text: "Startseite"},
        {url: "/become-a-stylist", text: "Stylist werden"},
      ]
    }
  },
}
</script>

<style lang="scss" scoped>
  .page-content {
    margin-top: 80px;
  }
  .header-pw {
    background: #333;
  }
</style>
