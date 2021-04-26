<template lang="pug">
  .container
    DashboardView(v-if="$store.state.account.account_completed")
    IntroView(v-else="$store.state.account.account_completed")
</template>

<script>
  import DashboardView from '@/apps/stylists/views/dashboard/index.vue'
  import IntroView from '@/apps/stylists/views/dashboard/intro.vue'
export default {
  components: {
    DashboardView,
    IntroView,
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

</style>
