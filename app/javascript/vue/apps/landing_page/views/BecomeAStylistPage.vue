<template lang="pug">
  v-app
    v-main#app-become-a-stylist
      Header(:links="headerLinks")
      Splash
      v-container.py-8(fluid style="background: #f1ecdf")
        .my-facts
          .fact-item.animate__animated.animate__fadeInLeft
            img(style="" src="@images/icons/Netzwerk.png" width="92")
            div.text-center.fact-box
              b.lead.fact-title {{$t('stylist_landing.facts.community')}}
              div.lead.fact-number
                number(:from="0" :to="800" :duration="5" :delay="1")
          .fact-item.animate__animated.animate__fadeInLeft
            img(style="" src="@images/icons/Wallet.png" width="92")
            div.text-center.fact-box
              b.lead.fact-title {{$t('stylist_landing.facts.transactions')}}
              div.lead.fact-number
                number(:from="0" :to="600" :duration="5.2" :delay="1")
          .fact-item.animate__animated.animate__fadeInLeft
            img(style="" src="@images/icons/Herzschlag.png" width="92")
            div.text-center.fact-box
              b.lead.fact-title {{$t('stylist_landing.facts.happy_brides')}}
              div.lead.fact-number
                number(:from="0" :to="500" :duration="4.8" :delay="1")
      .container.bridlx-features.pt-8.pb-8
      h2.heading-h2.serif.mt-4.mb-8.text-center {{$t('stylist_landing.join')}}
      v-item-group.mb-8.pb-8
        v-container
          v-row
            .col-12.col-md-6.col-lg-4.col-xl-3
              v-card().img-stylist.stylist-1
            .col-12.col-md-6.col-lg-4.col-xl-3
              v-card().img-stylist.stylist-2
            .col-12.col-md-6.col-lg-4.col-xl-3
              v-card().img-stylist.stylist-3
            .col-12.col-md-6.col-lg-4.col-xl-3
              v-card().img-stylist.stylist-4
            .col-12.col-md-6.col-lg-4.col-xl-3
              v-card().img-stylist.stylist-5
            .col-12.col-md-6.col-lg-4.col-xl-3
              v-card(style="height: 600px; background: #e7e6e6").lead-card.h-100
                div.d-flex.text-center.cursor-pointer.clickable-card
                  p.p-8.text-h5 {{$t('stylist_landing.join_phrase')}}
                  p.p-8.text-h3.d-flex.justify-center
                    span(style="color: #fff; font-weight: bold")
                      | +1
                    v-icon.text-h3(color="black") mdi-heart
      Features
      ContainerSlider(height="600" transitionSpeed="50000")
        .container-slider(key="1" style="height: 600px; background: #EECBC1; color: #fff")
          .container.h-100
            .row.h100p.h-100.d-100.no-gutters
              .col-12
                h2.heading-h2.serif.mb-2.mt-8(style="font-weight: bold") {{$t('stylist_landing.time_for_a_new_chapter')}}
              .col-6.d-none.d-lg-block.h-100
                p.lead.w-50.mb-4(style="display: inline-block;") {{$t('stylist_landing.chapter_string')}}
                p.mt-4
                  a.mt-4.btn-lead(href="https://app.getsorted.de/#anonymous_login" target="_blank") {{$t('stylist_landing.start_now')}}
              .col-12.col-lg-6
                img.img-stylist(src="@images/illustrations/bridlx-painting.png" height="400")
        .container-slider(key="2" style="height: 600px; background: #FDE4AE")
          .h-100.d-100(style="color: #fff;").p-4
            div(style="max-width: 1200px; margin: 0 auto;")
                h2.heading-h2.pt-8(style="font-weight: bold") {{$t('stylist_landing.quote_1')}}
                h3.heading-h3.text-right.serif {{$t('stylist_landing.ceo_quote')}}
        .container-slider(key="3" style="height: 600px; background: #98A3B4; color: #fff")
          .container.h-100
            .row.h100p.h-100.d-100.no-gutters
              .col-12
                h2.heading-h2.serif.mb-2.mt-8(style="font-weight: bold") {{$t('stylist_landing.first_impression')}}
              .col-6.d-none.d-lg-block
                p.lead.w-50 {{$t('stylist_landing.impression_string')}}&nbsp;
                  a(href="#").this-weird-link {{$t('stylist_landing.here')}}
              .col-12.col-lg-6
                img.img-stylist(src="@images/illustrations/bridlx-magnet.png" height="400")
      CustomerStories
      QuestionsAndAnswers
      Footer
</template>

<script>
import Header from '@/components/header.vue'
import Splash from '@/components/become_a_stylist/splash.vue'
import Features from '@/components/become_a_stylist/features.vue'
import CustomerStories from '@/components/become_a_stylist/customer_stories.vue'
import QuestionsAndAnswers from '@/components/become_a_stylist/questions_and_answers.vue'
import Footer from '@/components/landing_page/footer.vue'
import ContainerSlider from '@/components/container_slider.vue'
import SizedComponent from '@/components/landing_page/sized_component.vue'
import VueNumber from 'vue-number-animation'

export default {
  components: {
    Header,
    Splash,
    Features,
    ContainerSlider,
    CustomerStories,
    QuestionsAndAnswers,
    Footer
  },
  data() {
    return {
      position: 0,
      headerLinks: [
        {url: "#", text: "discover"},
        {url: "/become-a-stylist", text: "become_a_stylist", active: true},
        {url: "#", text: "login", modal: "signIn"},
      ]
    }
  },
}
</script>

<style lang="scss" scoped>
  .img-stylist {
    height: 500px;
    background-size: cover;
    background-position: center;
    background-position-y: top;
    &.stylist-1 { background-image: url(~@images/become_a_stylist/stylist-1.jpg) }
    &.stylist-2 { background-image: url(~@images/become_a_stylist/stylist-2.jpg) }
    &.stylist-3 { background-position: center; background-image: url(~@images/become_a_stylist/stylist-3.jpg) }
    &.stylist-4 { background-image: url(~@images/become_a_stylist/stylist-4.jpg) }
    &.stylist-5 { background-image: url(~@images/become_a_stylist/stylist-5.jpg) }
  }
  .lead-card {
    div.d-flex {
      height: 100%;
      width: 100%;
      display: flex;
      justify-content: center;
      align-items: center;
      flex-direction: column;
    }
  }
  .clickable-card {

  }
  .d-100 {
    height: 100%;
    width: 100%;
    display: flex;
    justify-items: center;
    align-items: center;
  }
  .btn-lead {
    transition: all .2s;
    border: 1px solid #fff;
    color: #fff;
    background: rgba(255,255,255,0.0);
    font-size: 16px;
    padding: 12px 20px;
    &:hover {
      color: #333;
      background: rgba(255,255,255,1.0);
    }
  }
  .this-weird-link {
    text-decoration: underline;
    color: #white;
  }
  .my-facts {
    display: flex;
    padding: 8px;
    justify-content: space-evenly;
    @media screen and (max-width: 720px) {
      flex-direction: column;
      align-items: center;
    }
  }
  .fact-item {
    padding: 8px;
    display: flex;
    img {
      margin-right: 8px;
      margin-left: auto;
    }
    .fact-box {
      display: flex;
      flex-direction: column;
      justify-content: center;
    }
    .fact-title {
      color: #454645;
    }
    .fact-number {
      margin-top: 4px;
      font-size: 22px;
      font-weight: bold;
    }
  }
</style>
