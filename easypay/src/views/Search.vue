<template>
  <div>
    <!-- 顶部 -->
    <div class="head-border">
      <mt-header title="搜索">
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
    <!-- 搜索内容区域默认页面 -->
    <div>
      <div class="search-content">
        <div class="search-input">
          <input
            type="text"
            placeholder="搜索商品"
            v-model="section"
            @keyup.enter="tosearch"
          />
          <router-link to="" @click.native="clicksearch">
            <span class="iconfont icon-fangdajingsousuo"></span>
          </router-link>
        </div>
        <p>热门搜索</p>
        <div class="search-pro">
          <ul>
            <li>
              <router-link to="">手机</router-link>
            </li>
            <li>
              <router-link to="">小米</router-link>
            </li>
            <li>
              <router-link to="">iphone</router-link>
            </li>
            <li>
              <router-link to="">三星</router-link>
            </li>
            <li>
              <router-link to="">华为</router-link>
            </li>
            <li>
              <router-link to="">冰箱</router-link>
            </li>
          </ul>
        </div>
      </div>
    </div>
    <!-- 底部选项卡 -->
    <div class="search-check">
      <mt-tabbar v-model="active" fixed class="search-bottom">
        <mt-tab-item id="home">
          <img
            slot="icon"
            src="../assets/iconfont/home.png"
            alt
            v-if="active !== 'home'"
          />
          <img slot="icon" src="../assets/iconfont/home (1).png" alt v-else />
          首页
        </mt-tab-item>
        <mt-tab-item id="order">
          <img
            slot="icon"
            src="../assets/iconfont/订单.png"
            alt
            v-if="active !== 'order'"
          />
          <img slot="icon" src="../assets/iconfont/订单 (1).png" alt v-else />
          订单
        </mt-tab-item>
        <mt-tab-item id="cart">
          <img
            slot="icon"
            src="../assets/iconfont/购物车.png"
            alt
            v-if="active !== 'cart'"
          />
          <img slot="icon" src="../assets/iconfont/购物车 (1).png" alt v-else />
          购物车
        </mt-tab-item>
        <mt-tab-item id="my">
          <img
            slot="icon"
            src="../assets/iconfont/我的.png"
            alt
            v-if="active !== 'my'"
          />
          <img slot="icon" src="../assets/iconfont/我的 (1).png" alt v-else />
          我的
        </mt-tab-item>
      </mt-tabbar>
    </div>
  </div>
</template>
<script>
// import {Indicator} from 'mint-ui';
export default {
  data() {
    return {
      menushow: "m-none",
      active: "",
      section: "",
    };
  },
  watch: {
    active(value) {
      if (value == "home") {
        this.$router.push("/");
      }
      if (value == "order") {
        this.$router.push("/order");
      }
      if (value == "cart") {
        this.$router.push("/cart");
      }
      if (value == "my") {
        this.$router.push("/my");
      }
    },
    // section(){
      
    //   this.tosearch()
    // }
  },
  methods: {
    menu() {
      if (this.menushow == "m-none") {
        this.menushow = "m-block";
      } else if ((this.menushow = "m-block")) {
        this.menushow = "m-none";
      }
    },
    tosearch() {
      if (this.section.trim() !== "") {
          //注意：使用path时，params将不可用
          this.$router.push({
            path: "/searchresult",
            query: { pro: this.section },
          });
          //搜索后刷新一下页面
          window.location.reload();
          console.log(this.section);
      }
    },
    clicksearch() {
      if (this.section.trim() !== "") {
        //注意：使用path时，params将不可用
        this.$router.push({
          path: "/searchresult",
          query: { pro: this.section },
        });
        //搜索后刷新一下页面
        window.location.reload();
          console.log(this.section);
      }
    },
  },
};
</script>
<style scoped>
.head-border {
  width: 100%;
  border-bottom: 1px solid #dedede;
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
.search-bottom {
  box-shadow: 0 0 10px 0 rgba(155, 143, 143, 0.6);
}
.search-check /deep/ .mint-tab-item-label {
  color: black;
}
.search-content {
  width: 92%;
  margin: 30px auto;
}
.search-input {
  display: flex;
  justify-content: space-between;
}
.search-input > input {
  height: 40px;
  width: 76%;
  color: #666;
  border: 1px solid #dedede;
  font-size: 14px;
  padding-left: 5px;
}
.search-input > a {
  width: 22%;
  text-decoration: none;
  background-color: #f23030;
}
.search-input > a > span {
  font-size: 40px;
  color: rgb(214, 212, 212);
  line-height: 40px;
}
.search-content > p {
  margin: 20px 0;
  text-align: left;
  font-size: 18px;
}
.search-pro {
  width: 95%;
  margin: 0 auto;
}
.search-pro > ul {
  display: flex;
  flex-wrap: wrap;
}
.search-pro > ul > li {
  width: 33%;
  margin: 12px 0;
}
.search-pro > ul > :nth-child(3n + 1) {
  text-align: left;
}
.search-pro > ul > :nth-child(3n) {
  text-align: right;
}
.search-pro > ul > li > a {
  text-decoration: none;
  color: #555;
  border: 1px solid #e0e0e0;
  box-shadow: 0 0 10px 0 rgba(224, 224, 224, 0.6);
  padding: 5px;
  font-size: 14px;
}
.tosearch-pro {
  margin-top: 10px;
}

/* 未找到商品样式开始 */
/* .details-tips {
  width: 100%;
  background-color: rgb(241, 241, 241);
  height: 70px;
  margin: 50px 0;
}
.details-tips > div {
  width: 40px;
  margin: 0 auto;
}
.details-tips > div > img {
  width: 100%;
}
.details-tips > p {
  font-size: 14px;
  color: #777;
  margin-top: 6px;
} */
/* 未找到商品样式结束 */

/* 搜索商品样式开始 */
/* .index-pro-travel-list > ul {
  display: flex;
  flex-wrap: wrap;
}
.index-pro-travel-list > ul > li {
  width: 50%;
  box-sizing: border-box;
  height: 260px;
}
.index-pro-travel-list > ul > li:nth-child(2n + 1) {
  padding-right: 3px;
}
.index-pro-travel-list-pro {
  width: 100%;
}
.index-pro-travel-list-pro > a > img {
  width: 100%;
  height: 204px;
}
.index-pro-travel-list-pro-title {
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
  margin-left: 10px;
  line-height: 30px;
}
.index-pro-travel-list-pro-price {
  text-align: left;
  margin-left: 4px;
}
.index-pro-travel-list-pro-price > :first-child {
  color: #f23030;
  font-size: 12px;
}
.index-pro-travel-list-pro-price > :nth-child(2) {
  font-size: 20px;
  vertical-align: middle;
  color: #f23030;
}
.index-pro-travel-list-pro-price > :nth-child(3) {
  color: #989898;
  text-decoration: line-through;
  font-size: 12px;
  margin-left: 4px;
} */
/* .mint-tabbar > .mint-tab-item.is-selected {
  color: red;
} */
/* 搜索商品样式结束*/
</style>
