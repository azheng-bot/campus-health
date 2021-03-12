import { createStore } from "vuex";

export default createStore({
  state: {
    // 登录者信息
    author:null
  },
  mutations: {
    setAuthorData(state,data) {
      state.author = data;
      console.log('object', state)
    },
    logout(state) {
      state.author = null;
      window.sessionStorage.removeItem("token");
      
    }
  },
  actions: {},
  modules: {}
});
