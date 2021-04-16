<template lang="pug">
  v-app
    v-main#app-become-a-stylist
      Header(:links="headerLinks")
      Splash
      v-container.py-8(fluid style="background: #f1ecdf")
        v-container
          v-row
            v-col
              img(src="@images/icons/bridlx icon complete set_page_13.svg" width="92")
              div Wachsende Community
            v-col
              img(src="@images/icons/bridlx icon complete set_page_20.svg" width="92")
              div Transaktionen
            v-col
              img(src="@images/icons/bridlx icon complete set_page_17.svg" width="92")
              div Happy Brides
      .container.bridlx-features.pt-8.pb-8
      h2.heading-h2.serif.mt-4.mb-8.text-center Schließe dich unser Community an
      v-item-group.mb-8.pb-8
        v-container
          v-row
            .col-12.col-md-6.col-lg-4
              v-card().img-stylist.stylist-1
            .col-12.col-md-6.col-lg-4
              v-card().img-stylist.stylist-2
            .col-12.col-md-6.col-lg-4
              v-card().img-stylist.stylist-3
            .col-12.col-md-6.col-lg-4
              v-card().img-stylist.stylist-4
            .col-12.col-md-6.col-lg-4
              v-card().img-stylist.stylist-5
            .col-12.col-md-6.col-lg-4
              v-card(style="height: 600px; background: #e7e6e6").lead-card.h-100
                div.d-flex.text-center
                  p.p-8.text-h5 Zauberst du anderen auch gerne ein Lächeln ins Gesicht?
                  p.p-8.text-h3.d-flex.justify-center
                    span(style="color: #fff; font-weight: bold")
                      | +1
                    v-icon.text-h3(color="black") mdi-heart
      Footer
</template>

<script>
import Header from '@/components/header.vue'
import Splash from '@/components/become_a_stylist/splash.vue'
import Footer from '@/components/landing_page/footer.vue'

import SizedComponent from '@/components/landing_page/sized_component.vue'

export default {
  components: {
    Header,
    Splash,
    Footer
  },
  data() {
    return {
      position: 0,
      headerLinks: [
        {url: "#", text: "Entdecken"},
        {url: "/become-a-stylist", text: "Stylist werden", active: true},
        {url: "#", text: "Login (Stylist)", modal: "stylistSignIn"},
      ]
    }
  },
}
</script>

<style lang="scss" scoped>
  .img-stylist {
    height: 400px;
    background-size: cover;
    background-position: center;
    &.stylist-1 { background-image: url(~@images/become_a_stylist/stylist-1.jpg) }
    &.stylist-2 { background-image: url(~@images/become_a_stylist/stylist-2.jpg) }
    &.stylist-3 { background-image: url(~@images/become_a_stylist/stylist-3.jpg) }
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
</style>
