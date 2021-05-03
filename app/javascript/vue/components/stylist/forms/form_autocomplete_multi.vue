<template lang="pug">
  EditableOverlay(:clickPen="getBackendItems" :height="height" ref="overlay")
    template(v-slot:default="slotProps")

      v-form(v-model="valid" ref="form" @submit="saveItems" @submit.prevent).mb-8

        v-autocomplete(
          :loading="!slotProps.overlay && backendItems < 1"
          :name="name"
          :rules="itemRules" :label="slotProps.hideOverlay ? this.label : ''"
          v-model="itemsInStore"
          :items="backendItemsOrStoreItems"
          item-text="name"
          item-value="id"
          chips deletable-chips
          multiple
        )
    template(v-slot:hideInactive)
      v-btn(rounded color="primary" @click="saveItems" :disabled="!valid || $store.state.stylist.dataParsing" :loading="$store.state.stylist.dataParsing") Speichern
</template>

<script>
import EditableOverlay from '@/components/editable_overlay.vue'
import { join } from 'lodash'

export default {
  components: {
    EditableOverlay
  },
  props: {
    height: {
      default: String,
      default: "auto"
    },
    label: String,
    saveAction: String,
    getAvailableAction: String,
    name: String,
    backendItemsName: Array,
    itemsInStoreName: Array,
    itemRules: {
      type: Array,
      default() {
        return 
          [
            value => !!value || 'wird benötigt.',
            value => !this.itemNames.includes(value) || 'Marke schon vorhanden.',
            value => value.length <= 10 || `Maximal 10 erlaubt. Bitte wähle ${value.length - 10} ab.`,
          ]
      }
    }
  },
  data() {
    return {
      valid: false,
    }
  },
  computed: {
    backendItemsOrStoreItems() {
      if (this.backendItems.length > 0) {
        return this.backendItems
      } else {
        return this.itemsInStore 
      }
    },
    itemNames() {
      return this.itemsInStore.map(item => { return item.name })
    },
    backendItems: {
      get() {
        return this.$store.getters[join(this.backendItemsName, '/')]
      },
      set(val) {
        this.$store.commit(join(this.backendItemsName, '/'), val)
      }
    },
    itemsInStore: {
      get() {
        return this.$store.getters[join(this.itemsInStoreName, '/')]
      },
      set(val) {
        this.$store.commit(join(this.itemsInStoreName, '/'), val)
      }
    }
  },
  methods: {
    getBackendItems() {
      this.$store.dispatch(this.getAvailableAction)
    },
    isValid() {
      return this.$refs.form.validate();
    },
    saveItems() {
      if(this.isValid()) {
        this.$store.state.stylist.dataParsing = true
        this.$store.dispatch(this.saveAction, this.itemsInStore)
        .then(result => {
          this.$toast.open(this.$t('form.message.update.success'))
        })
        .catch(error => {
          this.$toast.open({message: this.$t('form.message.update.failure'), type: 'error'});
        })
        .finally(() => {
          this.$store.state.stylist.dataParsing = false
          this.$refs.overlay.resetOverlay()
        })
      }      
    },
  },
}
</script>

<style lang="scss" scoped>

</style>
