<template lang="pug">
  v-sheet.p-3.mb-8(rounded elevation="2")
    v-container
      v-row
        v-col(sm="2")
          .panel
            div.text-center.mb-4
              b {{firstName}} {{lastName[0]}}.
            div.avatar-container.p-2
              v-avatar.avatar-expand
        v-col
          .panel
            .item-container
              .item
                .item--title Bestellung
                .item--content
                  b Paket
                  br
                  b Extras
              .item
                .item--title Buchungsdetails
                .item--content
                  b Datum
                  br
                  b Ort, Hochzeit
                  br
                  b Ort, Datum Probetermin
</template>

<script>
export default {
  components: {

  },
  props: ['firstName', 'lastName'],
  data() {
    return {
      
    }
  }
}
</script>

<style lang="scss" scoped>
  .avatar-container {
    max-width: 120px;
    margin: 0 auto;
  }
  .avatar-expand {
    width: 100% !important;
    padding: 50% !important;
    background: #e2e2e2;
  }
  .panel {
    height: 100%;
    background-color: #f5f5f5;
    padding: 16px 8px;
    border-radius: 4px;
  }
  .item-container {
    display: flex;
    height: 100%;
    width: 100%;
    .item {
      flex-grow: 1;
      &:first-child {
        border-right: 4px solid #fff;
      }
      .item--content {
        padding: 16px;
      }
      .item--title {
        color: #454645;
        text-align: center;
      }
    }
  }
</style>
