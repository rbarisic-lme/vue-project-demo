<template lang="pug">
  div
    .pb-8
      div(v-if="loaded")
        Header(:links="headerLinks" static)
        //- h1 Stylist Profil
        .avatar-container
          .container.pad-bottom
            .relative-trick
              .avatar-shadow
                Avatar(:avatarImg="stylist.avatar_url" :initials="stylist.initials" size="180" :tile="true")
        .container
          .row
            .col-12.col-md-4.col-xl-3.colpad
              h2.heading-h2.serif.mb-3 {{stylist.first_name}} {{stylist.last_name}}
              div.mb-8(v-if="stylist.reviews.length > 0")
                v-icon.mr-2(color="amber") mdi-star
                span {{overallRatings}} bridlx Stars

              div.mb-4(v-if="stylist.certifications.length > 0")
                div.mb-2
                  b Zertifizierungen
                div(v-for="cert in stylist.certifications")
                  div {{cert.title}}

              div.mb-8(v-if="stylist.workspace_city")
                div.mb-2
                  b Standort
                p.p-city.d-flex.align-center
                  v-icon.mr-2(medium) mdi-map-marker-outline
                  span {{stylist.workspace_city}}
                div(v-if="stylist.service_mobility")
                  v-icon.mr-2(medium) mdi-car
                  span Mobil im Umkreis von {{stylist.service_radius}}km
                div(v-else="stylist.service_mobility")
                  v-icon.mr-2(medium) mdi-house
                  span Service-Vor-Ort


              .mb-8(v-if="stylist.brands.length > 0")
                .mb-2
                  b Produkte
                div
                  div(v-for="brand in stylist.brands.slice(0,5)" :key="brand.name") {{brand.name}}

              .mb-8(v-if="stylist.sustainable_materials_percent")
                .mb-2
                  b Nachhaltigkeit
                  div.hover-sustainable
                    EcoLeaf(:size="stylist.sustainable_materials_percent" :amount="stylist.sustainable_materials_percent")
                    .show-on-hover {{stylist.sustainable_materials_percent}}% Nachhaltige Materialien

              div.d-flex.justify-between
                div Mitglied seit {{memberSince}}
              //- div.d-flex.justify-between
                div Antwortzeit
                div 2 Stunden
              v-divider.my-8
              //- ABOUT
              h4.heading-h4.mb-2.serif Hi, ich bin {{stylist.first_name}}
              p.mb-8.serif {{stylist.about_me}}
              //- BigButton Nachricht Schreiben

              v-divider.my-8
              //- REVIEW COUNT 
              div.mb-2
                v-icon.mr-2(color="amber") mdi-star
                span(v-if="reviewCount > 0") {{reviewCount}} Bewertung(en)
                span(v-else="reviewCount > 0") Noch keine Bewertungen 
              div.mb-8(v-if="stylist.reviews.length > 0")
                div(v-for="item in [5,4,3,2,1]" :key="item")
                  .d-flex.space-between.align-center
                    div {{item}} Sterne
                    div.mx-4
                      v-progress-linear(color="amber" :style="progressStyle" :value="(stylist.ratings_by_stars[item] || 0) / stylist.reviews.length * 100")
                    div {{stylist.ratings_by_stars[item] || 0}}
              .mb-8(v-if="stylist.reviews.length > 0")
                Review.mb-4(v-for="review in stylist.reviews" :key="review.author" :review="review")

              BigButton(v-if="stylist.reviews.length > 3")
                span Alle Rezensionen
                v-icon.ml-2 mdi-chevron-right
            .col-12.col-md-8.col-xl-9.colpad
              Packages.mb-8(:packagePrices="packagePrices")
              Portfolio(:images="stylist.portfolio_images")
    Footer
</template>

<script>
import { format } from 'date-fns'


import Header from '@/components/header.vue'
import Footer from '@/components/landing_page/footer.vue'
import Avatar from '@/components/user/avatar.vue'
import BigButton from '@/components/big_button.vue'
import Review from '@/components/review.vue'
import Packages from '@/components/packages.vue'
import Portfolio from '@/components/portfolio.vue'
import EcoLeaf from '@/components/eco_leaf.vue'

export default {
  components: {
    Header,
    Footer,
    Avatar,
    BigButton,
    Review,
    Packages,
    Portfolio,
    EcoLeaf,
  },
  props: {

  },
  data() {
    return {
      loaded: false,
      stylist: {},
      md5_digest: this.$router.currentRoute.params.md5_digest,
      headerLinks: [
        {url: "#", text: "discover"},
        {url: "/become-a-stylist", text: "become_a_stylist", active: true},
        {url: "#", text: "login", modal: "signIn"},
      ],
      progressStyle: {
        width: "100px",
      }
    }
  },
  computed: {
    packagePrices() {
      return {
        'basic_hair': this.stylist.service_package_basic_hair_price,
        'basic_makeup': this.stylist.service_package_basic_makeup_price,
        'standard': this.stylist.service_package_standard_price,
        'premium': this.stylist.service_package_premium_price,
      }
    },
    reviewCount() {
      return this.stylist.reviews ? this.stylist.reviews.length : '' 
    },
    memberSince() {
      return format(new Date(this.stylist.created_at), 'MM.yyyy')
      // return moment(this.stylist.created_at).format("YYYY/MM")
    },
    overallRatings() {
      return this.stylist.overall_ratings ? this.stylist.overall_ratings.toFixed(1) : ''
    }
  },
  mounted() {
    this.$axios.get('/api/v1/stylists/public/' + this.md5_digest).then(result => {
      this.stylist = result.data
      this.loaded = true
    }).catch(error => {
      // window.location = '/'
    })
  }
}
</script>

<style lang="scss" scoped>
  .avatar-shadow {
    display: inline-block;
    background: #fff;
    padding: 1px;
    box-shadow: 1px 1px 8px rgba(0,0,0,0.4);
  }

  .avatar-container {
    background: #EECBC1;
    padding-top: 16;
  }
  .pad-bottom {
    margin-bottom: 72px;
  }
  .p-city {
    font-size: 16px;
    text-transform: uppercase;
  }
  .relative-trick {
    position: relative;
    top: 92px;
    margin-bottom: 32px;
  }
  .colpad {
    padding: 16px;
  }
  .hover-sustainable {
    user-select: none;
    -webkit-touch-callout: none;

    cursor: default;
    display: flex;
    justify-content: flex-start;
    align-items: center;
    .show-on-hover {
      transition: opacity .2s;
      opacity: 0.0;
      font-size: 18px;
    }
    &:hover {
      .show-on-hover {
        opacity: 1.0;
      }
    }
  }
</style>
