import Vue from "vue";
import Vuex, { Store } from "vuex";

Vue.use(Vuex);

export default new Vuex.Store({
  // 定义应用状态的数据结构，其数据类型可以为string、number、boolean、array、object等
  state: {
    //记录登录状态
    isLogined: localStorage.getItem("isLogined")
      ? localStorage.getItem("isLogined")
      : 0,
    username: localStorage.getItem("username")
      ? localStorage.getItem("username")
      : "未登录",
    count: localStorage.getItem("count"),
    cart: localStorage.getItem("details"),
    arrCart: JSON.parse(localStorage.getItem("shopLists")) || [],
    // arrcheck: [],
  },
  getters: {},
  mutations: {
    logined(state, val) {
      state.isLogined = val;
    },
    setUser(state, user) {
      state.username = user;
    },
    setCount(state, count) {
      state.count = count;
      //保存到本地
      localStorage.setItem("count", state.count);
    },
    setCart(state, details) {
      let index = state.arrCart.findIndex((item) => {
        return item.id == details.id;
      });
      // console.log(index);
      if (index == -1) {
        state.arrCart.push(details);
      } else {
        state.arrCart[index].count++;
      }
      // 保存到本地
      localStorage.setItem("shopLists", JSON.stringify(state.arrCart));
    },
    updateCount(state, obj) {
      //深拷贝
      let arrCart = JSON.parse(JSON.stringify(state.arrCart));
      arrCart[obj.index].count = obj.count;
      state.arrCart = arrCart;
      localStorage.setItem("shopLists", JSON.stringify(state.arrCart));
    },
    updateArrCart(state) {
      localStorage.setItem("shopLists", JSON.stringify(state.arrCart));
    },
  },
  actions: {},
  modules: {},
});
