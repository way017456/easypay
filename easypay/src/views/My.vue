<template>
  <div>
    <!-- 顶部信息 -->
    <div class="my-bg">
      <router-link to="/mystring"></router-link>
      <div class="my-headphoto">
        <div class="my-photo">
          <img src="../../public/images/my-order/user68.jpg" alt />
        </div>
        <span>{{this.$store.state.username}}</span>
      </div>
      <div class="my-notice">
        <ul>
          <li>
            <router-link to>
              <h2>0</h2>
              <p>我的收藏</p>
            </router-link>
          </li>
          <li>
            <router-link to>
              <h2>0</h2>
              <p>消息通知</p>
            </router-link>
          </li>
        </ul>
      </div>
    </div>
    <!-- 我的订单 -->
    <div>
      <div class="my-order-layout-bg">
        <div class="my-order-layout">
          <router-link to>
            <img src="../../public/images/my-order/mlist.png" alt />
            <span>我的订单</span>
          </router-link>
          <router-link to>
            <span>全部订单</span>
            <span class="iconfont icon-iconfontyoujiantou-copy-copy-copy-copy"></span>
          </router-link>
        </div>
      </div>
      <div class="my-order-content">
        <ul>
          <li>
            <router-link to>
              <span>0</span>
              <img src="../../public/images/my-order/q1.png" alt />
              <p>待付款</p>
            </router-link>
          </li>
          <li>
            <router-link to>
              <span>0</span>
              <img src="../../public/images/my-order/q2.png" alt />
              <p>待收货</p>
            </router-link>
          </li>
          <li>
            <router-link to>
              <span>0</span>
              <img src="../../public/images/my-order/q3.png" alt />
              <p>待评价</p>
            </router-link>
          </li>
          <li>
            <router-link to>
              <span>0</span>
              <img src="../../public/images/my-order/q4.png" alt />
              <p>退款/退货</p>
            </router-link>
          </li>
        </ul>
      </div>
    </div>
    <!-- 积分及优惠券 -->
    <div>
      <div class="my-order-layout-bg">
        <div class="my-order-layout">
          <router-link to>
            <img src="../../public/images/my-order/mlist.png" alt />
            <span>我的积分及优惠券</span>
          </router-link>
          <router-link to>
            <span>积分管理</span>
            <span class="iconfont icon-iconfontyoujiantou-copy-copy-copy-copy"></span>
          </router-link>
        </div>
      </div>
      <div class="my-coupon-content">
        <ul>
          <li>
            <router-link to>
              <span>0</span>
              <p>优惠券</p>
            </router-link>
          </li>
          <li>
            <router-link to>
              <span>100</span>
              <p>积分</p>
            </router-link>
          </li>
        </ul>
      </div>
    </div>
    <!-- 列表选项 -->
    <div class="my-list">
      <div class="my-list-layout-bg">
        <div class="my-list-layout">
          <router-link to>
            <img src="../../public/images/my-order/cardicon.png" alt />
            <span>数据通订单</span>
          </router-link>
          <router-link to>
            <span class="iconfont icon-iconfontyoujiantou-copy-copy-copy-copy"></span>
          </router-link>
        </div>
      </div>
      <div class="my-list-layout-bg">
        <div class="my-list-layout">
          <router-link to>
            <img src="../../public/images/my-order/w2.png" alt />
            <span>我的评价</span>
          </router-link>
          <router-link to>
            <span class="iconfont icon-iconfontyoujiantou-copy-copy-copy-copy"></span>
          </router-link>
        </div>
      </div>
      <div class="my-list-layout-bg">
        <div class="my-list-layout">
          <router-link to>
            <img src="../../public/images/my-order/w3.png" alt />
            <span>领劵中心</span>
          </router-link>
          <router-link to>
            <span class="iconfont icon-iconfontyoujiantou-copy-copy-copy-copy"></span>
          </router-link>
        </div>
      </div>
      <div class="my-list-layout-bg">
        <div class="my-list-layout">
          <router-link to>
            <img src="../../public/images/my-order/w7.png" alt />
            <span>浏览历史</span>
          </router-link>
          <router-link to>
            <span class="iconfont icon-iconfontyoujiantou-copy-copy-copy-copy"></span>
          </router-link>
        </div>
      </div>
      <div class="my-list-layout-bg">
        <div class="my-list-layout">
          <router-link to>
            <img src="../../public/images/my-order/w8.png" alt />
            <span>地址管理</span>
          </router-link>
          <router-link to>
            <span class="iconfont icon-iconfontyoujiantou-copy-copy-copy-copy"></span>
          </router-link>
        </div>
      </div>
    </div>
    <!-- 底部选项卡 -->
    <div>
      <mt-tabbar v-model="active" fixed>
        <mt-tab-item id="home">
          <img slot="icon" src="../assets/iconfont/home.png" alt v-if="active !== 'home'" />
          <img slot="icon" src="../assets/iconfont/home (1).png" alt v-else />
          首页
        </mt-tab-item>
        <mt-tab-item id="order">
          <img slot="icon" src="../assets/iconfont/订单.png" alt v-if="active !== 'order'" />
          <img slot="icon" src="../assets/iconfont/订单 (1).png" alt v-else />
          订单
        </mt-tab-item>
        <mt-tab-item id="cart">
          <img slot="icon" src="../assets/iconfont/购物车.png" alt v-if="active !== 'cart'" />
          <img slot="icon" src="../assets/iconfont/购物车 (1).png" alt v-else />
          购物车
        </mt-tab-item>
        <mt-tab-item id="my">
          <img slot="icon" src="../assets/iconfont/我的.png" alt v-if="active!=='my'" />
          <img slot="icon" src="../assets/iconfont/我的 (1).png" alt v-else />
          我的
        </mt-tab-item>
      </mt-tabbar>
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      active: "my"
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
    }
  }
};
</script>
<style scoped>
.mint-tabbar > .mint-tab-item.is-selected {
  color: red;
}
.my-bg {
  background-image: url(../../public/images/my-order/bjm.jpg);
  background-size: cover;
  width: 100%;
  height: 155px;
  position: relative;
}
.my-bg > a {
  width: 30px;
  height: 30px;
  position: absolute;
  background-image: url(../../public/images/my-order/set.png);
  background-size: cover;
  right: 15px;
  top: 15px;
}
.my-headphoto {
  margin: 40px 0 0 25px;
  position: absolute;
}
.my-photo {
  width: 63px;
  height: 63px;
  border-radius: 50%;
  overflow: hidden;
  display: inline-block;
  vertical-align: middle;
}
.my-photo > img {
  width: 100%;
}
.my-headphoto > span {
  color: white;
  margin-left: 5px;
  font-weight: bold;
  letter-spacing: 0.5px;
  font-size: 17px;
  width: 90px;
  text-overflow: ellipsis;
  white-space: nowrap;
  overflow: hidden;
  display: inline-block;
}
.my-notice {
  width: 100%;
  position: absolute;
  bottom: 5px;
}
.my-notice > ul {
  display: flex;
  justify-content: space-around;
}
.my-notice a {
  color: white;
  text-decoration: none;
  font-size: 12px;
}
.my-notice h2 {
  font-size: 18px;
  margin: 4px 0;
}
.my-order-layout {
  width: 96%;
  margin: 0 auto;
  display: flex;
  justify-content: space-between;
  line-height: 30px;
}
.my-order-layout-bg {
  width: 100%;
  background-color: white;
  margin-top: 10px;
}
.my-order-layout > a {
  text-decoration: none;
  color: #232326;
}
.my-order-layout > :first-child {
  margin-left: 5px;
}
.my-order-layout > :first-child > img {
  width: 18px;
  margin-right: 8px;
}
.my-order-layout > :nth-child(2) > :first-child {
  font-size: 14px;
  color: #4c4c4c;
}
.my-order-layout > :nth-child(2) > :last-child {
  font-size: 24px;
  vertical-align: middle;
  margin-bottom: 3px;
  display: inline-block;
}
.my-order-content {
  background-color: white;
  margin-top: 2px;
  width: 100%;
}
.my-order-content > ul {
  display: flex;
  justify-content: space-around;
}
.my-order-content > ul > li {
  padding: 24px 0;
}
.my-order-content a {
  text-decoration: none;
  color: #4c4c4c;
  font-size: 14px;
  position: relative;
}
.my-order-content a > span {
  color: white;
  background-color: rgba(217, 81, 99, 0.9);
  width: 25px;
  height: 25px;
  position: absolute;
  border-radius: 50%;
  line-height: 25px;
  right: -10px;
  top: -20px;
}
.my-order-content a > p {
  font-size: 12px;
  margin-top: 5px;
}
.my-order-content img {
  width: 35px;
  height: 35px;
}
.my-coupon-content {
  background-color: white;
  margin-top: 2px;
  width: 100%;
}
.my-coupon-content > ul {
  display: flex;
}
.my-coupon-content > ul > li {
  padding: 20px 40px;
  line-height: 30px;
}
.my-coupon-content a {
  text-decoration: none;
  color: #4c4c4c;
  font-size: 14px;
  position: relative;
}
.my-coupon-content a > span {
  color: #e3110b;
  font-size: 18px;
}
.my-list {
  margin-top: 10px;
  margin-bottom: 100px;
}
.my-list-layout {
  width: 96%;
  margin: 0 auto;
  display: flex;
  justify-content: space-between;
  line-height: 40px;
}
.my-list-layout-bg {
  width: 100%;
  background-color: white;
  margin-top: 1px;
}
.my-list-layout > a {
  text-decoration: none;
  color: #232326;
}
.my-list-layout > :first-child {
  margin-left: 5px;
}
.my-list-layout > :first-child > img {
  width: 18px;
  margin-right: 8px;
}
.my-list-layout > :nth-child(2) > :last-child {
  font-size: 24px;
  vertical-align: middle;
  margin-bottom: 3px;
  display: inline-block;
}
</style>