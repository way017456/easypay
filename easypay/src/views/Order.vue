<template>
  <div>
    <!-- 顶部 -->
    <div>
      <mt-header title="我的订单">
        <router-link to="/" slot="left">
          <mt-button>
            <span class="iconfont icon-zuojiantou header-top-return"></span>
          </mt-button>
        </router-link>
        <mt-button slot="right">
          <span class="iconfont icon-caidan1 header-top-more" @click="menu"></span>
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
            <router-link to='/order'>
              <span class="iconfont icon-dingdan"></span>
              <div>订单</div>
            </router-link>
          </li>
          <li>
            <router-link to='/cart'>
              <span class="iconfont icon-gouwuche"></span>
              <div>购物车</div>
            </router-link>
          </li>
          <li>
            <router-link to='/my'>
              <span class="iconfont icon-wode"></span>
              <div>我的</div>
            </router-link>
          </li>
        </ul>
      </div>
    </div>
    <!-- 顶部选项卡 -->
    <div>
      <mt-navbar v-model="active">
        <mt-tab-item id="1" class="order-topmenu">全部订单</mt-tab-item>
        <mt-tab-item id="2" class="order-topmenu">待付款</mt-tab-item>
        <mt-tab-item id="3" class="order-topmenu">待发货</mt-tab-item>
        <mt-tab-item id="4" class="order-topmenu">已完成</mt-tab-item>
      </mt-navbar>
      <mt-tab-container v-model="active">
        <mt-tab-container-item id="1">
          <div class="order-empty">
            <div>
              <img src="../../public/images/none2.png" alt="">
            </div>
            <p>抱歉未查到数据!</p>
            <button><router-link to="/">去逛逛</router-link></button>
          </div>
        </mt-tab-container-item>
        <mt-tab-container-item id="2">
          <div class="order-empty">
            <div>
              <img src="../../public/images/none2.png" alt="">
            </div>
            <p>抱歉未查到数据!</p>
            <button><router-link to="/">去逛逛</router-link></button>
          </div>
        </mt-tab-container-item>
        <mt-tab-container-item id="3">
          <div class="order-empty">
            <div>
              <img src="../../public/images/none2.png" alt="">
            </div>
            <p>抱歉未查到数据!</p>
            <button><router-link to="/">去逛逛</router-link></button>
          </div>
        </mt-tab-container-item>
        <mt-tab-container-item id="4">
          <div class="order-empty">
            <div>
              <img src="../../public/images/none2.png" alt="">
            </div>
            <p>抱歉未查到数据!</p>
            <button><router-link to="/">去逛逛</router-link></button>
          </div>
        </mt-tab-container-item>
      </mt-tab-container>
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      menushow: "m-none",
      active:'1'
    };
  },
  methods: {
    menu() {
      if (this.menushow == "m-none") {
        this.menushow = "m-block";
      } else if ((this.menushow = "m-block")) {
        this.menushow = "m-none";
      }
    },
  }
};
</script>
<style scoped>
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
.mint-tab-container{
  background-color: #f8f8f8;
  padding: 100px 0;
}
.mint-navbar .mint-tab-item.is-selected{
  color: #232326;
  border-bottom: 1px solid #ed5657;
  margin-bottom: 0;
}
.order-topmenu /deep/ .mint-tab-item-label{
  font-size: 14px;
}
.order-empty>div>img{
  width: 50px;
  height: 50px;
}
.order-empty>p{
  color: #777777;
  font-size: 14px;
  margin-top: 10px;
}
.order-empty>button{
  width: 92%;
  height: 42px;
  border: 0;
  background-color: #f23030;
  border-radius: 4px;
  margin-top: 30px;
}
.order-empty>button>a{
  color: white;
  text-decoration: none;
}
</style>