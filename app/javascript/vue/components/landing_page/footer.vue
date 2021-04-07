<template lang="pug">
.bg-footer.pt-8
  .container.footer
    .row
      .col-12.col-md-4
        h3.heading-h3.serif.mb-4 contact
        ul.no-padding
          li
            a(href="mailto:contact@bridlx.com") M. contact@bridlx.com
          li
            a(href="tel:012 345 678 90") F. 012 345 678 90
      .col-12.col-md-4
        h3.heading-h3.serif.mb-4 about
        ul.no-padding
          li
            a(href="#") Karriere
          li
            a(href="#") Presse
          li
            a(href="#") Partnerschaften
      .col-12.col-md-4
        h3.heading-h3.serif.mb-4 community
        ul.no-padding
          li
            a(href="#") Veranstaltungen
          li
            a(href="#") Blog
          li
            a(href="#") Podcast
    .row.mt-8
      .col-12.col-md-5
        .footer-social-icons.flex
          a(href="#")
            img.ml-0(src="~@images/icons/social/bridlx-instagram-circle.svg")
          a(href="#")
            img(src="~@images/icons/social/bridlx-facebook-circle.svg")
          a(href="#")
            img(src="~@images/icons/social/bridlx-youtube-circle.svg")
          a(href="#")
            img(src="~@images/icons/social/bridlx-pinterest-circle.svg")
          a(href="#")
            img.mr-0(src="~@images/icons/social/bridlx-linkedin-circle.svg")
      .col-12.col-md-6.offset-md-1
        .footer-links.flex
          .copyright.p-4 &copy; 2021 bridlx
          a(href="#").p-4 Hilfe & Support
          a(href="#").p-4 Datenschutz
          a(href="#").p-4 Impressum
</template>

<script>
export default {
  components: {

  },
  props: {

  },
  data() {
    return {
      
    }
  }
}
</script>

<style lang="scss" scoped>
  .bg-footer {
    background-color: #eae0cb;
    width: 100%;
  }
  .footer {
    a {
      display: inline-block;
      color: #000;
      &:hover {
        text-decoration: underline;
      }
    }
    .footer-social-icons {
      max-width: 100%;
      img {
        max-height: 48px;
        margin-right: 1rem;
        display: inline-block;
        width: 48px;
      }
      @media screen and (max-width: 720px) {
        justify-content: space-between;
        img {
          margin-right: 0;
        }
      }
    }
    .footer-links {
      max-width: 100%;
      height: 100%;
      align-items: flex-end;
      @media screen and (max-width: 720px) {
        justify-content: space-between;
        flex-direction: column;
        align-items: center;
      }
    }
  }
</style>
