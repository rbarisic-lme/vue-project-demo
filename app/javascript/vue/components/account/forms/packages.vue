<template lang="pug">
  v-card
    v-tabs(v-model="tab" grow show-arrows)
      v-tab(v-for="pack in servicePacks" :key="pack.title" color="green") {{pack.title}}
    v-tabs-items(v-model="tab")
      v-tab-item(v-for="pack in servicePacks" :key="pack.title")
        v-card(flat)
          v-card-subtitle Im Paket enthalten:
          v-container(fluid)
            v-row
              v-col(v-for="service in pack.services" :key="service" sm="6")
                p
                  v-icon(color="green") mdi-check
                  span {{service}}
          //- v-card-text My Package

</template>

<script>
export default {
  components: {

  },
  props: {

  },
  data() {
    return {
      tab: 0,
      servicePacks: [
        {title: "Basic", services: [
          "Lorem", "ipsum", "dolor",
        ]},
        {title: "Standard", services: [
          "Lorem", "ipsum", "dolor", "sit", "amet"
        ]},
        {title: "Premium", services: [
          "Lorem", "ipsum", "dolor", "sit", "amet", "consectetur"
        ]},
      ]
    }
  }
}
</script>

<style lang="scss" scoped>

</style>
