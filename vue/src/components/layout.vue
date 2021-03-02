<template>
  <div class="layout">
    <header class="header">
      <img class="logo" src="http://czxy.com/images/public/logo.png" />
      <span class="hero">校园卫生分派可视化系统</span>
      <dataTime class="datatime"></dataTime>
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
  height: 75px;
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
  right: 0px;
  top: -4px;
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