<template>
    <div>
        <!-- 顶部 -->
        <div class="head-border">
            <mt-header title="商品">
                <router-link to="/search" slot="left">
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
        <!-- 搜索后的页面 -->
        <div class="tosearch-pro" v-if="info">
          <!-- 未找到商品页面 -->
            <div class="details-tips" v-if="this.info.length == 0">
              <div>
                <img src="../../../server/images/details/none.png" alt />
              </div>
              <p>亲,暂时还没有此商品哦~</p>
            </div>
          <!-- 找到商品页面 -->
            <div class="index-pro-travel-list" v-else >
              <ul>
                <li v-for="(elem,i) of this.info" :key="i" @click="jumpdetails(elem)">
                  <div class="index-pro-travel-list-pro">
                    <router-link to>
                      <img :src="elem.listimg" alt />
                    </router-link>
                  </div>
                  <p class="index-pro-travel-list-pro-title">
                    {{elem.title}}
                  </p>
                  <p class="index-pro-travel-list-pro-price">
                    <span>￥</span>
                    <span>{{elem.price}}</span>
                    <span>￥{{elem.marketprice}}</span>
                  </p>
                </li>
              </ul>
            </div>
        </div>
        <div v-else>
          <!-- @keyup="loading" -->
          加载中……
        </div>
        <!-- 底部选项卡 -->
        <!-- <div class="search-check">
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
        </div> -->
    </div>
</template>
<script>
export default {
  data() {
    return {
      menushow: "m-none",
      active: "",
      info:null,
      section:""
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
    tosearch(e){
      if(e.keyCode == 13){
        //注意：使用path时，params将不可用
        this.$router.push({path:'/search',query:{pro:this.section}});
        //搜索后刷新一下页面
        window.location.reload();
      }
    },
    search(){
      //获取地址栏中的id，然后再向服务器发送请求
      let pro = this.$route.query.pro;
      this.axios.get(`/search?pro=`+pro).then(res=>{
        let data = res.data.result;
        // console.log(data);
        data =  data.map(item=>{
          item.listimg = require('../../../server/images/details/'+item.listimg);
          return item
        });
        this.info = data
        console.log(this.info);
      });
    },
    jumpdetails(elem){
      this.$router.push('/details/'+elem.id);
    }
    // loading(e){
    //   if(e.keyCode == 13){
    //     this.$indicator.open("加载中");
    //   }
    // }
  },
  mounted(){
    this.search();
  }
};
</script>
<style scoped>
.head-border{
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
.tosearch-pro{
    margin-top: 10px;
}
/* 未找到商品样式开始 */
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
/* 未找到商品样式结束 */


/* 搜索商品样式开始 */
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
/* 搜索商品样式结束*/
</style>