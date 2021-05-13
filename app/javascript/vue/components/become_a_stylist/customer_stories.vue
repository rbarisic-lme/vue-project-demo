<template lang="pug">
  .container.bridlx-features.pt-8.pb-8
    h2.heading-h2.serif.mt-4.mb-8.text-center Kunden Stories
    .container
      .row.customer-stories
        .col-12.col-md-6.customer-story(v-for="bride in brides" :key="bride.name")
            .cs--image(:style="{backgroundImage: 'url(' + bride.image + ')'}")
              .cs--image--bubble
            .cs--story(style="font-size: 28px;")
              p.lead {{bride.name}}
              p {{bride.body}}
</template>

<script>
import ImgFaye from '@images/brides/Faye.jpg'
import ImgGabriele from '@images/brides/Gabriele.jpg'
import ImgHelen from '@images/brides/Helen.jpg'
import ImgLisa from '@images/brides/Lisa.jpg'

export default {
  components: {

  },
  props: {

  },
  data() {
    return {
      brides: [
        {
          name: 'Faye',
          body: 'Ich kann nur sagen, dass Bridlx unsere Hochzeit und meine Vorstellung von einer perfekten Hochzeit komplettiert hat. Ich habe mich noch nie zuvor so wunderschön gefühlt.',
          image: ImgFaye,
        },
        {
          name: 'Gaby',
          body: 'Danke bridlx für euer perfektes Gefühl für Ästhetik und Natürlichkeit! Es war beruhigend, jemanden von euch an unserem großen Tag an meiner Seite gehabt zu haben.',
          image: ImgGabriele,
        },
        {
          name: 'Helen',
          body: 'Eine Hochzeit ist lang und vergeht gleichzeitig wie im Flug - mir war es wichtig, ein Make-Up und ein Haarstyling zu haben, was den ganzen Tag einfach perfekt hält. Bridlx hat alles nach meinen Wünschen und Vorstellungen umgesetzt.',
          image: ImgHelen,
        },
        {
          name: 'Lisa G.',
          body: 'Spielend leicht habe ich den Traumstylisten in meiner Umgebung gefunden! Ich kann sowohl den Service als auch die unkomplizierte Abwicklung jedem empfehlen. Mein Hochzeitstag war einfach perfekt.',
          image: ImgLisa,
        },
      ]
      // images: [ImgFaye, ImgGabriele, ImgHelen, ImgLisa]
    }
  }
}
</script>

<style lang="scss" scoped>
  .customer-story {
    height: 240px;
    padding: 0;
    .cs--image {
      display: inline-flex;
      height: 100%;
      background-size: cover;
      background-position: center;
      width: 240px;
      align-items: center;
      justify-content: flex-start;
      flex-direction: row-reverse;
      .cs--image--bubble {
        width: 0; 
        height: 0; 
        border-top: 25px solid transparent;
        border-bottom: 25px solid transparent; 
        border-right:30px solid #fff; 
      }
    }
    .cs--story {
      display: inline-block;
      width: 240px;
    }
  }
</style>
