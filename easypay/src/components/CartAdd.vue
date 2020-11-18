<template>
  <div class="cartadd-style">
    <div class="cartadd">
      <span @click="red">-</span>
      <input type="text" v-model="num" />
      <span @click="add">+</span>
    </div>
  </div>
</template>
<script>
export default {
  props: ["count", "index"],
  data() {
    return {
      num: 1,
    };
  },
  methods: {
    red() {
      if (this.num > 1) {
        this.num--;
      } else if (this.num == 1) {
        this.num = 1;
        this.$toast("商品数量最少为1个");
      }
    },
    add() {
      this.num++;
    },
  },
  watch: {
    num(val) {
      this.$store.commit("updateCount", { index: this.index, count: val });
    },
  },
  created() {
    this.num = this.count;
  },
};
</script>
<style scoped>
.cartadd-style {
  display: flex;
  justify-content: flex-end;
}
.cartadd {
  width: 65%;
  border: 1px solid #eeeded;
  display: flex;
  text-align: center;
  /* margin-left: 30%; */
}
.cartadd > span {
  width: 50%;
}
.cartadd > input {
  width: 50%;
  text-align: center;
  border: 0;
  background-color: transparent;
  border-left: 1px solid #eeeded;
  border-right: 1px solid #eeeded;
}
</style>
