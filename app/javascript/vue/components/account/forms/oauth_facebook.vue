<template lang="pug">
  v-btn(block large color="#4267b2" dark @click="postFb").mb-4
    v-icon(left) mdi-facebook
    |  Mit Facebook registrieren
</template>

<script>
export default {
  components: {

  },
  props: ['type'],
  data() {
    return {
      
    }
  },
  methods: {
    postFb() {
      this.$axios.post('/users/auth/facebook', {}).then(result => {
        console.log(result)
      })
    }
  }
}
</script>

<style lang="scss" scoped>

</style>
<!-- http://localhost:3000/users/auth/facebook -->