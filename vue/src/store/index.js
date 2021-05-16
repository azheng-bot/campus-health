import { createStore } from "vuex";
import axios from "axios"

export default createStore({
  state: {
    // 登录者信息
    userInfo:null,
    // 学校信息
    school:null
  },
  mutations: {
    setAuthorData(state,data) {
      state.userInfo = data;
      console.log(`state.user`, state.userInfo)
    },
    // 退出登录
    logout(state) {
      state.userInfo = null;
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
