<template lang="pug">
.row
  .col-12
    .h-100
      v-sheet.px-8.py-4.mb-8(rounded elevation="2")
        .block-container
          .bc--content
            .bc--content-main
              h3.heading-h3.serif.mb-8(v-if="title") {{title}}
              slot
            .bc--actions
              slot(name="actions")
          .bc--info
            .info-image(v-if="!hideImageBlock")
              slot(name="info-image")
            .info-text
              slot(name="info-text")
</template>

<script>
export default {
  components: {

  },
  props: ['title', 'infoText', 'hideImageBlock'],
  data() {
    return {
      
    }
  }
}
</script>

<style lang="scss" scoped>
  .block-container {
    display: flex;

  }
  .bc--actions {
    margin-left: auto;
    text-align: right;
  }
  .bc--content {
    display: flex;
    flex-direction: column;
    justify-content: space-between;

    flex-grow: 1;
    .bc--content--main {

    }
    .bc--actions {

    }
  }
  .bc--info {
    display: flex;
    color: #2c1d69;
    justify-content: center;
    align-items: center;
    max-width: 230px;
    padding-left: 16px;
    border-left: 1px solid #eee;
    margin-left: 16px;
    /deep/ .img-and-text {
      display: flex;
      justify-content: center;
      align-items: center;
      img {
        margin: 0 16px;
      }
    }
    .info-image {
      min-width: 64px;
      margin-right: 16px;
    }
    .info-text {
      font-size: 0.9rem;
    } 
  }
  @media screen and (max-width: 720px) {
    .block-container {
      flex-direction: column-reverse;
      .bc--info {
        margin: 0;
        border: none;
        max-width: unset;
        padding: 8px;
        border-bottom: 1px solid #eee;
        margin-bottom: 8px;

        .info-text {
          word-break: break-word;
          flex-grow: 1;
        }
      }
    }
  }
</style>
