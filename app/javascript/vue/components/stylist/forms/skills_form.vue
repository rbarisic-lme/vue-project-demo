<template lang="pug">
BlockWithInfo(title="Fähigkeiten")

  v-container(v-if="skills.length > 0")
    v-row
      v-col
        div.skill-title.mb-3 Experten Skills
        div.skills(v-for="skill in skills" :key="skill.name" v-if="skill.level == 3")
          span {{$t('form.label.skill.' + skill.name)}}
      v-col
        div.skill-title.mb-3 Top-Level Skills
        div.skills(v-for="skill in skills" :key="skill.name" v-if="skill.level == 2")
          span {{$t('form.label.skill.' + skill.name)}}
      v-col
        div.skill-title.mb-3 Branchenwissen
        div.skills(v-for="skill in skills" :key="skill.name" v-if="skill.level == 1")
          span {{$t('form.label.skill.' + skill.name)}}
  p.lead(v-else="skills.length > 0") Zeige deinen Kunden, was du kannst.
  template(v-slot:actions)
    v-btn(color="primary" rounded @click="$modal.show('skillsModal')") Hinzufügen

  template(v-slot:info-text)
    span Deine Fähigkeiten müssen entsprechend honoriert werden! Teile sie wahrheitsgemäß mit zukünftigen Kunden!
  template(v-slot:info-image)      
    img(style="" src="@images/icons/Bewertungen.png" width="92")

  Modal(name="skillsModal" height="auto" :maxWidth="600" :adaptive="true")
    div.m-8.skills-modal
      p Fähigkeit hinzufügen
      v-combobox(multiple chips v-model="skillsTemp" :items="skillsJson" item-value="item.name" :item-text="itemText")
      div(v-if="skillsTemp.length > 0")
        v-container
          v-row
            v-col
              div Fähigkeit
            v-col
              v-tooltip(top)
                span 1 Stern: Branchenwissen, 2 Sterne: Top-Level, 3 Sterne: Experte
                template(v-slot:activator="{ on, attrs }")
                  span Skill-Level&nbsp;
                  v-icon(v-on="on" v-bind="attrs") mdi-information
          v-row(dense v-for="skill in skillsTemp" :key="skill.name")
            v-col.d-flex.justify-start.align-center
              span {{itemText(skill)}}
            v-col
              v-rating(length="3" v-model="skillsRated[skill.name]")
          v-row
            v-col
              v-btn(color="primary" rounded @click="save" :disabled="savableValid" :loading="dataParsing") Speichern
              p.text-info(v-show="savableValid") Bewerte deine Skills vor dem Speichern.
</template>

<script>
import BlockWithInfo from '@/components/block_with_info.vue'
import SkillsJSON from '@/data/skills.json'

import { createHelpers } from 'vuex-map-fields';
const { mapFields } = createHelpers({
  getterType: 'stylist/getField',
  mutationType: 'stylist/updateField',
});

export default {
  components: {
    BlockWithInfo,
  },
  props: {

  },
  data() {
    return {
      skillsJson: SkillsJSON,
      skillsTemp: this.$store.state.stylist.skills,
      skillsRated: this.reduceSkills(this.$store.state.stylist.skills),
    }
  },
  computed: {
    savableSkills() {
      let array = this.skillsTemp.map(item => {
        return {
          id: item.id ? item.id : undefined,
          name: item.name,
          level: this.skillsRated[item.name]
        }
      })

      return array
    },
    savableValid() {
      return this.savableSkills.filter(item => {
        return item.level === null || item.level === undefined
      }).length > 0
    },
    ...mapFields(['skills', 'dataParsing'])
  },
  methods: {
    calculateSavableSkills() {
      let array = this.savableSkills

        this.$store.state.stylist.skills.forEach(storeSkill => {
          if (!this.savableSkills.find(item => { return item.name == storeSkill.name })) {
            storeSkill['_destroy'] = true
            array.push(storeSkill)
          }
        })

      return array
    },
    reduceSkills(payload) {
      let result = payload.reduce((sum, item) => {
        sum[item.name] = item.level
        return sum
      }, {})
      return result;
    },
    itemText(item) {
      return this.$t('form.label.skill.' + item.name)
    },
    save() {
      // if(this.savableValid) {
        this.$store.dispatch('stylist/updateSkills', this.calculateSavableSkills()).then(result => {
          this.skillsTemp = this.$store.state.stylist.skills
          this.skillsRated = this.reduceSkills(this.$store.state.stylist.skills)
        })
      // }
    },
  },
}
</script>

<style lang="scss" scoped>
  .skills-modal {
    max-height: 80vh;
  }
  .skill-title {
    font-size: 18px;
    color: #999;
    font-weight: bold;
  }
  .skills {
    color: #2c1d69;
  }
</style>
