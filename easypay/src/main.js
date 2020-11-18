import Vue from "vue";
import App from "./App.vue";
import router from "./router";
import store from "./store";
import MintUI from "mint-ui";
import "mint-ui/lib/style.css";
import qs from "qs";
import axios from "axios";
import CartAdd from "./components/CartAdd.vue";

Vue.use(MintUI);
axios.defaults.baseURL = "http://127.0.0.1:3000";
axios.defaults.headers.post["Content-Type"] =
  "application/x-www-form-urlencoded";
Vue.prototype.qs = qs;
Vue.prototype.axios = axios;
Vue.prototype.imgurl = "http://127.0.0.1:3000/img/details/";
Vue.component("myCartadd", CartAdd);

Vue.config.productionTip = false;

new Vue({
  router,
  store,
  render: (h) => h(App),
}).$mount("#app");
