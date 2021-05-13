<template lang="pug">
  div
    .container
      .row
        .col-12.col-lg-2
          v-sheet.px-8.py-4.mb-8(rounded elevation="2")
            v-list-item
              v-list-item-title
                b Status
            v-list-item-group
              v-list-item(:disabled="true")
                v-list-item-title Laufend
              v-list-item(:disabled="true")
                v-list-item-title Abgeschlossen
              v-list-item(:disabled="true")
                v-list-item-title Storniert
            v-divider
            v-list-item
              v-list-item-title
                b Rechnungen
            v-list-item-group
              v-list-item(:disabled="true")
                v-list-item-title Download
        .col-12.col-lg-9.offset-lg-1
          Order(firstName="Laura" lastName="B")
          Order(firstName="Renate" lastName="M")
    DisabledOverlay
      h2.heading-h2 Diese Funktion ist während der Pre-Launch Phase noch nicht verfügbar.

</template>

<script>
  import Order from '@/components/stylist/order.vue'
  import DisabledOverlay from '@/components/disabled_overlay.vue'
export default {
  components: {
    Order,
    DisabledOverlay,
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
