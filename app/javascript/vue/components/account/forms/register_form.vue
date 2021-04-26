<template lang="pug">
  .form--rows
    v-btn(block large color="#4267b2" dark).mb-4
      v-icon(left) mdi-facebook
      |  Mit Facebook registrieren
    v-btn(block large color="#DC2626" dark).mb-4
      v-icon(left) mdi-google
      |  Mit Google registrieren
    div.my-4.text-center Oder
    v-container(fluid)
      v-row
        v-col.py-0
          v-text-field(v-model="first_name" autocomplete="new-password" label="Vorname")
        v-col.py-0
          v-text-field(v-model="last_name" autocomplete="new-password" label="Nachname")
      v-row
        v-text-field(v-model="email" autocomplete="new-password" label="E-Mail")
      v-row
        v-text-field(v-model="password" autocomplete="new-password" label="Passwort" :append-icon="showPw ? 'mdi-eye' : 'mdi-eye-off'" :type="showPw ? 'text' : 'password'" @click:append="showPw = !showPw")
      v-row
        v-text-field(v-model="password_confirmation" autocomplete="new-password" label="Passwort bestätigen" :append-icon="showPw ? 'mdi-eye' : 'mdi-eye-off'" :type="showPw ? 'text' : 'password'" @click:append="showPw = !showPw")

    v-btn(block large color="#6ccc52" @click="signup" dark :loading="loading").mb-4 Weiter
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
      first_name: '',
      last_name: '',
      email: '',
      password: '',
      password_confirmation: '',
    }
  },
  methods: {
    signup() {
      this.loading = true

      this.$axios.post('/stylists', {
        stylist: {
          first_name: this.first_name,
          last_name: this.last_name,
          email: this.email,
          password: this.password,
          password_confirmation: this.password_confirmation,
        }
      }).then( response => {
        this.authenticate()
        // if (response.status == 200 && response.data.token != null) {
          // console.log(this.$cookies)
          // this.$cookies.set('jwt', response.data.token, {expires: '24h'});
          // window.location = '/stylists'
        // }
      }).catch( error => {
        console.log(error)
      })

      this.loading = false
    },
    authenticate() {
      this.loading = true

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
      });

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
