<template lang="pug">
  .form--rows
    v-btn(block large color="#4267b2" dark).mb-4 Weiter mit Facebook
    v-btn(block large color="#DC2626" dark).mb-4 Weiter mit Google

    div.mb-4 Oder
    v-text-field(v-model="email" label="E-Mail" clearable)
    v-text-field(v-model="password" label="Passwort" :append-icon="showPw ? 'mdi-eye' : 'mdi-eye-off'" :type="showPw ? 'text' : 'password'" @click:append="showPw = !showPw")

    v-btn(block large color="#6ccc52" @click="authenticate" dark :loading="loading").mb-4 Weiter
</template>

<script>
export default {
  components: {

  },
  props: {

  },
  data() {
    return {
      showPw: false,
      loading: false,
      email: '',
      password: '',
    }
  },
  methods: {
    authenticate() {
      this.loading = true;

      // this.$store.dispatch('auth/login').then(response => {
      // })

      this.$axios.post('/stylists/sign_in', {
        stylist: {
          email: this.email,
          password: this.password,
        }
      }).then( response => {
        if (response.status == 200 && response.data.token != null) {
          console.log(this.$cookies)
          this.$cookies.set('jwt', response.data.token, {expires: '24h'});
          window.location = '/stylists'
        }
      }).catch( error => {
       this.$toast.open({message: 'Leider ist ein Fehler aufgetreten. Versuche es später erneut.', type: 'error'});
      })

      this.loading = false;
    }
  }
}
</script>

<style lang="scss" scoped>
  .bg-fb { background: #4267b2; }
  .bg-google { background: #DC2626; }
  .bg-btn { background: #6ccc52; }
</style>
