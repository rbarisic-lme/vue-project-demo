<template lang="pug">
  .container
    v-sheet.px-8.py-4.mb-8(rounded elevation="2" style="min-height: 60vh")
      .chat-app
        .col-3.h-100.chat--contacts
          p.lead Konversationen
        .col-7.h-100.chat--main
        .col-2.h-100.chat--info
          p.lead Informationen
    DisabledOverlay
      h2.heading-h2 Diese Funktion ist während der Pre-Launch Phase noch nicht verfügbar.
</template>

<script>
import DisabledOverlay from '@/components/disabled_overlay.vue'

export default {
  components: {
    DisabledOverlay
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
  .h-100 {
    height: 100%;
  }

  .chat-app {
    display: flex;
    height: 100%;
    .chat--contacts {
      // border-right: 1px solid #333;
    }
    .chat--main {
      // border-right: 1px solid #333;
    }
    .chat--info {

    }
  }
</style>
