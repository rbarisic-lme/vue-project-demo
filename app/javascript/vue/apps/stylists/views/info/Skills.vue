<template lang="pug">
  .container.p-0
    PortfolioForm
    SkillsForm
    CertificationsForm

</template>

<script>
import PortfolioForm from '@/components/stylist/forms/portfolio_form.vue'
import SkillsForm from '@/components/stylist/forms/skills_form.vue'
import CertificationsForm from '@/components/stylist/forms/certifications_form.vue'

export default {
  components: {
    PortfolioForm,
    SkillsForm,
    CertificationsForm,
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
