<template lang="pug">
  ContainerSlider(transitionSpeed="500000")
    .container-slider(key="1")
      .row.h100p.no-gutters(style="background: #c6d8b6;")
        .col-6
          .cover-image(style="background-image: ~@images/banner/Model1.jpeg")
        .col-6
          .p-8(style="max-width: 50%;")
            h2.heading-h2.serif.mb-4 Werde Stylist.
            p.lead Teile dein Profil und mache zukünftig noch mehr Bräute glücklich.
            a.lead-btn-stylist-1(href="#") Erfahre mehr
    .container-slider(key="2")
      .row.h100p.no-gutters(style="background: #f5ecdc;")
        .col-6
          .img-centered
            img(src="~@images/logos/bridlx-and-beyond-purple-and-black.svg")
        .col-6
          .p-8(style="max-width: 50%;")
            h2.heading-h2.serif.mb-4 Grenzenlos genießen.
            p.lead bridlx and beyond – der exklusive 24/7 Rundum-Service speziell für Weddingplanner, internationale Hochzeiten und vieles mehr.
            a.lead-btn-stylist-1(href="#") Entdecke mehr dazu
    .container-slider(key="3")
      .row.h100p.no-gutters(style="background: #2d2360; color: #fff;")
        .container
          .row
            .col-6
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
            .col-6
              video(autoplay loop muted playsinline preload="metadata" style="height: 400px; margin-left: auto; margin-right: 32px;")
                source(src="@assets/videos/bridlx-business-trailer.mp4" type="video/mp4")
                | Your browser does not support the video tag.
    .container-slider(key="4")
      .row.h100p.no-gutters
        .col-6
          .img-centered
            img(src="~@images/AdobeStock_355334010.jpg" style="height: 380px;")
        .col-6(style="background: #dcb3a5;")
          .p-8(style="max-width: 50%;")
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
      
  }}
}
</script>

<style lang="scss" scoped>
  .container-slider {
    height: 420px;
  }

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
    background-image: url(~@images/banner/Model1.jpeg);
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
</style>
