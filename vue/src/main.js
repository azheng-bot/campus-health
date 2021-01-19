import { createApp } from "vue";
import App from "./App.vue";
// vue-router
import router from "./router";
// vuex
import store from "./store";

// Element-plus
import ElementPlus from 'element-plus';
import 'element-plus/lib/theme-chalk/index.css';

createApp(App)
  .use(store)
  .use(router)
  .use(ElementPlus)
  .mount("#app");
