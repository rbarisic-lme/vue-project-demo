<template lang="pug">
  Modal(name="certModal" height="auto" :maxWidth="600" :adaptive="true")
    div.m-8.cert-modal
      p Zertifizierung hinzufügen
      v-form(ref="form")
        v-container
          v-row
            v-text-field(:rules="fr.basic.presence" v-model="title" label="Titel des Zertifikats" autocomplete="off" placeholder="z.B. Make-Up Artist")
          v-row
            v-text-field(:rules="fr.basic.presence" v-model="certified_by" label="Aussteller des Zertifikats / Firma" autocomplete="off")
          v-row
            v-col
              v-menu(v-model="start_date_menu" transition="scale-transition" offset-y min-width="auto" :nudge-right="40" :close-on-content-click="false")
                template(v-slot:activator="{on, attrs}")
                  v-text-field(name="start_date" v-model="start_date" label="Von" prepend-icon="mdi-calendar" readonly v-bind="attrs" v-on="on")
                v-date-picker(name="start_date" v-model="start_date" @input="start_date_menu = false")
            v-col
              v-menu(v-model="end_date_menu" transition="scale-transition" offset-y min-width="auto" :nudge-right="40" :close-on-content-click="false")
                template(v-slot:activator="{on, attrs}")
                  v-text-field(name="end_date" v-model="end_date" label="Bis" prepend-icon="mdi-calendar" readonly v-bind="attrs" v-on="on")
                v-date-picker(name="end_date" v-model="end_date" @input="end_date_menu = false")
          v-row
            //- v-textarea(:rules="fr.basic.presence" name="input-7-1" v-model="body" filled label="Beschreibung des Zertifikats" auto-grow placeholder="Beschreibung")
          v-row
            v-btn(color="primary" @click="addNewCert" :loading="$store.state.stylist.dataParsing") hinzufügen
</template>

<script>
import FormRules from '@/data/form_rules.js';

export default {
  components: {
  },
  props: {

  },
  data() {
    return {
      valid: false,
      fr: FormRules,
      start_date_menu: false,
      start_date: undefined,
      end_date_menu: false,
      end_date: undefined,
      title: undefined,
      certified_by: undefined,
      body: undefined,
    }
  },
  computed: {

  },
  methods: {
    clearData() {
      this.title = undefined
      this.certified_by = undefined
      this.start_date = undefined
      this.end_date = undefined
      this.body = undefined
    },
    addNewCert() {
      if(this.$refs.form.validate()) {
        this.$store.dispatch('stylist/addNewCert', {
          'title': this.title,
          'certified_by': this.certified_by,
          'start_date': this.start_date,
          'end_date': this.end_date,
          'body': this.body,
        }).then(() => {
          this.$modal.hide('certModal')      
          this.clearData()
        })
      }
    }
  }
}
</script>

<style lang="scss" scoped>
  .cert-modal {
    max-height: 80vh;
  }

</style>