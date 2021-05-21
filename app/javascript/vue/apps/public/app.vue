<template lang="pug">
  div
    Header(:links="headerLinks" static)
    .avatar-container

    Footer
</template>

<script>
import Header from '@/components/header.vue'
import Footer from '@/components/landing_page/footer.vue'
import Avatar from '@/components/user/avatar.vue'

export default {
  components: {
    Header,
    Footer,
    Avatar,
  },
  props: {

  },
  data() {
    return {
      headerLinks: [
        {url: "#", text: "discover"},
        {url: "/become-a-stylist", text: "become_a_stylist", active: true},
        {url: "#", text: "login", modal: "signIn"},
      ]
    }
  }
}
</script>

<style lang="scss" scoped>

</style>
