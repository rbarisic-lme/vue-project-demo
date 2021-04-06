<template lang="pug">
  .input-annotated(v-on:click="setFocus" :style="wrapperStyle")
    .annotation(:style="annotationStyle") {{annotation}}
    //- div(v-show="focused")
    input(type="text" :name="name" :placeholder="description" ref="input" :style="inputStyle" autocomplete="false")
    //- div(v-show="!focused")
      //- .placeholder {{description}}
</template>

<script>
export default {
  components: {

  },
  props: {
    annotation: String,
    name: String,
    description: String,
  },
  data() {
    return {
      focused: false,
      height: 0,
    }
  },
  computed: {
    wrapperStyle() {
      return {
        height: this.height > 0 ? this.height + "px" : 'unset',
      }
    },
    annotationStyle() {
      return {
        "font-size": this.focused ? "12px" : "16px",
        "margin-bottom": this.focused ? "4px" : "0px"
      }
    },
    inputStyle() {
      return {
        "font-size": this.focused ? "16px" : "inherit",
      }
    }
  },
  methods: {
    setFocus() {
      this.focused = true;
      this.height = this.$el.offsetHeight;
      window.setTimeout(() => {
        this.$refs.input.focus();
      }, 50)
    },
  }
}
</script>

<style lang="scss" scoped>
  $bg: rgba(255,255,255,0.7);

  .input-annotated {
    padding: 10px 8px;
    cursor: pointer;
    background-color: $bg;

    &:hover {
      background-color: rgba(255,255,255,0.9);
    }

    .annotation, input, .placeholder {
      transition: all .3s;
      text-align: center;
      width: 100%;
      cursor: pointer;
    }
    .annotation {
      color: #333;
      text-transform: uppercase;
    }
    .placeholder {
      color: #777;
    }
    .annotation, .placeholder {
      font-size: 1rem;
    }
    input {
      color: #333;
      background: none;
      outline: none;
      border: none;
      animation-name: underline;
      animation-duration: 3s;
      &:focus {
        &::placeholder {
          opacity: 0;
        }
      }
      &::placeholder {
        color: #555;
      }
    }
  }
</style>
