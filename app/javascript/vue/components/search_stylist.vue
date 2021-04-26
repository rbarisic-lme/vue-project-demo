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
            v-menu(ref="menu" v-model="menu" :close-on-content-click="false" offset-y min-width="auto")
              template(v-slot:activator="{ on, attrs }")
                InputAnnotated(:value="date" annotation="Datum" description="TT/MM/JJ" name="date" ref="input" readonly v-bind="attrs" @click.native="menu = true").animate__animated.animate__fadeInUp

              v-date-picker(v-model="date" scrollable)
                v-btn(text color="primary" @click="menu = false") Abbrechen
                v-btn(text color="primary" @click="save(date)") Auswählen
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
      date: undefined,
      menu: false,
      dateModal: true,
  }},
  methods: {
    save(date) {
      this.date = date
      this.menu = false
    }
  }
}
</script>

<style scoped lang="scss">
.search--stylist {

}
.input-search {
  background: rgba(255,255,255,0.7);
  /deep/ .v-input__control { 

    .v-input__slot {
      &::before {
        border: none !important;
      }
    }
    .v-text-field__slot {
      input {
        padding: 10px 8px;
      }
      .v-label {
        // text-align: center;
        // width: 100%;
      }
    }
  }
}
</style>
