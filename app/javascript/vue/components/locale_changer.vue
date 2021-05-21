<template lang="pug">
  span.locale.link-btn(@click="changeLocale")
    span(:class="{'grayed-out': $i18n.locale == 'en'}") DE
    span(:class="{'grayed-out': $i18n.locale == 'de'}") &nbsp;| EN
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
  },
  computed: {
    localeThis() {
      return this.$i18n.locale.toUpperCase()
    },
    localeOther() {
      return this.$i18n.locale == 'de' ? 'EN' : 'DE'
    }
  },
  methods: {
    changeLocale() {
      if (this.$i18n.locale == 'de') {
        this.$i18n.locale = 'en'
      } else {
        this.$i18n.locale = 'de'
      }
    },
  }
}
</script>

<style lang="scss" scoped>
  .locale {
    user-select: none;
    span {
      transition: color .2s;
    }
    .grayed-out {
      color: #999;
    }
    cursor: pointer;
    color: #fff;
  }
</style>
