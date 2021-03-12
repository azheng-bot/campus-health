<template>
  <div class="layout">
    <header class="header">
      <img class="logo" src="http://czxy.com/images/public/logo.png" />
      <span class="hero">校园卫生分派可视化系统</span>
      <dataTime class="datatime"></dataTime>
      <!-- 登录按钮 -->
      <div
        v-if="!$store.state.author"
        class="login"
        @click="login"
        title="登录"
      >
        <svg
          t="1615519534292"
          style="display: block"
          class="icon"
          viewBox="0 0 1024 1024"
          version="1.1"
          xmlns="http://www.w3.org/2000/svg"
          p-id="3012"
          width="40"
          height="40"
        >
          <path
            d="M512 65.2c-246.8 0-446.8 200-446.8 446.8s200 446.8 446.8 446.8 446.8-200 446.8-446.8S758.8 65.2 512 65.2z m245.2 692c-31.9 31.9-69 56.9-110.3 74.4-42.7 18.1-88.1 27.2-135 27.2-46.9 0-92.3-9.2-135-27.2-41.3-17.5-78.4-42.5-110.3-74.4-31.9-31.9-56.9-69-74.4-110.3-18.1-42.7-27.2-88.1-27.2-135 0-46.9 9.2-92.3 27.2-135 17.5-41.3 42.5-78.4 74.4-110.3s69-56.9 110.3-74.4c42.7-18.1 88.1-27.2 135-27.2 46.9 0 92.3 9.2 135 27.2 41.3 17.5 78.4 42.5 110.3 74.4s56.9 69 74.4 110.3c18.1 42.7 27.2 88.1 27.2 135 0 46.9-9.2 92.3-27.2 135-17.5 41.3-42.5 78.4-74.4 110.3z"
            fill="#ffffff"
            p-id="3013"
          ></path>
          <path
            d="M536.8 304L466 374.7l87.3 87.3h-274v100h274L466 649.3l70.7 70.7L674 582.7l70.7-70.7-70.7-70.7L536.8 304z m62.5 212v-8l4 4-4 4z"
            fill="#ffffff"
            p-id="3014"
          ></path>
        </svg>
      </div>
      <!-- 登出按钮 -->
      <div v-else class="logout" @click="logout" title="退出">
        <svg
          t="1601795407188"
          style="display: block"
          viewBox="0 0 1024 1024"
          version="1.1"
          xmlns="http://www.w3.org/2000/svg"
          p-id="4053"
          width="40"
          height="40"
        >
          <path
            d="M625.777778 312.888889v113.777778H398.222222v170.666666h227.555556v113.777778l227.555555-170.666667-227.555555-227.555555z m-113.777778 0v-113.777778H170.666667v625.777778h341.333333v-113.777778H284.444444v-398.222222h227.555556z"
            p-id="4054"
            fill="#fff"
          ></path>
        </svg>
      </div>
    </header>
    <div class="container">
      <aside v-if="$store.state.author" class="aside">
        <el-menu
          :uniqueOpened="true"
          default-active="1"
          class="el-menu-vertical-demo"
          background-color="#001f4e"
          text-color="#7394cd"
          active-text-color="#fff"
        >
          <span v-for="item in dataLayout">
            <el-menu-item
              :index="item.id"
              v-if="!item.children"
              @click="JumpClick(item.url)"
            >
              <template #title>
                <span>{{ item.name }}</span>
              </template>
            </el-menu-item>
            <el-submenu v-else :index="item.id">
              <template #title>
                <span>{{ item.name }}</span>
              </template>
              <el-menu-item
                v-for="item1 in item.children"
                :index="item1.id"
                @click="JumpClick(item1.url)"
              >
                <span>{{ item1.name }}</span>
              </el-menu-item>
            </el-submenu>
          </span>
        </el-menu>
      </aside>
      <section class="content">
        <slot></slot>
      </section>
    </div>
  </div>
</template>

<script>
import dataTime from "./dateTime";
import axios from "axios";
export default {
  data() {
    return {
      dataLayout: "",
    };
  },
  created() {
    this.layoutData();
  },
  components: {
    dataTime,
  },
  methods: {
    layoutData() {
      axios({
        method: "get",
        url: "/api/aside",
        headers: {
          Authorization: window.sessionStorage.getItem("token"),
        },
      }).then((res) => {
        if (res.data.code == 200) {
          this.dataLayout = res.data.data;
          console.log(res.data.data);
        }
      });
    },
    JumpClick(url) {
      this.$router.push(url);
      // console.log(url);
    },
    // 登出
    logout() {
      // this.$router.push("/login");
      this.$store.commit("logout")
    },
    // 登录
    login() {
      // this.$store.commit("login")
       this.$router.push("/login");
    },
  },
};
</script>

<style scoped>
.layout {
  display: flex;
  flex-direction: column;
  height: 100%;
}
.header {
  position: relative;
  width: 100%;
  /* height: 75px; */
  line-height: 75px;
  font-size: 38px;
  font-weight: 549;
  text-align: center;
  background-color: #1a1a1a;
  color: #fff;
}
.header .logo {
  position: absolute;
  left: 0px;
  display: block;
  height: 65px;
  margin-top: 5px;
}
.header .datatime {
  position: absolute;
  right: 50px;
  top: -4px;
}
.header .logout {
  height: 40px;
  width: 40px;
  position: absolute;
  right: 15px;
  top: 18px;
  cursor: pointer;
}
.header .login {
  height: 40px;
  width: 40px;
  position: absolute;
  right: 15px;
  top: 18px;
  cursor: pointer;
}
.container {
  flex: 1;
  display: flex;
  flex-direction: row;
  width: 100%;
  overflow: hidden;
}
.aside {
  width: 200px;
  background-color: #001f4e;
}
.content {
  flex: 1;
  background-color: #e9eef3;
  overflow: auto;
}
</style>