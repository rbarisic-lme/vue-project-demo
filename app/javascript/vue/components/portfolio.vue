<template lang="pug">
  .container.container-portfolio(ref="container")
    .row
      .col-6.col-lg-4.col-xl-3(v-for="image in images", :key="image.id")
        .image-portfolio(:style="{backgroundImage: 'url('+image.image_url+')'}")

</template>

<script>
export default {
  components: {

  },
  props: ['images'],
  data() {
    return {

    }
  },
}
</script>

<style lang="scss" scoped>
  .image-portfolio {
    width: 100%;
    padding-bottom: 100%;
    background-size: cover;
    background-position: center;
  }
  .container-portfolio {
    @media screen and (max-width: 720px) {
      padding: 12px 0;
    }
  }
</style>
