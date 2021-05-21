<template lang="pug">
  v-card.image-card(outlined)
    .image-content.image-portfolio(:style="imageStyle")
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
    // height: 120px;
  }
  .image-portfolio {
    width: 100%;
    padding-bottom: 100%;
    background-size: cover;
    background-position: center;
  }
  .image-content {
    background-repeat: no-repeat;
    background-size: cover;
    // height: 100%;
    // width: 100%;
    // max-height: 400px;
  }
</style>
