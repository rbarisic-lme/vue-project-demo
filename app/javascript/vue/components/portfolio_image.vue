<template lang="pug">
  v-card.image-card(outlined)
    .image-content(:style="imageStyle")
    //- img(:src="src")
</template>

<script>
export default {
  components: {

  },
  props: ['src'],
  data() {
    return {
      
    }
  },
  computed: {
    imageStyle() {
      return {
        backgroundImage: `url(${this.src})`
      }
    }
  }
}
</script>

<style lang="scss" scoped>
  .image-card {
    height: 120px;
  }
  .image-content {
    background-repeat: no-repeat;
    background-size: cover;
    height: 100%;
    width: 100%;
  }
</style>
