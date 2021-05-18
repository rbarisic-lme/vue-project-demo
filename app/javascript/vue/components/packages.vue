<template lang="pug">
  v-sheet(outlined)
    v-tabs(v-model="tab" grow show-arrows)
      v-tab(v-for="pack in servicePackagesJson" :key="pack.title" color="green") {{$t('form.label.service_package_'+pack.title+'_price')}}
    v-tabs-items(v-model="tab")
      v-tab-item(v-for="pack in servicePackagesJson" :key="pack.title")
        v-card(flat)
          v-card-subtitle Im Paket enthalten:
          v-container(fluid).p-3
            v-row
              v-col(v-for="service in pack.services" :key="service" sm="6")
                p.small-text
                  v-icon(color="green") mdi-check
                  span {{service}}
          p.serif.p-3
            span.price-big € {{parseInt(packagePrices[pack.title])}},-
</template>

<script>
import ServicePackagesJSON from '@/data/service_packages_array.json'

export default {
  components: {

  },
  props: ['servicePacks', 'packagePrices'],
  data() {
    return {
      tab: 0,
      servicePackagesJson: ServicePackagesJSON
    }
  }
}
</script>

<style lang="scss" scoped>
  .small-text {
    font-size: 14px;
  }
  .price-big {
    text-decoration: underline;
    border-bottom: 2px solid #333;
    font-size: 24px;
    padding-bottom: 2px;
  }
</style>
