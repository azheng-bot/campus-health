import { createApp } from "vue";
import App from "./App.vue";
// vue-router
import router from "./router";
// vuex
import store from "./store";

import "./assets/index.css"

// flexible
// import "lib-flexible"

// Element-plus
import ElementPlus from "element-plus";
import "element-plus/lib/theme-chalk/index.css";

// axios
import axios from "axios";
let service = axios.create({})
service.interceptors.request.use(
  config => {
    if (window.sessionStorage.getItem("token")) {
    config.headers["Authorization"] = window.sessionStorage.getItem("token")
    }
    return config
  },
  error => {
    return Promise.reject(error);
  }
)



import "dayjs/locale/zh-cn";
import locale from "element-plus/lib/locale/lang/zh-cn";

let app = createApp(App);
app.config.globalProperties.$axios = service
app.use(ElementPlus, { locale });
app
  .use(store)
  .use(router)
  .use(ElementPlus)
  .mount("#app");
