import { createRouter, createWebHashHistory } from "vue-router";
import Login from "../views/Login.vue";
import Home from "../views/Home.vue";

const routes = [
  // 默认重定向到登录页
  {
    path: "/",
    redirect: "/login",
  },
  // 登录页
  {
    path: "/login",
    name: "Login",
    component: Login,
  },
  //首页
  {
    path: "/home",
    name: "Home",
    component: () => import("../views/Home.vue"),
  },
];

const router = createRouter({
  history: createWebHashHistory(),
  routes,
});
router.beforeEach((to, from, next) => {
  // 获取token
  const isAuthenticated = window.sessionStorage.getItem("token");
  // 如果将要去的地方 不是Login 且没有授权 要强制跳转到Login页面
  if (to.name !== "Login" && !isAuthenticated) next({ name: "Login" });
  else next(); // 否则放行
});

export default router;
