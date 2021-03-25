<template>
  <div id="app">
    <router-view v-if="$route.path == '/login'"></router-view>
    <layout v-else>
      <transition name="el-fade-in">
        <router-view></router-view>
      </transition>
      <!-- <router-view name="el-fade-in" v-slot="{ Component }">
        <transition>
          <component :is="Component" />
        </transition>
      </router-view> -->
    </layout>
  </div>
</template>

<script>
import layout from "./components/layout";
import axios from "axios";
export default {
  components: {
    layout,
  },
  beforeCreate(e) {
    document.title = '校园卫生分派可视化系统'
    // 如果没有登录者信息，则登录
    if (!this.$store.state.author) {
      let token = window.sessionStorage.getItem("token");
      axios.get("/api/login", {params:{token}}).then((res) => {
        console.log(`res`, res)
        this.$store.commit("setAuthorData",res.data.data)
      });
    }
  },
};
</script>

<style lang="scss">
html,
body {
  height: 100%;
  padding: 0;
  margin: 0;
}

#app {
  min-width: 1220px;
  height: 100%;
}

#nav {
  padding: 30px;

  a {
    font-weight: bold;
    color: #2c3e50;

    &.router-link-exact-active {
      color: #42b983;
    }
  }
}

/deep/.el-table--border th.gutter:last-of-type {
    display: table-cell !important;
}
</style>
