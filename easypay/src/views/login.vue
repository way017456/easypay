<template>
  <div>
    <!-- 顶部 -->
    <div>
      <mt-header title="登录">
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
    <!-- 图片 -->
    <div class="login-banner">
      <img src="../../public/images/logo-login.jpg" alt />
    </div>
    <!-- 内容 -->
    <div class="login-content">
      <div class="login-padding">
        <!-- 账号 -->
        <div class="login-phone">
          <span>账号</span>
          <input type="text" v-model="phone" placeholder="请输入邮箱/手机号" />
        </div>
        <!-- 密码 -->
        <div class="login-password">
          <span>密码</span>
          <input :type="textshow" v-model="password" placeholder="请输入密码" />
          <i :class="iconf" @click="show"></i>
        </div>
        <!-- 提交 -->
        <div class="login-button">
          <mt-button type="primary" @click="login">提交</mt-button>
        </div>
        <!-- 注册&找回密码 -->
        <div>
          <div class="login-bottom">
            <span>
              <img src="../../public/images/not.png" alt />
              <router-link to="/register">快速注册</router-link>
            </span>
            <span>
              <img src="../../public/images/ru.png" alt />
              <router-link to>找回密码</router-link>
            </span>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      iconf: "iconfont icon-yanjing1",
      textshow: "text",
      menushow: "m-none",
      phone: "",
      password: ""
    };
  },
  methods: {
    show() {
      if (this.iconf == "iconfont icon-yanjing1") {
        this.iconf = "iconfont icon-yanjing-bi";
      } else if (this.iconf == "iconfont icon-yanjing-bi") {
        this.iconf = "iconfont icon-yanjing1";
      }
      if (this.textshow == "text") {
        this.textshow = "password";
      } else if (this.textshow == "password") {
        this.textshow = "text";
      }
    },
    menu() {
      if (this.menushow == "m-none") {
        this.menushow = "m-block";
      } else if ((this.menushow = "m-block")) {
        this.menushow = "m-none";
      }
    },
    checkphone() {
      let phoneRegExp = /^1[3-9]\d{9}$/;
      let emailRegExp = /^[a-zA-Z0-9_.-]+@[a-zA-Z0-9-]+(\.[a-zA-z0-9-]+)*\.[a-zA-Z0-9]{2,6}$/;
      if (this.phone == "") {
        // alert("账号不能为空");
        this.$toast("账号不能为空");
      } else if (phoneRegExp.test(this.phone) || emailRegExp.test(this.phone)) {
        return true;
      } else {
        // alert("手机号或邮箱有误");
        this.$toast("手机号或邮箱格式有误");
        return false;
      }
    },
    checkpassword() {
      let pwdRegExp = /^[0-9A-Za-z]{6,20}$/;
      if (this.password == "") {
        // alert("密码不能为空");
        this.$toast("密码不能为空");
      } else if (pwdRegExp.test(this.password)) {
        return true;
      } else {
        // alert("密码错误");
        this.$toast("密码错误");
        return false;
      }
    },
    login() {
      if (this.checkphone() == true && this.checkpassword() == true) {
        let data = {
          phone: this.phone,
          password: this.password
        };
        this.axios.post("/login", this.qs.stringify(data)).then(res => {
            let result = res.data;
            // conosle.log(result);
            if (result.code == 1) {
              // alert("登录成功");
              this.$toast("登录成功");
              //提交Mutatuins
              this.$store.commit("logined","1");
              this.$store.commit("setUser",this.phone);
              //往webstorage中存储，保证用户刷新后数据依然存在，达到缓存效果
              localStorage.setItem("isLogined","1");
              localStorage.setItem("username",this.phone);
              //存储登录用户的信息
              // localStorage.setItem('userlist',JSON.stringify(res.data.result));
              setTimeout(()=>{
                  this.$router.push("/");
              },2000);
            } else if(result.code == 0){
              // alert("登录失败"); 
              // this.$messagebox("登录提示","手机号(邮箱)或密码错误");
              console.log(result.data)
              this.$toast("用户不存在");
            }else{
              this.$messagebox("登录提示","手机号(邮箱)或密码错误");
            }
          });
        console.log(data);
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
.login-banner {
  width: 100%;
}
.login-banner > img {
  width: 100%;
}
.login-content {
  width: 100%;
}
.login-padding {
  width: 92%;
  margin: 10px auto;
}
.login-phone {
  width: 100%;
  border-bottom: 1px solid #eeeeee;
  line-height: 50px;
  text-align: left;
  color: #232326;
}
.login-phone > span {
  font-size: 14px;
  margin-right: 8px;
}
.login-phone > input {
  border: 0;
  font-size: 14px;
  color: rgb(118, 118, 118);
  width: 72%;
  height: 35px;
}
.login-password {
  width: 100%;
  border-bottom: 1px solid #eeeeee;
  line-height: 50px;
  text-align: left;
  color: #232326;
}
.login-password > span {
  font-size: 14px;
  margin-right: 8px;
}
.login-password > input {
  border: 0;
  font-size: 14px;
  color: rgb(118, 118, 118);
  width: 72%;
  height: 35px;
}
.login-password > i {
  font-size: 25px;
  vertical-align: middle;
}
.login-button {
  width: 100%;
  margin-top: 30px;
}
.mint-button--normal {
  padding: 0 140px;
}
.mint-button {
  border-radius: 25px;
}
.mint-button--primary {
  background-color: #1f1a15;
  font-size: 14px;
  height: 45px;
}
.login-bottom {
  width: 90%;
  margin: 25px auto;
  display: flex;
  justify-content: space-between;
}
.login-bottom img {
  width: 16px;
  height: 16px;
}
.login-bottom a {
  color: #232326;
  text-decoration: none;
  font-size: 12px;
  margin: 0 5px;
}
</style>