import { createRouter, createWebHashHistory } from "vue-router";
import Login from "../views/Login.vue";
import Home from "../views/Home.vue";

const routes = [
  // 默认重定向到登录页
  {
    path: "/:s_id",
    redirect:{name:"Index"}
  },
  // 登录页
  {
    path: "/:s_id/login",
    name: "Login",
    component: Login,
  },
  //首页
  {
    path: "/:s_id/index",
    name: "Index",
    component: () => import("../views/Home.vue"),
  },
  // 卫生情况
  // status
  {
    path: "/:s_id/status",
    name: "Status",
    component: () => import("../views/Status.vue"),
  },
  // 分派
  {
    path: "/:s_id/assign",
    name: "Assign",
    component: () => import("../views/Assign.vue"),
  },
  // 快速分派
  {
    path: "/:s_id/quick_assign",
    name: "QuickAssign",
    component: () => import("../views/QuickAssign.vue"),
  },
  // 统计
  {
    path: "/:s_id/count",
    name: "Count",
    component: () => import("../views/Count.vue"),
  },
  // 负责人
  {
    path: "/:s_id/principal",
    name: "Principal",
    component: () => import("../views/Principal.vue"),
  },
  // 班级
  {
    path: "/:s_id/class",
    name: "Class",
    component: () => import("../views/Class.vue"),
  },
  // 操作记录
  {
    path: "/:s_id/operation",
    name: "Operation",
    component: () => import("../views/Operation.vue"),
  },
  // 系统设置-基本信息
  {
    path: "/:s_id/setting/info",
    name: "set_info",
    component: () => import("../views/SetInfo.vue"),
  },
  // 系统设置-地图信息
  {
    path: "/:s_id/setting/maps",
    name: "maps",
    component: () => import("../views/Maps.vue"),
  },
  // 系统设置-地图设置
  {
    path: "/:s_id/setting/set_map/:id",
    name: "set_map_by_id",
    component: () => import("../views/SetMap.vue"),
    props:true
  },
  // 系统设置-地图设置
  {
    path: "/:s_id/setting/set_map",
    name: "set_map",
    component: () => import("../views/SetMap.vue"),
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
