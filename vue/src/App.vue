<template>
  <div id="app">
    <router-view v-if="$route.path == '/login'"></router-view>
    <layout v-else>
      <router-view></router-view>
    </layout>
  </div>
</template>

<script>
import layout from "./components/layout";
export default {
  components: {
    layout,
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
</style>
