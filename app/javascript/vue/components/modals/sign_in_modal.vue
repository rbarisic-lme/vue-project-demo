<template lang="pug">
Modal(name="signIn" height="auto" :maxWidth="300")
  div.m-8.text-center
    h3.heading-h3.mb-5
      | bei bridlx
      span {{ tab === 0 ? ' registrieren ' : ' anmelden ' }}

  v-card
    v-tabs(v-model="tab" grow show-arrows)
      v-tab(color="green") Registrieren
      v-tab(color="green") Anmelden
      v-tabs-items(v-model="tab").p-4
        v-tab-item
          v-card(flat)
            RegisterForm
        v-tab-item
          v-card(flat)
            LoginForm

</template>

<script>
import LoginForm from '@/components/account/forms/login_form.vue'
import RegisterForm from '@/components/account/forms/register_form.vue'

export default {
  components: {
    LoginForm,
    RegisterForm,
  },
  props: {

  },
  data() {
    return {
      tab: 0,
    }
  },
  methods: {
  }
}
</script>

<style lang="scss" scoped>

</style>
