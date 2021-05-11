import { createStore } from "vuex";
import axios from "axios"

export default createStore({
  state: {
    // 登录者信息
    author:null,
    // 学校信息
    school:null
  },
  mutations: {
    setAuthorData(state,data) {
      state.author = data;
    },
    // 退出登录
    logout(state) {
      state.author = null;
      window.sessionStorage.removeItem("token");
    },
    setSchoolData(state,data) {
      state.school = data;
    },
  },
  actions: {
  },
  modules: {}
});
