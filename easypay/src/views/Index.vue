<template>
  <div>
    <!-- 顶部搜索 -->
    <div>
      <header class="head" :class="bg">
        <div class="head-search">
          <span class="iconfont icon-fangdajingsousuo"></span>
          <input
            type="text"
            placeholder="请输入您所搜索的商品"
            @click="search"
          />
          <span>
            <router-link to="/login" v-if="this.$store.state.isLogined == 0"
              >登录</router-link
            >
            <router-link to="" v-else @click.native="logOut">注销</router-link>
          </span>
        </div>
      </header>
    </div>
    <!-- 内容区域 -->
    <div>
      <!-- 轮播 -->
      <div class="index-banner">
        <mt-swipe :auto="4000">
          <mt-swipe-item>
            <img
              src="../../../server/images/banner/62ce48efdcb6bb968d2a91031b26604a.jpg"
              alt
            />
          </mt-swipe-item>
          <mt-swipe-item>
            <img
              src="../../../server/images/banner/fa84550af6f3f24114506ff521c90cdf.jpg"
              alt
            />
          </mt-swipe-item>
        </mt-swipe>
      </div>
      <!-- 顶部选项 -->
      <div class="index-tab">
        <ul>
          <li>
            <img src="../../../server/images/indeximg/icon_travel.png" alt />
            <div>旅游</div>
          </li>
          <li>
            <img src="../../../server/images/indeximg/icon_09.png" alt />
            <div>优惠活动</div>
          </li>
          <li>
            <img src="../../../server/images/indeximg/icon_17.png" alt />
            <div>数据通</div>
          </li>
          <li>
            <img src="../../../server/images/indeximg/icon_19.png" alt />
            <div>个人中心</div>
          </li>
        </ul>
      </div>
      <!-- 地区 -->
      <div class="index-region">
        <ul>
          <li>
            <router-link to>中国</router-link>
          </li>
          <li>
            <router-link to>台湾</router-link>
          </li>
          <li>
            <router-link to>东南亚</router-link>
          </li>
          <li>
            <router-link to>美国</router-link>
          </li>
          <li>
            <router-link to>澳洲</router-link>
          </li>
          <li>
            <router-link to>韩国</router-link>
          </li>
          <li>
            <router-link to>日本</router-link>
          </li>
          <li>
            <router-link to>其它</router-link>
          </li>
        </ul>
      </div>
      <!-- 商品分类-->
      <div class="index-pro">
        <!-- 旅游 -->
        <div class="index-pro-travel">
          <div class="index-pro-travel-title">
            <span>旅游</span>
            <router-link to>更多></router-link>
          </div>
          <div class="index-pro-travel-list">
            <ul>
              <li v-for="(elem, i) of arrtravel" :key="i" @click="jump(elem)">
                <div class="index-pro-travel-list-pro">
                  <router-link to>
                    <img v-lazy="imgurl + elem.listimg" alt />
                  </router-link>
                </div>
                <p class="index-pro-travel-list-pro-title">
                  {{ elem.title }}
                </p>
                <p class="index-pro-travel-list-pro-price">
                  <span>￥</span>
                  <span>{{ elem.price.toFixed(2) }}</span>
                  <span>￥{{ elem.marketprice.toFixed(2) }}</span>
                </p>
              </li>
            </ul>
          </div>
        </div>
        <!-- 美食 -->
        <div class="index-pro-travel">
          <div class="index-pro-travel-title">
            <span>全球美食汇</span>
            <router-link to>更多></router-link>
          </div>
          <div class="index-pro-travel-list">
            <ul>
              <li v-for="(elem, i) of arrfood" :key="i" @click="jump(elem)">
                <div class="index-pro-travel-list-pro">
                  <router-link to>
                    <img v-lazy="imgurl + elem.listimg" alt />
                  </router-link>
                </div>
                <p class="index-pro-travel-list-pro-title">
                  {{ elem.title }}
                </p>
                <p class="index-pro-travel-list-pro-price">
                  <span>￥</span>
                  <span>{{ elem.price.toFixed(2) }}</span>
                  <span>￥{{ elem.marketprice.toFixed(2) }}</span>
                </p>
              </li>
            </ul>
          </div>
        </div>
        <!-- 名牌奢侈品 -->
        <div class="index-pro-travel">
          <div class="index-pro-travel-title">
            <span>名牌奢侈品</span>
            <router-link to>更多></router-link>
          </div>
          <div class="index-pro-travel-list">
            <ul>
              <li v-for="(elem, i) of arrluxury" :key="i" @click="jump(elem)">
                <div class="index-pro-travel-list-pro">
                  <router-link to>
                    <img v-lazy="imgurl + elem.listimg" alt />
                  </router-link>
                </div>
                <p class="index-pro-travel-list-pro-title">
                  {{ elem.title }}
                </p>
                <p class="index-pro-travel-list-pro-price">
                  <span>￥</span>
                  <span>{{ elem.price.toFixed(2) }}</span>
                  <span>￥{{ elem.marketprice.toFixed(2) }}</span>
                </p>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
    <!-- 底部选项卡 -->
    <div>
      <mt-tabbar v-model="active" fixed>
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
export default {
  // props:["id"],
  data() {
    return {
      active: "home",
      bg: "",
      arrtravel: [],
      moreidTravel: "travel",
      arrfood: [],
      moreidFood: "food",
      arrluxury: [],
      moreidLuxury: "luxury",
    };
  },
  watch: {
    active(value) {
      if (value == "home") {
        this.$router.push("/index");
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
  },
  methods: {
    jump(elem) {
      this.$router.push("/details/" + elem.id);
    },
    search() {
      this.$router.push("/search");
    },
    logOut() {
      if (this.$store.state.isLogined == 1) {
        this.$store.commit("setUser", "未登录");
        this.$store.commit("logined", "0");
        localStorage.setItem("isLogined", "0");
        localStorage.setItem("username", "未登录");
      }
    },
  },
  mounted() {
    // 当页面滚动时
    window.onscroll = () => {
      // 首先获得页面上方滚动超出的距离
      var scrollTop =
        document.body.scrollTop || document.documentElement.scrollTop;
      // console.log(scrollTop);
      // 如果滚动距离>=100,就显示
      if (scrollTop >= 100) {
        this.bg = "bg-color";
      } else {
        // 否则,如果滚动距离<100,就隐藏
        this.bg = "";
      }
    };

    // 旅游列表请求
    this.axios
      .get("/travel", { params: { moreid: this.moreidTravel } })
      .then((res) => {
        // this.arrtravel = res.data.result;
        this.arrtravel = res.data.result;
      });

    //美食列表请求
    this.axios
      .get("/food", { params: { food: this.moreidFood } })
      .then((res) => {
        this.arrfood = res.data.result;
      });

    //奢侈品列表请求
    this.axios
      .get("/luxury", { params: { luxury: this.moreidLuxury } })
      .then((res) => {
        this.arrluxury = res.data.result;
      });
  },
};
</script>
<style>
body {
  background-color: #f8f8f8;
}
</style>
<style scoped>
.head {
  height: 45px;
  position: fixed;
  width: 100%;
  z-index: 999;
  transition: all 0.45s ease;
}
.bg-color {
  background-color: rgba(242, 48, 48, 0.8);
}
.head-search {
  width: 100%;
  line-height: 45px;
  position: relative;
}

.head-search > :first-child {
  position: absolute;
  font-size: 24px;
  color: #999;
  margin-left: 10px;
}

.head-search > :nth-child(2) {
  height: 26px;
  border: 0;
  border-radius: 8px;
  width: 55%;
  padding-left: 25px;
  font-size: 14px;
  margin-left: 10px;
}

.head-search > :nth-child(3) {
  width: 10%;
  margin-left: 10px;
}
.head-search > :nth-child(3) > a {
  color: white;
  text-decoration: none;
}
.index-banner {
  width: 100%;
  height: 150px;
}

.index-banner img {
  width: 100%;
  height: 100%;
}
.index-tab ul {
  display: flex;
  width: 100%;
  justify-content: space-around;
}
.index-tab li {
  width: 25%;
  margin: 20px 0;
}
.index-tab li > img {
  width: 40px;
  height: 40px;
  margin-bottom: 5px;
}
.index-tab li > div {
  font-size: 14px;
}
.index-region > ul {
  display: flex;
  flex-wrap: wrap;
}
.index-region > ul > :first-child > a {
  color: #ffba00;
}
.index-region > ul > li {
  width: 70px;
  border-right: 1px solid #b5b5b5;
  margin: 12px 0;
}
.index-region > ul > li > a {
  text-decoration: none;
  color: #525252;
  font-size: 15px;
}
.index-pro {
  margin-bottom: 55px;
}
.index-pro-travel {
  width: 100%;
}
.index-pro-travel-title {
  position: relative;
  margin-bottom: 12px;
  height: 40px;
  background-color: #f5f5f5;
}
.index-pro-travel-title > span {
  line-height: 40px;
}
.index-pro-travel-title > a {
  text-decoration: none;
  position: absolute;
  right: 10px;
  color: #232326;
  line-height: 40px;
  font-size: 12px;
}
.index-pro-travel-list {
  /* margin-bottom: 55px; */
}
.index-pro-travel-list > ul {
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
}
.mint-tabbar > .mint-tab-item.is-selected {
  color: red;
}
</style>
