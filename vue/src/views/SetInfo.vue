<template>
  <div class="set-info">
    <div class="title">基础设置</div>
    <div class="main">
      <div class="set-name clear">
        <div class="label">校名:</div>
        <div class="input">
          <el-input></el-input>
        </div>
      </div>
      <div class="set-logo clear">
        <div class="label">logo:</div>
        <div class="input">
          <el-input></el-input>
        </div>
      </div>
      <div class="btn">
        <el-button>确定修改</el-button>
      </div>
    </div>
  </div>
</template>

<script>
export default {};
</script>

<style>
.set-info {
  height: 100%;
}
.set-info .title {
  font-size: 24px;
  font-weight: 500;
  line-height: 30px;
  padding-left: 17px;
  box-sizing: border-box;
  margin: 28px 0px;
  margin-left: 20px;
  margin-bottom: 3px;
  position: relative;
}
.set-info .title::after {
  content: "";
  display: block;
  width: 6px;
  height: 22px;
  background-color: #2e81e1;
  position: absolute;
  top: 6px;
  left: 0px;
}
.set-info .main {
  margin: 20px;
  margin-top: 25px;
  margin-bottom: 0px;
  height: calc(100% - 120px);
  padding: 20px;
  box-sizing: border-box;

  border-radius: 4px;
  border: 1px solid #ebeef5;
  background-color: #fff;
  box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1);
}
.set-name,
.set-logo {
  margin-bottom: 30px;
  margin-top: 10px;
}
.set-name .label,
.set-logo .label {
  font-size: 22px;
  float: left;
  margin-right: 15px;
}
.set-name .input,
.set-logo .input {
  font-size: 22px;
  float: left;
}
</style>