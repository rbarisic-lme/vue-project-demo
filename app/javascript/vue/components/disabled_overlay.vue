<template lang="pug">
  .disabled-overlay
    .disabled-overlay--inner
      slot
      v-btn.mt-4(color="primary" link to="/" @click="goBack") Zurück zum Dashboard
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
  },
  methods: {
    goBack() {
      window.location = '/'
    }
  }
}
</script>

<style lang="scss" scoped>
  .disabled-overlay {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(255,255,255,0.8);
    padding: 32px;
    .disabled-overlay--inner {
      height: 100vh;
      display: flex;
      align-items: center;
      justify-content: center;
      flex-direction: column;
    }
  }
</style>
