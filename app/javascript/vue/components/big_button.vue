<template lang="pug">
  button.big-btn
    slot
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
  .big-btn {
    transition: background .2s;
    border: 2px solid black;
    padding: 12px 20px;
    color: #000;
    background: rgba(255,255,255,1.0);
    font-size: 1.2rem;
    font-family: serif;
    &:hover {
      color: #fff;
      background: rgba(0,0,0,1.0);
      .v-icon {
        color: #fff;
      }
    }
  }
</style>
