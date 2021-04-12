<template lang="pug">
  v-card(flat :height="height")
    slot
    v-overlay.text-dark(absolute :opacity="0.5" color="#d1dee6" :value="overlay")
      div.right-edge.text-center
        slot(name="overlay-text")
        v-btn(text :color="color" @click="hideOverlay")
          v-icon(:color="color") {{icon}}
          span {{ text }}
</template>

<script>
export default {
  components: {

  },
  props: {
    color: {
      type: String,
      default: '#2d1f69'
    },
    height: {
      type: [String, Number],
      default: 'auto'
    },
    icon: {
      type: String,
      default: 'mdi-pencil'
    },
    text: {
      type: String,
      default: 'Bearbeiten'
    }
  },
  data() {
    return {
      overlay: true
    }
  },
  methods: {
    hideOverlay() {
      this.overlay = false;
    }
  }
}
</script>

<style lang="scss" scoped>
</style>
