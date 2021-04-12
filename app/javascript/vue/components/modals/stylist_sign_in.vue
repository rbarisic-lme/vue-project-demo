<template lang="pug">
Modal(name="stylistSignIn" height="auto" :maxWidth="300")
  div.m-8.text-center
    h3.heading-h3.mb-5 Als Stylist bei bridlX einloggen
    .form--rows
      .link-btn(class="font-bold text-white border rounded w-full py-4 px-3 mb-4 bg-fb") Weiter mit Facebook
      .link-btn(class="font-bold text-white border rounded w-full py-4 px-3 mb-4 bg-google") Weiter mit Google

      div.mb-4 Oder
      label(class="block text-gray-700 text-sm font-bold mb-2 text-left" for="email") E-Mail
      input(class="mb-2 shadow border rounded w-full py-4 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" id="email" type="text" placeholder="E-Mail Adresse")
      input(class="mb-2 shadow border rounded w-full py-4 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" id="password" type="password" placeholder="E-Mail Adresse")

      input(class="font-bold text-white border rounded w-full py-4 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline bg-btn" id="email" type="button" value="Weiter")
</template>

<script>

export default {
  components: {
  },
  props: {

  },
  data() {
    return {
      
    }
  }
}
</script>

<style lang="scss" scoped>
  .bg-fb { background: #4267b2; }
  .bg-google { background: #DC2626; }
  .bg-btn { background: #6ccc52; }
</style>
