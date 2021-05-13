<template lang="pug">
  div
    h3.heading-h3.serif.mb-8.text-center Bewertungen
    div Qualität
    //- v-rating(readonly color="yellow darken-3" background-color="yellow darken-3" length="5" :value="3")
    v-rating(readonly color="light-blue lighten-5" background-color="light-blue lighten-5" length="5" :value="3")
    div Termintreue
    //- v-rating(readonly color="yellow darken-3" background-color="yellow darken-3" length="5" :value="3")
    v-rating(readonly color="light-blue lighten-5" background-color="light-blue lighten-5" length="5" :value="3")
    div Kommunikation
    //- v-rating(readonly color="yellow darken-3" background-color="yellow darken-3" length="5" :value="3")
    v-rating(readonly color="light-blue lighten-5" background-color="light-blue lighten-5" length="5" :value="3")
    p.mt-4.text-sm
      v-icon(size="18") mdi-information-outline
      span &nbsp;Du hast noch keine Bewertungen erhalten.
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

</style>
