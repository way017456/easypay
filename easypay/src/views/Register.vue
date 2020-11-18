<template>
  <div>
    <!-- 顶部 -->
    <div>
      <mt-header title="注册">
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
    <!-- 内容 -->
    <div class="register-content-bg">
      <div class="register-content">
        <div>
          <input type="text" placeholder="请输入手机号" v-model="phone" @blur="livephone" />
        </div>
        <p>国际/港澳台手机号,格式为00+国际区号+号码,如0085200000000</p>
        <div>
          <input v-model="password" type="text" placeholder="请设置6-20位登录密码" @blur="livepassword" />
        </div>
        <div>
          <input v-model="enpassword" type="text" placeholder="确认密码" @blur="conpassword" />
        </div>
        <div class="register-sendmessage">
          <input type="text" placeholder="请输入短信验证码" />
          <router-link to>获取短信验证码</router-link>
        </div>
        <div class="register-submit">
          <button @click="register">注册</button>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      menushow: "m-none",
      phone: "",
      password: "",
      enpassword: ""
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
    livephone() {
      let phoneRegExp = /^1[3-9]\d{9}$/;
      let emailRegExp = /^[a-zA-Z0-9_.-]+@[a-zA-Z0-9-]+(\.[a-zA-z0-9-]+)*\.[a-zA-Z0-9]{2,6}$/;
      if (this.phone == "") {
        // alert("手机号或邮箱不能为空");
        this.$toast("手机号或邮箱不能为空");
      } else if (
        !(phoneRegExp.test(this.phone) || emailRegExp.test(this.phone))
      ) {
        // alert("手机号或邮箱格式错误");
        this.$toast("手机号或邮箱格式错误");
      } else {
        return true;
      }
    },
    livepassword() {
      let pwdRegExp = /^[0-9A-Za-z]{6,20}$/;
      if (this.password == "") {
        // alert("密码不能为空");
        this.$toast("密码不能为空");
      } else if (!pwdRegExp.test(this.password)) {
        // alert("密码格式错误");
        this.$toast("密码格式错误");
        // alert("请输入6-20位数字和字母组合密码");
      } else {
        return true;
      }
    },
    conpassword() {
      let pwdRegExp = /^[0-9A-Za-z]{6,20}$/;
      if (this.enpassword == "") {
        // alert("请输入6-20位数字和字母组合密码");
        this.$toast("请输入6-20位数字和字母组合密码");
      } else if (!(this.enpassword == this.password)) {
        // alert("两次密码不一致");
        this.$toast("两次密码不一致");
      } else {
        return true;
      }
    },
    register() {
      if (
        this.livephone() == true &&
        this.livepassword() == true &&
        this.conpassword() == true
      ) {
        let data = this.qs.stringify({
          phone: this.phone,
          password: this.password
        });
        this.axios
          .post("/register", data, {
            headers: { "Content-Type": "application/x-www-form-urlencoded" }
          })
          .then(res => {
            let result = res.data;
            console.log(result);
            if (result.code == 1) {
              // alert("注册成功");
              this.$toast("注册成功");
              setTimeout(()=>{
                this.$router.push("/login");
              },2000);
            } else {
              // alert("用户已存在");
              this.$toast("用户已存在");
            }
          });
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
.register-content-bg {
  background-color: #f8f8f8;
}
.register-content {
  width: 90%;
  margin: 0 auto;
}
.register-content input {
  border: 0;
  width: 100%;
  height: 40px;
  margin-top: 30px;
  border-radius: 2px;
  font-size: 14px;
}
.register-content p {
  text-align: left;
  font-size: 14px;
  margin-top: 5px;
}
.register-sendmessage {
  text-align: left;
}
.register-sendmessage > input {
  width: 65%;
  margin-right: 6px;
}
.register-sendmessage > a {
  background-color: #ec5151;
  color: white;
  text-decoration: none;
  padding: 12px 5px;
  font-size: 14px;
  border-radius: 4px;
}
.register-submit > button {
  width: 90%;
  border: 0;
  margin-top: 40px;
  padding: 10px;
  background-color: #e30000;
  color: white;
  border-radius: 4px;
}
</style>