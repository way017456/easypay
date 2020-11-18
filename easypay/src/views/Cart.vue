<template>
  <div>
    <!-- 顶部 -->
    <div class="cart-top-height">
      <div class="cart-top-border">
        <mt-header title="购物车">
          <router-link to="/" slot="left">
            <mt-button>
              <span class="iconfont icon-zuojiantou header-top-return"></span>
            </mt-button>
          </router-link>
          <mt-button slot="right">
            <span
              class="iconfont icon-caidan1 header-top-more"
              @click="menu"
            ></span>
          </mt-button>
        </mt-header>
      </div>
    </div>
    <!-- 隐藏菜单 -->
    <div>
      <div class="hide-menu" :class="menushow">
        <ul>
          <li>
            <router-link to="/">
              <span class="iconfont icon-home"></span>
              <div>首页</div>
            </router-link>
          </li>
          <li>
            <router-link to="/order">
              <span class="iconfont icon-dingdan"></span>
              <div>订单</div>
            </router-link>
          </li>
          <li>
            <router-link to="/cart">
              <span class="iconfont icon-gouwuche"></span>
              <div>购物车</div>
            </router-link>
          </li>
          <li>
            <router-link to="/my">
              <span class="iconfont icon-wode"></span>
              <div>我的</div>
            </router-link>
          </li>
        </ul>
      </div>
    </div>
    <!-- 无商品内容 -->
    <div class="m-none">
      <div class="cart-contant-none">
        <div class="cart-contant-position">
          <div>
            <img src="../../public/images/nothing.png" alt="" />
          </div>
          <p>购物车暂无商品</p>
          <router-link to="/">去逛逛</router-link>
        </div>
      </div>
    </div>
    <!-- 有商品内容 -->
    <div class="cart-section-bottom">
      <div v-for="(item, index) of arrCart" :key="index">
        <div class="cart-list">
          <div class="cart-list-check">
            <span
              class="cart-list-check-none"
              :class="{ 'cart-list-check-block': item.check }"
              @click="listcheck(item)"
            ></span>
          </div>
          <div class="cart-list-banner">
            <img :src="imgurl + item.listimg" alt="" />
          </div>
          <div class="cart-list-content">
            <div class="cart-list-title">
              <p>{{ item.title }}</p>
              <img
                @click="del(index)"
                src="../../public/images/dele.png"
                alt=""
              />
            </div>
            <p class="cart-text">税费￥{{ item.taxation }}</p>
            <p class="cart-text">单价￥{{ item.price }}</p>
            <div class="cart-add">
              <div class="cart-text">
                小计{{ ((item.taxation + item.price) * item.count).toFixed(2) }}
                <!-- 小计{{ item.count }} -->
              </div>
              <div>
                <my-cartadd :count="item.count" :index="index"></my-cartadd>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- 底部结算 -->
    <div class="arr-cart-countbg">
      <div class="add-cart-count">
        <div class="add-cart-all">
          <span :class="allcheck" @click="alllistcheck"></span>
          全选
        </div>
        <div class="add-cart-total">
          <p>
            总计：<span>￥{{ subtotal }}</span>
          </p>
          <div>
            <span>含税费（0）</span>
            <span>不含运费</span>
          </div>
        </div>
        <div class="add-cart-go">
          <router-link to>去结算</router-link>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import { mapState } from "vuex";
export default {
  data() {
    return {
      menushow: "m-none",
      allcheck: "cart-allcheck-none",
      // subtotal:0,
      // subtotal:100
    };
  },
  computed: {
    //映射
    ...mapState(["arrCart"]),
    subtotal: function() {
      // console.log(this.arrCart)
      let arrCart = this.arrCart;
      let total = 0;
      arrCart.forEach((item) => {
        if (item.check) {
          total = total + (item.price + item.taxation) * item.count;
        }
      });
      return total.toFixed(2);
    },
  },
  methods: {
    menu() {
      if (this.menushow == "m-none") {
        this.menushow = "m-block";
      } else if ((this.menushow = "m-block")) {
        this.menushow = "m-none";
      }
    },
    listcheck(item) {
      if (typeof item.check === "undefined") {
        this.$set(item, "check", true);
      } else {
        item.check = !item.check;
        this.allcheck = "cart-allcheck-none";
      }
      let has = this.arrCart.some(item => {
        return !item.check
      })
      if(has){
        this.allcheck = "cart-allcheck-none";
      }else{
        this.allcheck = "cart-allcheck-block"
      }
    },
    alllistcheck() {
      if (this.allcheck == "cart-allcheck-none") {
        this.allcheck = "cart-allcheck-block";
        this.arrCart.forEach((item) => {
          item.check = true;
        });
      } else if (this.allcheck == "cart-allcheck-block") {
        this.allcheck = "cart-allcheck-none";
        this.arrCart.forEach((item) => {
          item.check = false;
        });
      }
    },
    del(index) {
      this.arrCart.splice(index, 1);
      this.$store.commit("updateArrCart");
    },
  },
};
</script>
<style scoped>
.cart-top-height {
  height: 40px;
}
.cart-top-border {
  border-bottom: 1px solid #ebe9e9;
  position: fixed;
  width: 100%;
  z-index: 999;
  /* height: 40px; */
  top: 0;
}
.header-top-return {
  color: black;
  font-size: 20px;
}
.header-top-more {
  color: black;
  font-size: 28px;
}
.mint-header {
  padding: 0 8px 0 5px;
  background-color: #f8f8f8;
  color: black;
}
.hide-menu {
  width: 100%;
  background-color: #404042;
  height: 50px;
  color: white;
  /* margin-top: 40px; */
}
.hide-menu > ul {
  display: flex;
  justify-content: space-around;
}
.hide-menu > ul > li {
  margin-top: 5px;
  line-height: 20px;
}
.hide-menu > ul > li > a {
  color: white;
  text-decoration: none;
}
.hide-menu > ul > li > a > span {
  font-size: 26px;
}
.hide-menu > ul > li > a > div {
  font-size: 12px;
}
.m-none {
  display: none;
}
.m-black {
  display: block;
}
.cart-section-bottom {
  margin-bottom: 80px;
}
.cart-contant-none {
  width: 100%;
  position: relative;
  height: 523px;
}
.cart-contant-position {
  position: absolute;
  top: 50%;
  left: 35%;
}
.cart-contant-position > div {
  width: 80px;
  height: 100px;
  margin: 0 auto;
}
.cart-contant-position > p {
  margin: 30px 0;
  color: #9b9b9b;
}
.cart-contant-position > div > img {
  width: 100%;
}
.cart-contant-position > a {
  color: #232326;
  text-decoration: none;
  font-size: 17px;
}
.cart-list {
  width: 92%;
  margin: 10px auto;
  display: flex;
}
.cart-list-check {
  width: 5%;
  line-height: 88px;
}
.cart-list-check-none {
  width: 100%;
  height: 15px;
  display: inline-block;
  background-image: url(../../public/images/check.png);
  background-size: cover;
}
.cart-list-check-block {
  width: 100%;
  height: 15px;
  display: inline-block;
  background-image: url(../../public/images/check.png);
  background-size: cover;
  background-position: 16px 0;
}
.cart-list-banner {
  width: 25%;
  margin: 0 15px 0 10px;
}
.cart-list-banner > img {
  width: 100%;
}
.cart-list-content {
  width: 70%;
  text-align: left;
  font-size: 15px;
}
.cart-list-content > p {
  line-height: 17px;
}
.cart-list-title {
  margin: 10px 0;
  position: relative;
}
.cart-list-title > p {
  width: 80%;
}
.cart-list-title > img {
  position: absolute;
  width: 20px;
  height: 20px;
  right: 0;
  top: -4px;
}
.cart-text {
  color: #f23030;
}
.cart-add {
  display: flex;
  width: 100%;
}
.cart-add > :first-child {
  width: 50%;
  line-height: 25px;
}
.cart-add > :last-child {
  width: 50%;
}
.arr-cart-countbg {
  width: 100%;
  background-color: #f3f5f7;
  height: 50px;
  position: fixed;
  bottom: 0;
}
.add-cart-count {
  width: 100%;
  display: flex;
  font-size: 14px;
}
.add-cart-all {
  width: 20%;
  height: 50px;
  line-height: 50px;
}
.cart-allcheck-none {
  width: 16px;
  height: 15px;
  display: inline-block;
  background-image: url(../../public/images/check.png);
  background-size: cover;
  vertical-align: middle;
  margin: 0 2px;
}
.cart-allcheck-block {
  background-position: 16px 0;
  width: 16px;
  height: 15px;
  display: inline-block;
  background-image: url(../../public/images/check.png);
  background-size: cover;
  vertical-align: middle;
  margin: 0 2px;
}
.add-cart-total {
  width: 54%;
  height: 50px;
  text-align: right;
  line-height: 26px;
}
.add-cart-total > p > span {
  color: #f23030;
  margin-right: 5px;
}
.add-cart-total > div > span {
  color: #666;
  margin-right: 5px;
}
.add-cart-go {
  width: 26%;
  height: 50px;
  background-color: #f23030;
}
.add-cart-go > a {
  line-height: 50px;
  color: white;
  text-decoration: none;
}
</style>
