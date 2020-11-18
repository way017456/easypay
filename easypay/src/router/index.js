import Vue from "vue";
import VueRouter from "vue-router";
import Home from "../views/Home.vue";
import Index from "../views/Index.vue";
// import Order from "../views/Order.vue";
// import Cart from "../views/Cart.vue";
// import My from "../views/My.vue";
import Login from "../views/login.vue";
// import Register from "../views/Register.vue";
// import MyString from "../views/MyString.vue";
// import Details from "../views/Details.vue";
// import Search from "../views/Search.vue";
import searchResult from "../views/SearchResult.vue";

Vue.use(VueRouter);

const routes = [
  {
    path: "/",
    component: Index,
  },
  {
    path: "/order",
    // component: Order,
    component: () => import("../views/Order.vue"),
  },
  {
    path: "/cart",
    // component: Cart,
    component: () => import("../views/Cart.vue"),
  },
  {
    path: "/my",
    // component: My,
    component: () => import("../views/My.vue"),
  },
  {
    path: "/login",
    component: Login,
    // component: () => import("../views/login.vue"),
  },
  {
    path: "/register",
    // component: Register,
    component: () => import("../views/Register.vue"),
  },
  {
    path: "/mystring",
    // component: MyString,
    component: () => import("../views/MyString.vue"),
  },
  {
    path: "/details/:id",
    // component: Details,
    component: () => import("../views/Details.vue"),
    props: true,
  },
  {
    path: "/search",
    // component: Search,
    component: () => import("../views/Search.vue"),
  },
  {
    path: "/searchresult",
    component: searchResult,
    // component: () => import("../views/SearchResult.vue"),
  },
  // {
  //   path: '/',
  //   name: 'Home',
  //   component: Home
  // },
  // {
  //   path: '/about',
  //   name: 'About',
  //   // route level code-splitting
  //   // this generates a separate chunk (about.[hash].js) for this route
  //   // which is lazy-loaded when the route is visited.
  // component: () => import(/* webpackChunkName: "about" */ '../views/About.vue')
  // }
];

const router = new VueRouter({
  routes,
});

export default router;
