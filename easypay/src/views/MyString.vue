<template>
  <div>
    <!-- 顶部 -->
    <div>
      <mt-header title="设置">
        <router-link to="/my" slot="left">
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
    <!-- 内容 -->
    <div>
        <div class="mystring-message">
            <ul>
                <li>
                    <router-link to="">
                        <span>头像</span>
                        <div>
                            <img src="../../public/images/my-order/user68.jpg" alt="">
                        </div>
                    </router-link>
                </li>
                <li>
                    <router-link to="">
                        <span>用户名</span>
                        <div>
                            <span>13890635657</span>
                            <span class="iconfont icon-iconfontyoujiantou-copy-copy-copy-copy"></span>
                        </div>
                    </router-link>
                </li>
                <li>
                    <router-link to="">
                        <span>性别</span>
                        <div>
                            <span>保密</span>
                            <span class="iconfont icon-iconfontyoujiantou-copy-copy-copy-copy"></span>
                        </div>
                    </router-link>
                </li>
                <li>
                    <router-link to="">
                        <span>手机</span>
                        <div>
                            <span>13890635657</span>
                            <span class="iconfont icon-iconfontyoujiantou-copy-copy-copy-copy"></span>
                        </div>
                    </router-link>
                </li>
                <li>
                    <router-link to="">
                        <span>邮箱</span>
                        <div>
                            <span class="iconfont icon-iconfontyoujiantou-copy-copy-copy-copy"></span>
                        </div>
                    </router-link>
                </li>
            </ul>    
        </div>
        <div class="mystring-addpassword">
            <ul>
                <li>
                    <router-link to="">
                        <span>修改密码</span>
                        <span class="iconfont icon-iconfontyoujiantou-copy-copy-copy-copy"></span>
                    </router-link>
                </li>
                <li>
                    <router-link to="">
                        <span>收货地址</span>
                        <span class="iconfont icon-iconfontyoujiantou-copy-copy-copy-copy"></span>
                    </router-link>
                </li>
            </ul>
        </div>
        <div class="mystring-quit">
            <button>安全退出</button>
        </div>
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      menushow: "m-none"
    };
  },
  methods: {
    menu() {
      if (this.menushow == "m-none") {
        this.menushow = "m-block";
      } else if ((this.menushow = "m-block")) {
        this.menushow = "m-none";
      }
    }
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
.mystring-message{
    width: 100%;
    background-color: white;
}
.mystring-message>ul{
    width: 100%;
    margin: 0 auto;
}
.mystring-message>ul>li{
    border-bottom: 1px solid #f8f8f8;
    padding: 12px 10px 12px 20px;
}
.mystring-message>ul>li a{
    width: 100%;
    display: flex;
    justify-content: space-between;
    text-decoration: none;
    color: #232326;
    font-size: 14px;
}
.mystring-message>ul>:first-child{
    padding: 15px 20px;
    border-top: 1px solid #ccc;
}
.mystring-message>ul>:first-child>a>span{
    line-height: 63px;
}
.mystring-message>ul>:first-child>a>div{
    width: 63px;
    height: 63px;
    border-radius: 50%;
    overflow: hidden;
}
.mystring-message>ul>:first-child>a>div>img{
    width: 100%;
}
.mystring-message>ul>li a>div>:last-child{
    font-size: 24px;
    vertical-align: middle;
}
.mystring-addpassword{
    width: 100%;
    background-color: white;
    margin-top: 10px;
}
.mystring-addpassword>ul>li{
    border-bottom: 1px solid #f8f8f8;
    padding: 12px 10px 12px 20px;
}
.mystring-addpassword>ul>li a{
    width: 100%;
    display: flex;
    justify-content: space-between;
    text-decoration: none;
    color: #232326;
    font-size: 14px;
}
.mystring-addpassword>ul>li a>:last-child{
    font-size: 24px;
    vertical-align: middle;
}
.mystring-quit{
    width: 100%;
    margin-top: 10px;
}
.mystring-quit>button{
    width: 92%;
    border:0;
    background-color: #ec5151;
    height: 42px;
    color: white;
    font-size: 15px;
    border-radius: 8px;
}
</style>