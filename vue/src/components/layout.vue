<template>
  <div class="layout">
    <header class="header">
      <img class="logo" src="http://czxy.com/images/public/logo.png" />
      <span class="hero">校园卫生分派可视化系统</span>
      <dataTime class="datatime"></dataTime>
      <!-- 登出按钮 -->
      <div class="logout" @click="logout" title="退出">
        <svg
          t="1601795407188"
          style="display:block"
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
      <aside class="aside">
        <el-menu
          :uniqueOpened="true"
          default-active="1"
          class="el-menu-vertical-demo"
          background-color="#001f4e"
          text-color="#7394cd"
          active-text-color="#fff"
        >
          <span v-for="item in dataLayout">
            <el-menu-item :index="item.id" v-if="!item.children">
              <template #title>
                <span @click="JumpClick(item.url)">{{ item.name }}</span>
              </template>
            </el-menu-item>
            <el-submenu v-else :index="item.id">
              <template #title>
                <span>{{ item.name }}</span>
              </template>
              <el-menu-item v-for="item1 in item.children" :index="item1.id">
                <span @click="JumpClick(item1.url)">{{ item1.name }}</span>
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
    logout(){
      console.log('a')
      window.sessionStorage.removeItem("token")
      this.$router.push("/login")
    }
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
.container {
  flex: 1;
  display: flex;
  flex-direction: row;
  width: 100%;
}
.aside {
  width: 200px;
  background-color: #001f4e;
}
.content {
  flex: 1;
  background-color: #e9eef3;
}
</style>