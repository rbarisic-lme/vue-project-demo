<template lang="pug">
  .form--rows
    OAuthFacebookBtn(type="register")
    v-btn(block large color="#fff" dark).mb-4.text--black
      v-icon(left).mr-2 mdi-google
      span {{$t('header.signup_google')}}
    div.my-4.text-center {{$t('header.or')}}
    v-form(v-model="valid")
      v-container(fluid)
        v-row
          v-col.py-0
            v-text-field(lazy-validation :rules="fr.stylist.first_name" v-model="first_name" :label="$t('form.label.first_name')" autocomplete="first-name")
          v-col.py-0
            v-text-field(lazy-validation :rules="fr.stylist.last_name" v-model="last_name" :label="$t('form.label.last_name')" autocomplete="family-name")
        v-row
          v-text-field(lazy-validation :rules="fr.stylist.email" v-model="email" :label="$t('form.label.email')" autocomplete="email" type="email" prepend-inner-icon="mdi-at")
        v-row
          v-text-field(lazy-validation :rules="fr.stylist.password" v-model="password" autocomplete="new-password" :label="$t('form.label.password')" :append-icon="showPw ? 'mdi-eye' : 'mdi-eye-off'" :type="showPw ? 'text' : 'password'" @click:append="showPw = !showPw" prepend-inner-icon="mdi-lock")
        v-row
          v-text-field(lazy-validation :rules="pwConfirmRule" v-model="password_confirmation" autocomplete="new-password" :label="$t('form.label.password_confirmation')" :append-icon="showPw ? 'mdi-eye' : 'mdi-eye-off'" :type="showPw ? 'text' : 'password'" @click:append="showPw = !showPw" prepend-inner-icon="mdi-lock")

    v-btn(block large color="#6ccc52" @click="signup" :loading="loading" :disabled="!valid").mb-4 Weiter
</template>

<script>
import i18n from '@/lib/i18n'
import FormRules from '@/data/form_rules.js';
import OAuthFacebookBtn from './oauth_facebook.vue';

export default {
  components: {
    OAuthFacebookBtn,
  },
  props: {

  },
  data() {
    return {
      showPw: false,
      valid: false,
      loading: false,
      fr: FormRules,
      first_name: '',
      last_name: '',
      email: '',
      password: '',
      password_confirmation: '',
      pwConfirmRule: [
        value => !!value || i18n.t('form.error.missing'),
        value => (value || '') === this.password || i18n.t('form.error.pw_confirm_mismatch')
      ]
    }
  },
  methods: {
    signup() {
      this.loading = true

      this.$axios.post('/users', {
        user: {
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
        this.$toast.open({message: this.$t('form.message.update.failure'), type: 'error'});
      })

      this.loading = false
    },
    authenticate() {
      this.loading = true

      // this.$store.dispatch('auth/login').then(response => {
      // })

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
      }).catch(error => {
       this.$toast.open({message: this.$t('form.message.update.failure'), type: 'error'});
      }).finally(() => {
        this.loading = false;
      })
    }
  }
}
</script>

<style lang="scss" scoped>
  .bg-fb { background: #4267b2; }
  .bg-google { background: #DC2626; }
  .bg-btn { background: #6ccc52; }
  .text--black { color: black; }
</style>
