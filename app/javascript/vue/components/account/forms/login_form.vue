<template lang="pug">
  .form--rows
    v-btn(block large color="#4267b2" dark).mb-4
      v-icon.mr-2(left) mdi-facebook
      span {{$t('header.signin_fb')}}
    v-btn(block large color="#fff" dark).mb-4.text--black
      v-icon.mr-2(left) mdi-google
      span {{$t('header.signin_google')}}

    div.my-4.text-center Oder
    v-text-field(v-model="email" :label="$t('form.label.email')" autocomplete="email" clearable prepend-inner-icon="mdi-at")
    v-text-field(v-model="password" :label="$t('form.label.password')" autocomplete="current-password" :append-icon="showPw ? 'mdi-eye' : 'mdi-eye-off'" :type="showPw ? 'text' : 'password'" @click:append="showPw = !showPw" prepend-inner-icon="mdi-lock")

    v-btn(block large color="#6ccc52" @click="authenticate" dark :loading="loading").mb-4 {{$t('form.btn.continue')}}
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

      this.$axios.post('/users/sign_in', {
        user: {
          email: this.email,
          password: this.password,
        }
      }).then( response => {
        if (response.status == 200 && response.data.token != null) {
          localStorage.jwt = response.data.token
          this.$cookies.set('jwt', response.data.token, {expires: '24h'});
          window.location = '/dashboard'
        }
      }).catch( error => {
       this.$toast.open({message: this.$t('form.message.update.failure'), type: 'error'});
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
  .text--black { color: #000; }
</style>
