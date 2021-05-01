<template lang="pug">
  v-card(flat :height="overlay ? height : 'auto'")
    slot(name="default" v-if="!overlay || !hideContent" :overlay="overlay")
    slot(name="hideInactive" v-if="!overlay" :overlay="overlay")
    v-btn(rounded @click="resetOverlay" v-if="!overlay" v-show="!hideCancel").ml-2 Abbrechen

    v-overlay.text-dark(class="overlay-100" absolute :opacity="0.4" color="#d1dee6" :value="overlay")
      .overlay-text
        slot(name="overlay-text")
          
      .right-edge
        slot(name="overlay-actions")
            v-btn(text :color="color" @click="hideOverlay")
              v-icon(:color="color") {{icon}}
              span {{ text }}
</template>

<script>
export default {
  components: {

  },
  props: {
    hideContent: {
      type: Boolean,
      default: false
    },
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
    },
    clickPen: {
      default: null
    },
    hideCancel: {
      type: Boolean,
      default: false
    }
  },
  data() {
    return {
      overlay: true
    }
  },
  methods: {
    resetOverlay() {
      this.overlay = true
    },
    hideOverlay() {
      if (this.clickPen !== null) {
        this.clickPen()
      }
      this.overlay = false;
    }
  }
}
</script>

<style lang="scss" scoped>
  .overlay-100 /deep/ .v-overlay__content {
    width: 100%;
    height: 100%;
  }
  .overlay-100 {
    .overlay-text {
      top: 0;
      left: 0;
      position: absolute;
      width: 100%;
      height: 100%;
      color: #999;
      overflow: hidden;
    }
    .right-edge {
      top: 0;
      left: 0;
      position: absolute;
      width: 100%;
      height: 100%;
      display: flex;
      align-items: flex-end;
      justify-content: flex-end;
    }
  }
</style>
