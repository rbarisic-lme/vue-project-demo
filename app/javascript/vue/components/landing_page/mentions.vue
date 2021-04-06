<template lang="pug">
  .mentions-wrapper
    .container
      .row
        .col-12
          .mentions.flex.items-center.justify-between
            .item.p-4 Bekannt aus:
            .item.p-4
              img(src="https://camo.githubusercontent.com/cfcc81d0e79dc087d60e941644be683a0e504668393b601e3a29dad8e7f04ae6/687474703a2f2f7069676d656e742e6769746875622e696f2f66616b652d6c6f676f732f6c6f676f732f766563746f722f677261797363616c652f6265617574792d626f782e737667")
            .item.p-4
              img(src="https://camo.githubusercontent.com/85b4e5fbb5fecd46465ae390f276729b0dd550a32d038de7f17025e1d7abbb9b/687474703a2f2f7069676d656e742e6769746875622e696f2f66616b652d6c6f676f732f6c6f676f732f766563746f722f677261797363616c652f666173742d62616e616e612e737667")
            .item.p-4
              img(src="https://camo.githubusercontent.com/95fe54f793dee4a2c6c4ba97672f2504c5f400f7362bfe7574a2c2e0658b5737/687474703a2f2f7069676d656e742e6769746875622e696f2f66616b652d6c6f676f732f6c6f676f732f766563746f722f677261797363616c652f796f67612d626162792e737667")
            .item.p-4
              img(src="https://camo.githubusercontent.com/7bed464c19a1f1083b333443d9903d5d1894d5dc69148391c112815807bcb002/687474703a2f2f7069676d656e742e6769746875622e696f2f66616b652d6c6f676f732f6c6f676f732f766563746f722f677261797363616c652f63686573686972652d636f756e74792d68796769656e652d73657276696365732e737667")
            .item.p-4
              img(src="https://camo.githubusercontent.com/24bb80a1bd7ae86818e412a78843a38239f4665d53fcf5fcfd6856fa88fcb913/687474703a2f2f7069676d656e742e6769746875622e696f2f66616b652d6c6f676f732f6c6f676f732f766563746f722f677261797363616c652f626162792d7377696d2e737667")
</template>

<script>
export default {
  data() {
    return {
      
  }}
}
</script>

<style lang="scss" scoped>
  .mentions-wrapper {
    background: #f1ebe0;
    .mentions {
      @media screen and (max-width: 720px) {
        flex-direction: column;
      }
      .item {
        img {
          max-width: 100%;
        }
      }
    }
  }
</style>
