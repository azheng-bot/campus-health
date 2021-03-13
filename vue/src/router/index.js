import { createRouter, createWebHashHistory } from "vue-router";
import Login from "../views/Login.vue";
import Home from "../views/Home.vue";

const routes = [
  // 默认重定向到登录页
  {
    path: "/",
    redirect: "/index",
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
  // 分派
  {
    path: "/assign",
    name: "Assign",
    component: () => import("../views/Assign.vue"),
  },
  // 统计
  {
    path: "/count",
    name: "Count",
    component: () => import("../views/Count.vue"),
  },
  // 负责人
  {
    path: "/principal",
    name: "Principal",
    component: () => import("../views/Principal.vue"),
  },
  // 班级
  {
    path: "/class",
    name: "Class",
    component: () => import("../views/Class.vue"),
  },
  // 操作记录
  {
    path: "/operation",
    name: "Operation",
    component: () => import("../views/Operation.vue"),
  },
];

const router = createRouter({
  history: createWebHashHistory(),
  routes,
});
// router.beforeEach((to, from, next) => {
//   // 获取token
//   const isAuthenticated = window.sessionStorage.getItem("token");
//   // 如果将要去的地方 不是Login 且没有授权 要强制跳转到Login页面
//   if (to.name !== "Login" && !isAuthenticated) next({ name: "Login" });
//   else next(); // 否则放行
// });

export default router;
