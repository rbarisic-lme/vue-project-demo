<template lang="pug">
  v-app
    v-main#app-become-a-stylist
      Header(:links="headerLinks")
      Splash
      v-container.py-8(fluid style="background: #f1ecdf")
        .my-facts
          .fact-item
            img(style="" src="@images/icons/Netzwerk.png" width="92")
            div.text-center.fact-box
              b.lead.fact-title Wachsende Community
              div.lead.fact-number 0
          .fact-item
            img(style="" src="@images/icons/Wallet.png" width="92")
            div.text-center.fact-box
              b.lead.fact-title Transaktionen
              div.lead.fact-number 600
          .fact-item
            img(style="" src="@images/icons/Herzschlag.png" width="92")
            div.text-center.fact-box
              b.lead.fact-title Happy Brides
              div.lead.fact-number 500
      .container.bridlx-features.pt-8.pb-8
      h2.heading-h2.serif.mt-4.mb-8.text-center Schließe dich unserer Community an
      v-item-group.mb-8.pb-8
        v-container
          v-row
            .col-12.col-md-6.col-lg-3
              v-card().img-stylist.stylist-1
            .col-12.col-md-6.col-lg-3
              v-card().img-stylist.stylist-2
            .col-12.col-md-6.col-lg-3
              v-card().img-stylist.stylist-3
            .col-12.col-md-6.col-lg-3
              v-card().img-stylist.stylist-4
            .col-12.col-md-6.col-lg-3
              v-card().img-stylist.stylist-5
            .col-12.col-md-6.col-lg-3
              v-card(style="height: 600px; background: #e7e6e6").lead-card.h-100
                div.d-flex.text-center.cursor-pointer.clickable-card
                  p.p-8.text-h5 Zauberst du anderen auch gerne ein Lächeln ins Gesicht?
                  p.p-8.text-h3.d-flex.justify-center
                    span(style="color: #fff; font-weight: bold")
                      | +1
                    v-icon.text-h3(color="black") mdi-heart
      Features
      ContainerSlider(height="600" transitionSpeed="50000")
        .container-slider(key="1" style="height: 600px; background: #dcb6aa; color: #fff")
          .container.h-100
            .row.h100p.h-100.d-100.no-gutters
              .col-12
                h2.heading-h2.serif.mb-2.mt-8(style="font-weight: bold") Zeit für ein neues Kapitel?
              .col-6.d-none.d-lg-block.h-100
                p.lead.w-50 Wir helfen dir dabei dein Herzensbusiness aufzubauen! Zusammen mit unserem Kooperationspartner sorted erledigst du stressfrei und unbürokratisch alle Formalitäten #getsorted
                p.mt-4
                  a.mt-4.btn-lead(href="#") Starte jetzt
              .col-12.col-lg-6
                img.img-stylist(src="@images/illustrations/bridlx-painting.jpg" height="400")
        .container-slider(key="2" style="height: 600px; background: #FAD68F")
          .h-100.d-100(style="color: #fff;").p-4
            div(style="max-width: 1200px; margin: 0 auto;")
                h2.heading-h2.pt-8(style="font-weight: bold") „ Mein größter Wunsch ist es vielen talentierten Stylisten eine Oberfläche zu bieten. Somit können sie sich genau auf das konzentrieren, was sie lieben – Menschen ein lächeln ins Gesicht zu zaubern. “
                h3.heading-h3.text-right.serif Alisa, Gründerin und CO-CEO bridlx
        .container-slider(key="3" style="height: 600px; background: #6E7A96; color: #fff")
          .container.h-100
            .row.h100p.h-100.d-100.no-gutters
              .col-12
                h2.heading-h2.serif.mb-2.mt-8(style="font-weight: bold") Der erste Eindruck zählt.
              .col-6.d-none.d-lg-block
                p.lead.w-50 Steigere deine Sichtbarkeit und sorge für eine positive Kundenwahrnehmung durch ein authentisches, professionelles Profil. Was es hierbei zu berücksichtigen gibt, findest du
                  a(href="#").this-weird-link
                    |  hier
              .col-12.col-lg-6
                img.img-stylist(src="@images/illustrations/bridlx-magnet.png" height="400")
      Footer
</template>

<script>
import Header from '@/components/header.vue'
import Splash from '@/components/become_a_stylist/splash.vue'
import Features from '@/components/become_a_stylist/features.vue'
import Footer from '@/components/landing_page/footer.vue'
import ContainerSlider from '@/components/container_slider.vue'
import SizedComponent from '@/components/landing_page/sized_component.vue'

export default {
  components: {
    Header,
    Splash,
    Features,
    ContainerSlider,
    Footer
  },
  data() {
    return {
      position: 0,
      headerLinks: [
        {url: "#", text: "Entdecken"},
        {url: "/become-a-stylist", text: "Stylist werden", active: true},
        {url: "#", text: "Login", modal: "signIn"},
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
    background-position-y: top;
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
      justify-content: space-between
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
