<template lang="pug">
  ContainerSlider(transitionSpeed="5000" height="600")
    .container-slider(key="1" style="height: 600px")
      .row.h100p.no-gutters(style="background: #c6d8b6;")
        .col-6.d-none.d-lg-block
          .flex-horizontal
            img.stylist-portrait(v-show="portraitIndex == 0" src="~@images/lp/become-a-stylist/b-portrait-1.jpg" style="height: 600px")
            img.stylist-portrait(v-show="portraitIndex == 1" src="~@images/lp/become-a-stylist/b-portrait-2.jpg" style="height: 600px")
            img.stylist-portrait(v-show="portraitIndex == 2" src="~@images/lp/become-a-stylist/b-portrait-3.jpg" style="height: 600px")
        .col-12.col-lg-6.h-100.centered-item
          .p-8.mw-50-md-up
            h2.heading-h2.serif.mb-4 Werde Stylist.
            p.lead Teile dein Profil und mache zukünftig noch mehr Bräute glücklich.
            a.lead-btn-stylist-1(href="#") Erfahre mehr
    .container-slider(key="2" style="height: 600px")
      .row.h100p.no-gutters(style="background: #f5ecdc;")
        .col-6.d-none.d-lg-block
          .img-centered
            img(src="~@images/logos/bridlx-and-beyond-purple-and-black.svg")
        .col-12.col-lg-6.h-100.centered-item
          .p-8.mw-50-md-up
            h2.heading-h2.serif.mb-4 Grenzenlos genießen.
            p.lead bridlx and beyond – der exklusive 24/7 Rundum-Service speziell für Weddingplanner, internationale Hochzeiten und vieles mehr.
            a.lead-btn-stylist-1(href="#") Entdecke mehr dazu
    .container-slider(key="3" style="height: 600px")
      .row.h100p.no-gutters(style="background: rgb(27 42 85); color: #fff;")
        .container
          .row.h-100
            .col-12.col-lg-6.h-100.centered-item
              .p-8
                h2.heading-h2.serif.mb-4
                  img(src="~@images/logos/bridlx-business-bright.svg" style="max-height: 96px;")

                p.lead Profitiere als Unternehmen von vielen Vorteilen:
                ul.no-padding.checks.mb-8
                  li.checks
                    img(src="~@images/icons/ui/checkmark-white.svg")
                    span Reduziere deine Marketingkosten
                  li.checks
                    img(src="~@images/icons/ui/checkmark-white.svg")
                    span Booste deine Reichweite
                  li.checks
                    img(src="~@images/icons/ui/checkmark-white.svg")
                    span Werde Teil des Ecosystems
                a.lead-btn-stylist-1.lead-btn-stylist-white(href="#") Entdecke mehr dazu
            .col-6.d-none.d-lg-block
              video(autoplay loop muted playsinline preload="metadata" style="height: 400px; margin-left: auto; margin-right: 32px;")
                source(:src="`${$config.awsPath}/videos/bridlx-business-trailer.mp4`" type="video/mp4")
                | Your browser does not support the video tag.
    .container-slider(key="4" style="height: 600px")
      .row.h100p.no-gutters
        .col-6.d-none.d-lg-block
          .img-centered
            img(src="~@images/AdobeStock_355334010.jpg" style="height: 380px;")
        .col-12.col-lg-6.h-100(style="background: #dcb3a5;").centered-item
          .p-8
            h2.heading-h2.serif.mb-4 Digital Add-Ons
            p.lead Neben unserem bridlx E-Learning Kurs bereiten dich unsere hochqualifizierten Coaches perfekt auf deine Hochzeit vor.
            p.lead Profitiere jederzeit & überall von unserem digitalen Angebot, unter anderem im Bereich Fitness und Yoga.
            a.lead-btn-stylist-1(href="#") Go Digital!
</template>

<script>
  import ContainerSlider from '@/components/container_slider.vue'

export default {
  components: {
    ContainerSlider
  },
  props: {

  },
  data() {
    return {
      portraitIndex: 0,
      eventId: undefined,
  }},
  mounted() {
    this.eventId = setInterval(() => {
      if (this.portraitIndex > 1) {
        this.portraitIndex = 0
      } else {
        this.portraitIndex++
      }

    }, 1000)
  }
}
</script>

<style lang="scss" scoped>
  .text-col {
    background-color: #c6d8b6;
  }

  .img-centered {
    display: flex;
    justify-content: center;
    align-items: center;
    width: 100%;
    height: 100%;
  }

  .cover-image {
    height: 100%;
    width: 100%;
    background-size: cover;
    // background-image: url(~@images/lp/become-a-stylist/portrait-1.jpg);
  }
  .h100p {
    height: 100%;
  }

  ul {
    li.checks {
      list-style: none;
      img {
        display: inline-block;
        max-height: 48px;
        margin-right: 8px;
      }
    }
  }

  .lead-btn-stylist-1 {
    transition: all .2s;
    display: inline-block;
    font-size: 16px;
    padding: 12px 40px;
    border: 2px solid #333;
    color: #333;
    font-weight: 600;
    &:hover {
      color: #fff;
      background: #333;
    }
    &.lead-btn-stylist-white {
      color: #fff;
      border-color: #fff;
      &:hover {
        color: #333;
        background: #fff;
      }
    }
  }

  .mw-50-md-up {
    max-width: 50%;
    @media screen and (max-width: 720px) {
      max-width: unset;
    }
  }

  .flex-horizontal {
    position: relative;
    display: flex;
    max-width: 100%;
    overflow: hidden;
    img {

    }
    .stylist-portrait {
    }
  }

  .centered-item {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
  }
</style>
