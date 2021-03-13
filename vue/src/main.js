import { createApp } from "vue";
import App from "./App.vue";
// vue-router
import router from "./router";
// vuex
import store from "./store";

import "./assets/index.css"

// Element-plus
import ElementPlus from "element-plus";
import "element-plus/lib/theme-chalk/index.css";

import "dayjs/locale/zh-cn";
import locale from "element-plus/lib/locale/lang/zh-cn";

createApp(App).use(ElementPlus, { locale });
createApp(App)
  .use(store)
  .use(router)
  .use(ElementPlus)
  .mount("#app");
