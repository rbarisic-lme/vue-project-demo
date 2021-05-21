<template lang="pug">
.bg-footer.pt-8
  .container.footer
    .row
      .col-12.col-md-4
        h3.heading-h3.serif.mb-4 {{$t('footer.contact')}}
        ul.no-padding
          li
            a(:href="`mailto:${$t('footer.email')}`") M. {{$t('footer.email')}}
          //- li
            a(href="tel:012 345 678 90") {{$t('footer.tel')}}
      .col-12.col-md-4
        h3.heading-h3.serif.mb-4 {{$t('footer.about')}}
        ul.no-padding
          li
            a(href="#") {{$t('footer.career')}}
          li
            a(href="#") {{$t('footer.press')}}
          li
            a(href="#") {{$t('footer.partners')}}
      .col-12.col-md-4
        h3.heading-h3.serif.mb-4 {{$t('footer.community')}}
        ul.no-padding
          li
            a(href="#") {{$t('footer.events')}}
          li
            a(href="#") {{$t('footer.blog')}}
          li
            a(href="#") {{$t('footer.podcast')}}
    .row.mt-8
      .col-12.col-md-5
        .footer-social-icons.flex
          a(href="https://www.instagram.com/bridlx/?hl=en" target="_blank")
            img.ml-0(src="~@images/icons/social/bridlx-instagram-circle.svg")
          a(href="https://www.facebook.com/bridlx/" target="_blank")
            img(src="~@images/icons/social/bridlx-facebook-circle.svg")
          a(href="https://www.youtube.com/channel/UCjwKh88ytpUxFbSS6kzRf2A" target="_blank")
            img(src="~@images/icons/social/bridlx-youtube-circle.svg")
          a(href="https://www.pinterest.de/bridlx/" target="_blank")
            img(src="~@images/icons/social/bridlx-pinterest-circle.svg")
          a(href="https://www.linkedin.com/company/feel-bridal/" target="_blank")
            img.mr-0(src="~@images/icons/social/bridlx-linkedin-circle.svg")
      .col-12.col-md-6.offset-md-1
        .footer-links.flex
          .copyright.p-4 &copy; {{$t('footer.copyright')}}
          a(href="#").p-4 {{$t('footer.help')}}
          a(href="/privacy").p-4 {{$t('footer.privacy')}}
          a(href="/imprint").p-4 {{$t('footer.imprint')}}
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
