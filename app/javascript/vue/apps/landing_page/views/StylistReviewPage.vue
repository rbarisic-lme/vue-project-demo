<template lang="pug">
  div.d-flex.direction-column.justify-between.container-max()
    Header(:links="headerLinks" :static="true")
    v-card.review-container.p-4(v-if="loaded")
      .d-flex.align-center.justify-center.mb-4
        Avatar.mr-4(:avatarImg="stylist.avatar_url" :initials="stylist.initials" size="96")
        div
          h2.heading-h2.serif {{stylist.first_name}} {{stylist.last_name}}
          .d-flex.align-center
            div(v-if="stylist.workspace_city") Stylist aus {{stylist.workspace_city}}
      v-divider.my-4
      div(v-if="alreadyReviewed")
        div.py-4
          div Du hast {{stylist.first_name}} bewertet.
          div Bestätige dein Review bitte per E-Mail.
          br
          div Danke für deinen Beitrag!
      div(v-else="alreadyReviewed")
        .step(v-show="step === 1")
          .d-flex.align-center.direction-column
            div
              .mb-4 {{stylist.first_name}} würde sich sehr über deine Rezension freuen.
              .rating-container
                div
                  b Qualität
                v-rating(color="amber" background-color="amber" hoverlength="5" size="32" v-model="rating_quality")
              .rating-container
                div
                  b Termintreue
                v-rating(color="amber" background-color="amber" hoverlength="5" size="32" v-model="rating_timeliness")
              .rating-container
                div
                  b Kommunikation
                v-rating(color="amber" background-color="amber" hoverlength="5" size="32" v-model="rating_communication")
            div.mt-4
              v-btn(color="primary" rounded :disabled="!starsValid" @click="toStep(2)") Weiter
        .step(v-show="step === 2")
          .review-body.mt-4
            v-textarea(outlined placeholder="Kommentar (optional)")
            div.mt-4.d-flex.justify-center
              v-btn.mr-2(rounded @click="toStep(1)") Zurück
              v-btn(color="primary" rounded @click="toStep(3)") Weiter
        .step(v-show="step === 3")
          .review-body.mt-4
            v-form(ref="formthree" v-model="formthreeValid")
              v-text-field(label="Ihr Name" :rules="fr.stylist.first_name" v-model="rating_author")
              v-text-field(label="E-Mail Adresse" :rules="fr.stylist.email" type="email" v-model="rating_email")
              v-checkbox(:rules="fr.basic.presence" v-model="rating_accept_terms")
                template(v-slot:label)
                  .align-center(@click.stop)
                    span Ich akzeptiere die&nbsp;
                    a(href="/terms" target="_blank") ABG
                    span &nbsp;von bridlx.com

              p Ihre E-Mail Adresse wird nur zur Verifizierung der Rezension verwendet. Sie müssen keinen Account erstellen.
              div.mt-4.d-flex.justify-center
                v-btn.mr-2(rounded @click="toStep(2)") Zurück
                v-btn(color="primary" rounded @click="sendReview" :disabled="!formthreeValid") Abschicken
    div(v-else="loaded")
      v-skeleton-loader(type="card" max-width="300" class="mx-auto")
    Footer

</template>

<script>
import FormRules from '@/data/form_rules.js';

import Header from '@/components/header.vue'
import Footer from '@/components/landing_page/footer.vue'
import Avatar from '@/components/user/avatar.vue'

export default {
  components: {
    Header,
    Footer,
    Avatar,
  },
  props: {

  },
  data() {
    return {
      loaded : false,
      fr: FormRules,
      rating_quality: 5,
      rating_timeliness: 5,
      rating_communication: 5,
      rating_body: undefined,
      rating_author: undefined,
      rating_email: undefined,
      rating_accept_terms: false,
      formthreeValid: false,
      position: 0,
      step: 1,
      md5_digest: this.$router.currentRoute.params.md5_digest,
      alreadyReviewed: true,
      stylist: {},
      headerLinks: [
        {url: "#", text: "discover"},
        {url: "/become-a-stylist", text: "become_a_stylist", active: true},
        {url: "#", text: "login", modal: "signIn"},
      ]
    }
  },
  computed: {
    textValid() {
      if(this.$refs.formthree.validate()) {
        return true
      } else {
        return false
      }
    },
    starsValid() {
      if(this.rating_quality && this.rating_timeliness && this.rating_communication) {
        return true
      } else {
        return false
      }
    },
  },
  methods: {
    toStep(step) {
      this.step = step
    },
    markAsReviewed() {
      localStorage[`bridlx_review_sent_${this.md5_digest}`] = true
      this.alreadyReviewed = true
    },
    sendReview() {
      let formData = new FormData();

      formData.append('review[user_id]', this.stylist.id)
      formData.append('review[author]', this.rating_author)
      formData.append('review[email]', this.rating_email)
      formData.append('review[rating_quality]', this.rating_quality)
      formData.append('review[rating_timeliness]', this.rating_timeliness)
      formData.append('review[rating_communication]', this.rating_communication)
      formData.append('review[accept_terms]', this.rating_accept_terms)

      if(this.rating_body) {
        formData.append('review[body]', this.rating_body)
      }

      this.$axios.post('/api/v1/reviews', formData, {
        headers: { "Content-Type": "multipart/form-data" }
      }).then(result => {
        this.$toast.open(this.$t('form.message.update.success'))
        this.markAsReviewed()
      }).catch(error => {
        this.$toast.open({message: this.$t('form.message.update.failure'), type: 'error'});
      })
    }
  },
  mounted() {
    this.alreadyReviewed = localStorage[`bridlx_review_sent_${this.md5_digest}`]

    this.$axios.get('/api/v1/stylists/public/' + this.md5_digest).then(result => {
      this.stylist = result.data
      this.loaded = true

    }).catch(error => {
      // window.location = '/'
    })
  }
}
</script>

<style lang="scss" scoped>
  .review-container {
    display: inline-block;
    margin: 0 auto;
  }
  .direction-column {
    flex-direction: column;
  }
  .container-max {
    min-height: 100%;
  }
  .rating-container {
    display: flex;
    justify-content: flex-end;
    align-items: center;
  }
</style>
