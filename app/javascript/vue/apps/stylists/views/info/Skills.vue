<template lang="pug">
  .container.p-0
    BlockWithInfo(title="Portfolio")
      template(v-slot:info-text)      
        span Das Portfolio ist dein persönliches Aushängeschild und dient primär zur Entscheidungsfindung zukünftiger Kunden. Teile deine Highlights mit uns!
      template(v-slot:info-image)      
        img(style="" src="@images/icons/Profilsichtbarkeit.png" width="92")

    SkillsForm

    BlockWithInfo(title="Zertifizierungen")
      h3.heading-h3(color="primary") Lass dir deine Skills bestätigen

      template(v-slot:info-text)      
        span Dein Können wurde bereits prämiert- Gratulation! Teile es mit deinen Kunden.
      template(v-slot:info-image)      
        img(style="" src="@images/icons/Zertifikat.png" width="92")
</template>

<script>
import SkillsForm from '@/components/stylist/forms/skills_form.vue'
import BlockWithInfo from '@/components/block_with_info.vue'

export default {
  components: {
    BlockWithInfo,
    SkillsForm,
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
  .block-container {
    display: flex;

  }
  .bc--content {
    flex-grow: 1;
  }
  .bc--info {
    max-width: 20%;
  }
  .infotext {
    font-size: 0.9rem;
    word-break: break-word;
  }
</style>
