<template>
  <div>
    <div>
      <!-- 顶部选项卡 -->
      <div class="details-head-hei">
        <div class="details-head">
          <div class="details-head-align">
            <span
              @click="black"
              class="iconfont icon-zuojiantou header-top-return"
            ></span>
            <div id="details-list" class="details-head-content">
              <div class="all details-head-border">商品</div>
              <div>详情</div>
              <div>评论</div>
            </div>
            <span
              class="iconfont icon-caidan1 header-top-more"
              @click="menu"
            ></span>
          </div>
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
      <!-- 添加购物车提示 -->
      <div class="add-cart" :class="no">
        <!-- <div class="add-cart-bg"></div> -->
        <div class="add-cart-text">
          <div class="add-cart-success">添加成功！</div>
          <div class="add-cart-choice">
            <router-link to="/cart">去购物车</router-link>
            <router-link to="" @click.native="backnone">再逛逛</router-link>
          </div>
        </div>
      </div>
      <!-- 内容部分 -->
      <div id="details-active">
        <!-- 商品部分 -->
        <div class="details-hide">
          <!-- 轮播图片 -->
          <div class="details-banner">
            <mt-swipe :auto="4000">
              <mt-swipe-item v-for="(detailsid, i) of arrbanner" :key="i">
                <img :src="detailsid.detailsimg" alt />
              </mt-swipe-item>
            </mt-swipe>
          </div>
          <div v-for="(details, i) of arrdetails" :key="i">
            <!-- 标题收藏 -->
            <div class="bg-white">
              <div class="details-title">
                <span>{{ details.title }}</span>
                <div>
                  <span class="details-collect"></span>
                  <p>收藏</p>
                </div>
              </div>
            </div>
            <!-- 价格信息 -->
            <div class="bg-white">
              <div class="details-message">
                <p>￥{{ details.price }}元</p>
                <p>市场价格：{{ details.marketprice }}</p>
                <p class="details-message-content">
                  <span>销量：{{ details.sale }}</span>
                  <span>当前库存：{{ details.stock }}</span>
                </p>
                <p>税费：预计￥{{ details.taxation }}</p>
              </div>
            </div>
            <!-- 地址及详情 -->
            <div class="bg-white">
              <div class="details-address">
                <!-- 所在地区 -->
                <div>
                  <router-link to>
                    <span>所在地区</span>
                    <div class="details-address-text">
                      <span>北京市市辖区东城区</span>
                    </div>
                    <span
                      class="iconfont icon-iconfontyoujiantou-copy-copy-copy-copy"
                    ></span>
                  </router-link>
                </div>
                <!-- 运费信息 -->
                <div>
                  <router-link to>
                    <span>运费信息</span>
                    <div class="details-address-text">
                      <span>顺丰物流￥</span>
                    </div>
                    <span
                      class="iconfont icon-iconfontyoujiantou-copy-copy-copy-copy"
                    ></span>
                  </router-link>
                </div>
                <!-- 已选 -->
                <div>
                  <router-link to>
                    <span>已选</span>
                    <div class="details-address-text">
                      <span>1件</span>
                    </div>
                    <span
                      class="iconfont icon-iconfontyoujiantou-copy-copy-copy-copy"
                    ></span>
                  </router-link>
                </div>
                <!-- 服务 -->
                <div>
                  <router-link to>
                    <span>服务</span>
                    <div class="details-address-text">
                      <span>由商城自营业发货并提供售后服务</span>
                    </div>
                    <span>
                      <img src="../../public/images/gt.png" alt />
                    </span>
                  </router-link>
                </div>
              </div>
              <!-- 付款-退款 -->
              <div class="details-refund-size">
                <div class="details-refund">
                  <router-link to>
                    <img src="../../public/images/hdfk.png" alt />
                    <span>货到付款</span>
                  </router-link>
                  <router-link to>
                    <img src="../../public/images/qttk.png" alt />
                    <span>七天退款</span>
                  </router-link>
                  <router-link to>
                    <img src="../../public/images/ksd.png" alt />
                    <span>极速达</span>
                  </router-link>
                </div>
              </div>
              <!-- 查看商品详情 -->
              <div class="details-look-size">
                <div class="details-look-pro">
                  <router-link to>
                    <span>查看商品详情</span>
                    <span
                      class="iconfont icon-iconfontyoujiantou-copy-copy-copy-copy"
                    ></span>
                  </router-link>
                </div>
              </div>
              <!-- 用户评价 -->
              <div class="details-user-eval-bg">
                <div class="details-user-eval">
                  <div class="details-user-eval-size">
                    <router-link to>
                      <span>用户评价</span>
                      <div class="details-address-text">
                        <span>好评率</span>
                        <span>{{ details.highcomments }}</span>
                      </div>
                      <div>
                        <span>{{ details.comments }}</span>
                        <span>人评论</span>
                        <span
                          class="iconfont icon-iconfontyoujiantou-copy-copy-copy-copy"
                        ></span>
                      </div>
                    </router-link>
                  </div>
                </div>
              </div>
            </div>
            <!-- 推荐 -->
            <div class="details-reco-size">
              <div class="details-reco">
                <p>为您推荐</p>
                <ul>
                  <li>
                    <router-link to>
                      <img
                        src="../../../server/images/details/goods_thumb_573_400_400.jpg"
                        alt
                      />
                      <p>HR 赫莲娜 悦活新生精华液 绿宝瓶 75ml</p>
                      <p>￥808.00</p>
                    </router-link>
                  </li>
                  <li>
                    <router-link to>
                      <img
                        src="../../../server/images/details/goods_thumb_572_400_400.jpg"
                        alt
                      />
                      <p>DU'IT 急救手膜修复粗糙 女士专用 75克/瓶</p>
                      <p>￥69.00</p>
                    </router-link>
                  </li>
                  <li>
                    <router-link to>
                      <img
                        src="../../../server/images/details/goods_thumb_571_400_400.jpg"
                        alt
                      />
                      <p>Swisse 坚果紧致抚纹眼霜 15毫升</p>
                      <p>￥62.00</p>
                    </router-link>
                  </li>
                  <li>
                    <router-link to>
                      <img
                        src="../../../server/images/details/goods_thumb_569_400_400.jpg"
                        alt
                      />
                      <p>DU'IT Duit TOUGH HANDS 急救手膜手霜 150毫升</p>
                      <p>￥55.00</p>
                    </router-link>
                  </li>
                </ul>
              </div>
            </div>
            <!-- 到底提示 -->
            <div class="details-tips">
              <div>
                <img src="../../../server/images/details/none.png" alt />
              </div>
              <p>亲,此处还没有内容哦~</p>
            </div>
          </div>
        </div>
        <!-- 详情部分 -->
        <div class="details-hide">
          <div class="details-pro-eval-tips">
            <div>
              <img src="../../../server/images/details/none.png" alt />
            </div>
            <p>亲,此处还没内容呢~</p>
          </div>
        </div>
        <!-- 评论部分 -->
        <div class="details-hide">
          <!-- 顶部选项卡 -->
          <div class="details-pro-eval">
            <mt-navbar v-model="selected" class="details-pro-eval-border">
              <mt-tab-item id="1">
                <router-link to>
                  <p>全部好评</p>
                  <p>0</p>
                </router-link>
              </mt-tab-item>
              <mt-tab-item id="2">
                <router-link to>
                  <p>好评</p>
                  <p>0</p>
                </router-link>
              </mt-tab-item>
              <mt-tab-item id="3">
                <router-link to>
                  <p>中评</p>
                  <p>0</p>
                </router-link>
              </mt-tab-item>
              <mt-tab-item id="4">
                <router-link to>
                  <p>差评</p>
                  <p>0</p>
                </router-link>
              </mt-tab-item>
              <mt-tab-item id="5">
                <router-link to>
                  <p>有图</p>
                  <p>0</p>
                </router-link>
              </mt-tab-item>
            </mt-navbar>
            <mt-tab-container v-model="selected">
              <mt-tab-container-item id="1">
                <div>
                  <div class="details-pro-eval-tips">
                    <div>
                      <img
                        src="../../../server/images/details/none.png"
                        alt
                      />
                    </div>
                    <p>亲,此处还没有内容哦~</p>
                  </div>
                </div>
              </mt-tab-container-item>
              <mt-tab-container-item id="2">
                <div>
                  <div class="details-pro-eval-tips">
                    <div>
                      <img
                        src="../../../server/images/details/none.png"
                        alt
                      />
                    </div>
                    <p>亲,此处还没有内容哦~</p>
                  </div>
                </div>
              </mt-tab-container-item>
              <mt-tab-container-item id="3">
                <div>
                  <div class="details-pro-eval-tips">
                    <div>
                      <img
                        src="../../../server/images/details/none.png"
                        alt
                      />
                    </div>
                    <p>亲,此处还没有内容哦~</p>
                  </div>
                </div>
              </mt-tab-container-item>
              <mt-tab-container-item id="4">
                <div>
                  <div class="details-pro-eval-tips">
                    <div>
                      <img
                        src="../../../server/images/details/none.png"
                        alt
                      />
                    </div>
                    <p>亲,此处还没有内容哦~</p>
                  </div>
                </div>
              </mt-tab-container-item>
              <mt-tab-container-item id="5">
                <div>
                  <div class="details-pro-eval-tips">
                    <div>
                      <img
                        src="../../../server/images/details/none.png"
                        alt
                      />
                    </div>
                    <p>亲,此处还没有内容哦~</p>
                  </div>
                </div>
              </mt-tab-container-item>
            </mt-tab-container>
          </div>
        </div>
        <!-- 底部按钮 -->
        <div class="details-bottom">
          <div class="details-bottom-btn">
            <div class="details-bottom-btn-left">
              <router-link to>
                <i></i>
                <p>客服</p>
              </router-link>
              <router-link to="/cart">
                <span>{{this.$store.state.arrCart.length}}</span>
                <i></i>
                <p>购物车</p>
              </router-link>
            </div>
            <div class="details-bottom-btn-right">
              <router-link @click.native="add" to>加入购物车</router-link>
              <router-link to>立即购买</router-link>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  props: ["id"],
  data() {
    return {
      menushow: "m-none",
      active: "shopping",
      selected: "1",
      array: [],
      arrbanner: [],
      arrdetails: [],
      no:'m-none',
      count:this.$store.state.arrCart.length
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
    black() {
      this.$router.push("/");
      // window.history.go(-1);
    },
    add(){
      this.no = "m-black";
      this.count++;
      //提交Mutatuins
      this.$store.commit("setCount",this.count);
      this.arrdetails[0].count = 1;
      this.$store.commit("setCart",this.arrdetails[0]);
    },
    backnone(){
      this.no = "m-none";
    }
  },
  mounted() {
    (function () {
      let list = document.getElementById("details-list");
      let all = list.getElementsByTagName("div");
      let active = document.getElementById("details-active");
      let hide = active.getElementsByClassName("details-hide");
      for (let i = 0; i < all.length; i++) {
        all[i].index = i;
        all[i].onclick = function () {
          for (let i = 0; i < all.length; i++) {
            all[i].className = "";
            hide[i].style.display = "none";
          }
          this.className = "all details-head-border";
          hide[this.index].style.display = "block";
        };
        for (let m = 1; m < all.length; m++) {
          all[m].className = "";
          hide[m].style.display = "none";
        }
      }
    })();
    this.axios.get("/details", { params: { id: this.id } }).then((res) => {
      let result = res.data.result;
      let result2 = res.data.result2;
      result2.forEach((item) => {
        item.detailsimg = require("../../../server/images/details/" +
          item.detailsimg);
        this.arrbanner.push(item);
      });
      this.arrdetails = result;
      // console.log(this.arrdetails);
    });
  },
};
</script>
<style scoped>
.add-cart {
  z-index: 1000;
  top: 0;
  left: 0;
  position: fixed;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.5);
}
.add-cart-text {
  width: 60%;
  color: #666;
  font-size: 20px;
  background-color: white;
  height: 140px;
  margin: 0 auto;
  border-radius: 10px;
  box-shadow: 0 0 0.5rem rgba(0, 0, 0, .1);
  position: absolute;
  left: 20%;
  top: 40%;
}
.add-cart-success{
  width: 100%;
  height: 80px;
  border-bottom: 1px solid #EBEBEB;
  text-align: center;
  line-height: 80px;
}
.add-cart-choice{
  display: flex;
  justify-content: space-around;
}
.add-cart-choice>a{
  color: #666;
  text-decoration: none;
  line-height: 60px;
}
.details-head-hei {
  height: 42px;
}
.details-head {
  width: 100%;
  position: fixed;
  z-index: 999;
  background-color: #f8f8f8;
}
.details-head-align {
  width: 96%;
  display: flex;
  justify-content: space-between;
  line-height: 42px;
  margin: 0 auto;
}
.details-head-content {
  width: 65%;
  display: flex;
  justify-content: space-around;
  font-size: 14px;
}
.details-head-content > div {
  padding: 0 15px;
}
.details-head-border {
  border-bottom: 1px solid #232326;
  z-index: 2;
}
.header-top-return {
  color: black;
  font-size: 20px;
}
.header-top-more {
  color: black;
  font-size: 28px;
}
.m-none {
  display: none;
}
.m-black {
  display: block;
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
.details-bottom {
  margin-bottom: 55px;
}
.details-bottom-btn {
  width: 100%;
  height: 50px;
  position: fixed;
  bottom: 0;
  display: flex;
  background-color: white;
  z-index: 2;
}
.details-bottom-btn-left {
  display: flex;
  width: 50%;
  justify-content: space-around;
  margin-top: 10px;
}
.details-bottom-btn-left a {
  text-decoration: none;
  color: #232326;
  font-size: 14px;
}
.details-bottom-btn-left a > i {
  width: 25px;
  height: 20px;
  display: inline-block;
  background-image: url(../../public/images/kf.png);
  background-size: cover;
}
.details-bottom-btn-left > :nth-child(2) {
  position: relative;
}
.details-bottom-btn-left > :nth-child(2) > i {
  background-position-x: -30px;
}
.details-bottom-btn-left > :nth-child(2) > span {
  position: absolute;
  width: 20px;
  height: 20px;
  color: white;
  border-radius: 50%;
  line-height: 20px;
  background-color: rgba(217, 81, 99, 0.9);
  top: -8px;
  right: 0;
}
.details-bottom-btn-right {
  width: 50%;
}
.details-bottom-btn-right > a {
  text-decoration: none;
  color: white;
  font-size: 14px;
  display: inline-block;
  width: 50%;
  height: 50px;
  line-height: 50px;
}
.details-bottom-btn-right > :first-child {
  background-color: #ffb03f;
}
.details-bottom-btn-right > :last-child {
  background-color: #f23030;
}
.details-banner {
  width: 100%;
  height: 380px;
  overflow: hidden;
}
.details-banner img {
  width: 100%;
}
.bg-white {
  width: 100%;
  background-color: white;
}
.details-title {
  width: 90%;
  display: flex;
  justify-content: space-between;
  margin: 0 auto;
  height: 50px;
}
.details-title > :first-child {
  line-height: 30px;
  font-size: 14px;
}
.details-title > div {
  line-height: 15px;
  margin-top: 8px;
  margin-right: 10px;
  font-size: 12px;
}
.details-collect {
  width: 27px;
  height: 22px;
  background-image: url(../../public/images/heart.png);
  background-size: cover;
  display: inline-block;
}
.details-message {
  color: #999;
  font-size: 15px;
  text-align: left;
  margin: 0 auto;
  width: 90%;
  line-height: 22px;
  border-bottom: 1px solid #f8f8f8;
  padding-bottom: 10px;
}
.details-message > :first-child {
  color: #ec5151;
}
.details-message-content > :last-child {
  margin-left: 45%;
}
.details-address {
  width: 92%;
  margin: 0 auto;
}
.details-address a {
  text-decoration: none;
  color: #232326;
  font-size: 14px;
  display: flex;
  justify-content: space-between;
  line-height: 40px;
  border-bottom: 1px solid rgb(241, 241, 241);
}
.details-address a > :first-child {
  color: #777;
  width: 20%;
  text-align: left;
}
.details-address-text {
  width: 62%;
  text-align: left;
}
.details-address a > :nth-child(3) {
  width: 4%;
  font-size: 24px;
}
.details-address a > :nth-child(3) > img {
  width: 14px;
  height: 14px;
  margin-left: 4px;
}
.details-refund-size {
  width: 92%;
  margin: 0 auto;
}
.details-refund {
  width: 100%;
  display: flex;
  justify-content: space-around;
  border-bottom: 1px solid rgb(241, 241, 241);
}
.details-refund > a {
  text-decoration: none;
  font-size: 14px;
  color: #777;
  line-height: 40px;
}
.details-refund > a > img {
  width: 16px;
}
.details-look-size {
  width: 92%;
  margin: 0 auto;
}
.details-look-pro {
  width: 100%;
  line-height: 42px;
}
.details-look-pro > a {
  display: flex;
  justify-content: space-between;
  text-decoration: none;
  font-size: 14px;
}
.details-look-pro > a > :first-child {
  color: #ec5151;
}
.details-look-pro > a > :nth-child(2) {
  font-size: 24px;
  margin-right: -10px;
}
.details-user-eval-bg {
  background-color: white;
  width: 100%;
}
.details-user-eval {
  width: 92%;
  margin: 0 auto;
}
.details-user-eval-size {
  width: 100%;
}
.details-user-eval-size > a {
  display: flex;
  text-decoration: none;
  color: #777;
  font-size: 14px;
  line-height: 42px;
}
.details-user-eval-size > a > :first-child {
  width: 20%;
  margin-left: -5px;
}
.details-user-eval-size > a > :nth-child(2) {
  width: 50%;
  margin-left: 35px;
}
.details-user-eval-size > a > :nth-child(2) > :last-child {
  color: #ec5151;
  margin: 0 5px;
}
.details-user-eval-size > a > :nth-child(3) {
  width: 30%;
  text-align: right;
  margin-right: -8px;
}
.details-user-eval-size > a > :nth-child(3) > :first-child {
  color: #ec5151;
}
.details-user-eval-size > a > :nth-child(3) > :last-child {
  font-size: 24px;
  vertical-align: middle;
  margin-right: -3px;
}
.details-reco-size {
  width: 92%;
  margin: 0 auto;
}
.details-reco {
  width: 100%;
}
.details-reco > p {
  color: #ec5151;
  text-align: left;
  font-size: 14px;
  margin: 10px 0;
}
.details-reco > ul {
  display: flex;
  justify-content: space-between;
}
.details-reco > ul > li {
  width: 25%;
  margin: 0 5px;
}
.details-reco > ul > li > a {
  text-decoration: none;
  font-size: 14px;
  color: #232326;
}
.details-reco > ul > li > a > img {
  width: 100%;
}
.details-reco > ul > li > a > :nth-child(2) {
  overflow: hidden;
  text-overflow: ellipsis;
  display: -webkit-box;
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;
  height: 29px;
  margin: 5px 0;
}
.details-reco > ul > li > a > :last-child {
  color: #ec5151;
  text-align: left;
}
.details-tips {
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
}
.mint-navbar .mint-tab-item.is-selected {
  border: 0;
}
.mint-navbar .mint-tab-item.is-selected a {
  color: #ec5151;
}
.details-pro-eval-border {
  border-top: 2px solid #dedede;
  border-bottom: 1px solid #dedede;
}
.details-pro-eval a {
  text-decoration: none;
  color: #232326;
  font-size: 15px;
}
.mint-navbar .mint-tab-item {
  padding: 15px 0;
}
.details-pro-eval-tips {
  width: 100%;
  background-color: rgb(241, 241, 241);
  height: 70px;
  margin: 100px 0;
}
.details-pro-eval-tips > div {
  width: 40px;
  margin: 0 auto;
}
.details-pro-eval-tips > div > img {
  width: 100%;
}
.details-pro-eval-tips > p {
  font-size: 14px;
  color: #777;
  margin-top: 6px;
}
</style>