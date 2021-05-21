<template lang="pug">
Modal(name="signIn" height="auto" :maxWidth="600" :adaptive="true")
  div.m-8.text-center
    h3.heading-h3.mb-5
      span {{$t('header.at_bridlx')}}&nbsp;
      span {{ tab === 0 ? $t('header.signup').toLowerCase() : $t('header.signin').toLowerCase() }}

  v-card
    v-tabs(v-model="tab" grow show-arrows)
      v-tab(color="green") {{$t('header.signup')}}
      v-tab(color="green") {{$t('header.signin')}}
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
  },
  mounted() {
    // this.$axios.get('/api/v1/auth/fb_oauth_path').then(response => {
      // console.log(response)
    // })
  }
}
</script>

<style lang="scss" scoped>

  /deep/ .vm--modal {
    @media screen and (max-width: 720) {
      overflow-y: scroll;
    }
  }
</style>
