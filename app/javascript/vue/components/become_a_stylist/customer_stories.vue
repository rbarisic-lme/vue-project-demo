<template lang="pug">
  .container.bridlx-features.pt-8.pb-8.mb-8
    h2.heading-h2.serif.mt-4.mb-8.text-center {{$t('stylist_landing.customer_stories.title')}}
    .container
      .row.no-gutters.customer-stories
        .col-12.col-md-6.customer-story(v-for="(bride, index) in brides" :key="bride.name" :class="{'cs-left': index <= 1, 'cs-right': index > 1}")
            .cs--image(:style="{backgroundColor: '#eee', backgroundImage: 'url(' + bride.image + ')'}" :class="{'bubble-right': index <= 1, 'bubble-left': index > 1}")
              .cs--image--bubble
            .cs--story(style="font-size: 28px;")
              p.big-text {{bride.name}}
              p "{{bride.body}}"
</template>

<script>
import ImgFaye from '@images/brides/Faye.jpg'
import ImgGabriele from '@images/brides/Gabriele.jpg'
import ImgHelen from '@images/brides/Helen.jpg'
import ImgLisa from '@images/brides/Lisa.jpg'

export default {
  components: {

  },
  props: {

  },
  data() {
    return {
      brides: [
        {
          name: this.$t('stylist_landing.customer_stories.one.name'),
          body: this.$t('stylist_landing.customer_stories.one.body'),
          image: ImgFaye,
        },
        {
          name: this.$t('stylist_landing.customer_stories.two.name'),
          body: this.$t('stylist_landing.customer_stories.two.body'),
          image: ImgGabriele,
        },
        {
          name: this.$t('stylist_landing.customer_stories.three.name'),
          body: this.$t('stylist_landing.customer_stories.three.body'),
          image: ImgHelen,
        },
        {
          name: this.$t('stylist_landing.customer_stories.four.name'),
          body: this.$t('stylist_landing.customer_stories.four.body'),
          image: ImgLisa,
        },
      ]
      // images: [ImgFaye, ImgGabriele, ImgHelen, ImgLisa]
    }
  }
}
</script>

<style lang="scss" scoped>
  .big-text {
    font-size: 1.2rem;
    font-weight: bold;
  }

  .customer-story {
    display: flex;
    height: 280px;
    padding: 0;
    // &:nth-child(2n+1) {
    //   justify-content: flex-end;
    // }
    &.cs-left {
      // flex-direction: row-reverse;
    }
    &.cs-right {
      // flex-direction: row;
    }
    &:nth-child(1) {
      flex-direction: row;
      justify-content: flex-end;
    }
    &:nth-child(2) {
      flex-direction: row;
      justify-content: flex-start;
    }
    &:nth-child(3) {
      justify-content: flex-start;
      flex-direction: row-reverse;
    }
    &:nth-child(4) {
      justify-content: flex-end;
      flex-direction: row-reverse;
    }
    .cs--image {
      display: flex;
      height: 100%;
      background-size: cover;
      background-position: center;
      width: 280px;
      align-items: center;
      justify-content: flex-start;
      &.bubble-right {
        flex-direction: row-reverse;
        .cs--image--bubble {
          width: 0; 
          height: 0; 
          border-top: 25px solid transparent;
          border-bottom: 25px solid transparent; 
          border-right:30px solid #fff; 
        }
      }
      &.bubble-left {
        flex-direction: row;      
        .cs--image--bubble {
          width: 0; 
          height: 0; 
          border-top: 25px solid transparent;
          border-bottom: 25px solid transparent; 
          border-left:30px solid #fff; 
        }
      }
    }
    .cs--story {
      padding-left: 16px;
      padding-right: 16px;
      width: 280px;
      align-self: center;
    }
  }

  @media screen and (max-width: 720px) {
    .customer-story {
      flex-direction: column !important;
      height: unset;
      .cs--story {
        width: 100%;
        margin: 0 auto;
      }
      .cs--image {
        border-radius: 9999px;
          height: 280px;
          width: 280px;
          margin: 0 auto;
          &.bubble-right,
          &.bubble-left {
            flex-direction: column-reverse;
            .cs--image--bubble {
              border-left: 25px solid transparent;
              border-right: 25px solid transparent; 
              border-bottom: 30px solid #fff;           
          }
        }
      }
    }
  }
</style>
