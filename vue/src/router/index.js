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
    path: "/index",
    name: "Index",
    component: () => import("../views/Home.vue"),
  },
  // 卫生情况
  // status
  {
    path: "/status",
    name: "Status",
    component: () => import("../views/Status.vue"),
  },
  // assign
  {
    path: "/assign",
    name: "Assign",
    component: () => import("../views/Assign.vue"),
  },
  // count
  {
    path: "/count",
    name: "Count",
    component: () => import("../views/Count.vue"),
  },
  // principal
  {
    path: "/principal",
    name: "Principal",
    component: () => import("../views/Principal.vue"),
  },
  // class
  {
    path: "/class",
    name: "Class",
    component: () => import("../views/Class.vue"),
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
