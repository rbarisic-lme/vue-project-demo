<template lang="pug">
  div
    BlockWithInfo(title="Portfolio")
      .container
        .row
          .col-6.col-lg-4(v-for="image in portfolio_images" :key="image.id")
            PortfolioImage(:src="image.image_url" @click.native="showModalFor(image.id)")
      template(v-slot:info-text)      
        span Das Portfolio ist dein persönliches Aushängeschild und dient primär zur Entscheidungsfindung zukünftiger Kunden. Teile deine Highlights mit uns!
      template(v-slot:info-image)
        img(style="" src="@images/icons/Profilsichtbarkeit.png" width="92")
      template(v-slot:actions)
        v-btn(color="primary" rounded @click="$modal.show('portfolioModal')") Hinzufügen
    Modal(name="portfolioModal" height="auto" :maxWidth="600" :adaptive="true")
      .p-4
        p Bilder hinzufügen
        v-form(ref="newForm")
          v-file-input(v-model="tempPortfolioImage")
          v-img(src="tempPortfolioImage")
          v-btn(@click="saveNew" color="primary") Speichern
    Modal(name="portfolioModalEdit" height="auto" :maxWidth="600" :adaptive="true")
      .p-4
        div.m-8.portfolio-modal
          p.lead Bild bearbeiten
          img.big-image(:src="activeImage.image_url" v-if="activeImage")
          v-btn.mt-3(@click="deleteImg" color="primary") Löschen
</template>

<script>
import BlockWithInfo from '@/components/block_with_info.vue'
import PortfolioImage from '@/components/portfolio_image'

import { createHelpers } from 'vuex-map-fields';
const { mapFields } = createHelpers({
  getterType: 'stylist/getField',
  mutationType: 'stylist/updateField',
});

export default {
  components: {
    BlockWithInfo,
    PortfolioImage,
  },
  props: {

  },
  data() {
    return {
      tempPortfolioImage: undefined,
      activeImageId: undefined,
    }
  },
  computed: {
    activeImage() {
      return this.portfolio_images.find(el => {
        return el.id === this.activeImageId
      })
    },
    ...mapFields(['portfolio_images'])
  },
  methods: {
    showModalFor(id) {
      this.activeImageId = id
      this.$modal.show('portfolioModalEdit')
    },
    saveNew() {
      this.$store.dispatch('stylist/updatePortfolioImages', {
        image: this.tempPortfolioImage
      }).then(result => {
        this.tempPortfolioImage = undefined
        this.$modal.hide('portfolioModal')
      })
    },
    deleteImg() {
      this.$store.dispatch('stylist/updateAccount', [
        {name: 'portfolio_images_attributes[]', value: JSON.stringify({
          'id': this.activeImageId,
          '_destroy': true
        })}
      ]).then(result => {
        this.activeImage = undefined
        this.$modal.hide('portfolioModalEdit')
      })
    }
  }
}
</script>

<style lang="scss" scoped>
  .portfolio-modal {
    max-height: 80vh;
  }
</style>
