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
          default-active="2"
          class="el-menu-vertical-demo"
          background-color="#001f4e"
          text-color="#7394cd"
          active-text-color="#fff"
        >
          <el-submenu index="1">
            <template #title>
              <i class="el-icon-location"></i>
              <span>导航一</span>
            </template>
            <el-menu-item-group>
              <template #title>分组一</template>
              <el-menu-item index="1-1">选项1</el-menu-item>
              <el-menu-item index="1-2">选项2</el-menu-item>
            </el-menu-item-group>
            <el-menu-item-group title="分组2">
              <el-menu-item index="1-3">选项3</el-menu-item>
            </el-menu-item-group>
            <el-submenu index="1-4">
              <template #title>选项4</template>
              <el-menu-item index="1-4-1">选项1</el-menu-item>
            </el-submenu>
          </el-submenu>
          <el-menu-item index="2">
            <i class="el-icon-menu"></i>
            <template #title>导航二</template>
          </el-menu-item>
          <el-menu-item index="3" disabled>
            <i class="el-icon-document"></i>
            <template #title>导航三</template>
          </el-menu-item>
          <el-menu-item index="4">
            <i class="el-icon-setting"></i>
            <template #title>导航四</template>
          </el-menu-item>
          <el-submenu index="5">
            <template #title>
              <i class="el-icon-location"></i>
              <span>导航一</span>
            </template>
            <el-menu-item-group>
              <template #title>分组一</template>
              <el-menu-item index="5-1">选项1</el-menu-item>
              <el-menu-item index="5-2">选项2</el-menu-item>
            </el-menu-item-group>
            <el-menu-item-group title="分组2">
              <el-menu-item index="5-3">选项3</el-menu-item>
            </el-menu-item-group>
          </el-submenu>
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
export default {
  components: {
    dataTime,
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