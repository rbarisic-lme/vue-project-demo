<template lang="pug">
  .container
    DashboardView(v-if="stylist_tutorial_read")
    IntroView(v-else="stylist_tutorial_read")
</template>

<script>
  import DashboardView from '@/apps/stylists/views/dashboard/index.vue'
  import IntroView from '@/apps/stylists/views/dashboard/intro.vue'

  import { createHelpers } from 'vuex-map-fields';
  const { mapFields } = createHelpers({
    getterType: 'stylist/getField',
    mutationType: 'stylist/updateField',
  });

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
  },
  computed: {
    ...mapFields(['stylist_tutorial_read'])
  }
}
</script>

<style lang="scss" scoped>

</style>
