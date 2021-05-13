<template lang="pug">
  div
    .d-block.d-lg-none
      v-app-bar(fixed elevate-on-scroll style="z-index: 9900;")
        v-app-bar-nav-icon(@click="drawer = true")
        v-toolbar-title bridlx


      v-navigation-drawer(v-model="drawer" absolute temporary style="z-index: 9910;")
        v-list-item
          v-list-item-content
            v-list-item-title.title bridlx
        v-divider
        v-list(nav dense)
          v-list-item-group
            v-list-item(v-for="link in links", :key="link.text")
              v-list-item-title(v-if="link.modal" @click="$modal.show(link.modal); drawer = false") {{link.text}}
              v-list-item-title(v-else="link.modal" link :to="link.url") {{link.text}}

    .d-none.d-lg-block
      .header.flex.animate__animated(:class="{scrolled: scrolled, sticky: isSticky, animate__fadeInDown: !isSticky}")
        .header-logos.flex
          .item.p-3
            //- a(href="/")
            div
              img.logo-bridlx(src="@images/logos/bridlx-bright.svg" alt="bridlx")
          .item.half-visible.p-3
            //- a(href="#")
            div
              img.logo-bridlx-beyond(src="@images/logos/bridlx-and-beyond-bright.svg" alt="bridlx Business")
          .item.half-visible.p-3
            //- a(href="#")
            div
              img.logo-bridlx-business(src="@images/logos/bridlx-business-bright.svg" alt="bridlx and Beyond")
        .header-items.text-right
          span(v-for="link in links" :key="link.text")
            span(v-if="link.modal" @click="$modal.show(link.modal)" class="link-btn").p-3
              span {{link.text}}

            a(v-else="link.modal" :href="link.url" :class="{'link--active': link.active}").p-3
              span {{link.text}}



          //- a(href="#" class="hover:text-white").p-3 Entdecken
          //- a(href="become-a-stylist").p-3 Stylist werden
          //- div.link-btn.p-3(@click="$modal.show('userSignIn')") Login
    SignInModal
</template>

<script>
import SignInModal from '@/components/modals/sign_in_modal'

export default {
  components: {
    SignInModal,
  },
  props: {
    type: String,
    links: Array,
  },
  data() {
    return {
      scrollTop: 0,
      scrollThreshold: 200,
      drawer: false
    }
  },
  computed: {
    isSticky() {
      return this.type == 'sticky' ? true : false
    },
    scrolled() {
      return this.scrollTop > this.scrollThreshold ? true : false;
    }
  },
  mounted () {
    window.addEventListener('scroll', this.onScroll);
  },
  destroyed () {
    window.removeEventListener('scroll', this.onScroll);
  },
  methods: {
    onScroll (event) {
      this.scrollTop = window.scrollY - (window.scrollY % 100); //debounce
    }
  }
}
</script>

<style scoped lang="scss">
  .header {
    transition: all .3s;

    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    z-index: 999;
    padding: 32px 64px;
    align-items: flex-end;
    &.sticky {
      position: sticky !important;
      padding: 4px;
      background: #999;
    }
    .header-logos {
      width: 50%;
      .item {
        transition: all .3s;
        display: inline-block;
        max-width: 30vw;
        &.half-visible {
          opacity: 0.5;
          // &:hover {
            // opacity: 1;
          // }
        }
        img {
          display: inline-block;
        }
        img.logo-bridlx {
          max-height: 64px;
        }
        img.logo-bridlx-beyond {
          position: relative;
          top: 32px;
          max-height: 48px;
        }
        img.logo-bridlx-business {
          position: relative;
          top: 32px;
          max-height: 48px;
        }
      }
    }
    .header-items {
      width: 50%;
      a, .link-btn {
        position: relative;
        transition: all .2s;
        display: inline-block;
        color: #fff;
        top: 0px;
        cursor: pointer;
        &.link--active {
          border-bottom: 2px solid #fff;
          &:hover {
            top: 0px;
          }
        }
        &:hover {
          top: 4px;
        }
      }
    }
    &.scrolled {
      background: #dcb6aa;
      padding: 0 16px;
      box-shadow: 0 0 4px 0 rgba(0,0,0,0.4);
      .header-logos {
        .item {
          img.logo-bridlx {
            max-height: 32px;
          }
          img.logo-bridlx-beyond {
            position: relative;
            top: 32px;
            max-height: 32px;
            opacity: 0;
            display: none;
          }
          img.logo-bridlx-business {
            position: relative;
            top: 32px;
            max-height: 32px;
            opacity: 0;
            display: none;
            
          }
        }
      }
    }
  }
</style>
