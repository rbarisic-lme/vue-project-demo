<template lang="pug">
  .search--stylist.my-4
    .container.p-0
      form
        .row.row--form-inline
          .col-12.col-md-4
            InputAnnotated(annotation="Ort" description="Wo soll die Hochzeit stattfinden?" name="place").animate__animated.animate__fadeInUp
          .col-12.col-md-2
            InputAnnotated(annotation="Umkreis" description="km" name="area").animate__animated.animate__fadeInUp
          .col-12.col-md-4
            InputAnnotated(annotation="Datum" description="TT/MM/JJ" name="date" ref="input").animate__animated.animate__fadeInUp
          .col-12.col-md-2
            button.sizeaware.animate__animated.animate__fadeInUp Suchen
</template>

<script>
import InputAnnotated from '@/components/input_annotated.vue'

export default {
  components: {
    InputAnnotated,
  },
  data() {
    return {
  }}
}
</script>

<style scoped lang="scss">
.search--stylist {

}
</style>
