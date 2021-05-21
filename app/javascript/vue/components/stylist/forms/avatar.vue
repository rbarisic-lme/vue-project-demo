<template lang="pug">
  div()
    v-avatar.mb-4.ml-3(color="accent" :size="size" class="editable-avatar" @click.native="clickFile")
      img(v-if="avatar_url" :src="avatar_url")
      span(v-else="avatar_url").white--text.headline {{initials}}
      .avatar-overlay
        v-icon mdi-camera
    p {{first_name}} {{last_name}}
    v-file-input(v-model="avatar" accept="image/png, image/jpeg, image/bmp" placeholder="Profilbild hochladen" prepend-icon="mdi-camera" label="Profilbild" style="display: none" ref="fileInput")
    v-btn(elevation="0" rounded v-if="avatarSize > 0" color="primary" @click="uploadAvatar" :loading="loading") Speichern
</template>

<script>
import Avatar from '@/components/user/avatar.vue'
import { createHelpers } from 'vuex-map-fields';

const { mapFields } = createHelpers({
  getterType: 'stylist/getField',
  mutationType: 'stylist/updateField',
});

export default {
  components: {
    Avatar
  },
  props: {

  },
  data() {
    return {
      size: 180,
      loading: false,
      avatar: null,
      rules: [
        value => !value || value.size < 2000000 || 'Avatar size should be less than 2 MB!',
      ],
    }
  },
  computed: {
    // fileBtn() {
    //   return this.$refs.fileInput
    //   console.log(this.$refs.fileInput)
    // },
    avatarSize() {
      if (this.avatar === null) {
        return 0
      } else {
        return this.avatar.size
      }
    },
    ...mapFields(['avatar_url', 'initials', 'first_name', 'last_name'])
  },
  mounted() {
  },
  methods: {
    clickFile() {
      console.log(this.$refs.fileInput)
      this.$refs.fileInput.$refs.input.click()
    },
    uploadAvatar() {
      this.loading = true

      this.$store.dispatch("stylist/updateAvatar", this.avatar)
      .then(response => {
        this.$toast.open('Profilbild erfolgreich hochgeladen');

      })
      .catch((error) => {
       this.$toast.open({message: this.$t('form.message.update.failure'), type: 'error'});
      }).finally(response => {
        this.avatar = null
        this.loading = false
      })
    }
  }
}
</script>

<style lang="scss" scoped>
  .editable-avatar {
    border: 2px solid #000;
    .avatar-overlay {
      position: absolute;
      top: 0;
      left: 0;
      height: 100%;
      width: 100%;
      display: flex;
      justify-content: center;
      align-items: center;
      opacity: 0.0;
      transition: opacity .2s;
      background: rgba(0,0,0,0.8);
      color: #fff;
      font-size: 22px;
      &:hover {
        opacity: 1.0;
        cursor: pointer;
      }
      i.v-icon {
        color: #fff;
      }
    }
  }
</style>
