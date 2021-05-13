<template lang="pug">
  .container.bridlx-features.pt-8.pb-8
    h2.heading-h2.serif.mt-4.mb-8.text-center Q&A

    v-expansion-panels(accordion)
      v-expansion-panel(v-for="item in questions" :key="item.question")
        v-expansion-panel-header
          b {{item.question}}
        v-expansion-panel-content {{item.answer}}

</template>

<script>
import QAJSON from "@/data/q_and_a_list.json"
export default {
  components: {

  },
  props: {

  },
  data() {
    return {
      questions: QAJSON
    }
  }
}
</script>

<style lang="scss" scoped>

</style>
