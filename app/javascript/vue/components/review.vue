<template lang="pug">
  div
    .d-flex.align-top
      .review-image
        Avatar(:initials="review.author[0]" size="32").mr-2
      .review-container
        .d-flex.align-center
          div.review-title.serif.mr-2 {{review.author}}
          .review-stars
            v-icon(dense v-for="star in parseInt(review.overall_rating_2f)" color="amber") mdi-star

        div.small-text {{reviewDate}}
        div.review-body {{review.body}}
</template>

<script>
import Avatar from '@/components/user/avatar.vue'
import moment from 'moment'

export default {
  components: {
    Avatar
  },
  props: ['review'],
  data() {
    return {
      reviewDate: moment(this.review.updated_at).format('DD. MMMM YYYY')   
    }
  }
}
</script>

<style lang="scss" scoped>
  .review-title {
    font-size: 18px;
  }
  .review-body {

  }

  .small-text {
    font-size: 12px;
    color: #999;
  }

  .review-container {
    flex-grow: 1;
  }

  // .review-stars {
  //   font-size: 14px;
  // }
</style>
