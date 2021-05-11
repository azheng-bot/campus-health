<template>
  <div class="set-map">
    <div class="main">
      <div class="title">地图设置</div>
      <!-- 画布 -->
      <div class="canvas"></div>
    </div>
    <!-- 操作区 -->
    <div class="operation">
      <!-- 设置区域名 -->
      <div class="set-map-name">
        <div class="label">地图名：</div>
        <div class="input"><el-input></el-input></div>
      </div>
      <!-- 图形操作 -->
      <div class="block-operation">
        <div class="choose-shape">
          <div class="title">选择图形</div>
          <div class="shapes">
            <div class="square">
              <div class="square-shape"></div>
              <div class="square-text">矩形</div>
            </div>
            <div class="ellipse">
              <div class="ellipse-shape"></div>
              <div class="ellipse-text">矩形</div>
            </div>
          </div>
        </div>

        <div class="set-block-name">
          <div class="label">区域名：</div>
          <div class="input"><el-input></el-input></div>
        </div>
        <div class="set-block-width">
          <div class="label">长度：</div>
          <div class="input"><el-input></el-input></div>
        </div>
        <div class="set-block-height">
          <div class="label">宽度：</div>
          <div class="input"><el-input></el-input></div>
        </div>
        <div class="set-block-x">
          <div class="label">X：</div>
          <div class="input"><el-input></el-input></div>
        </div>
        <div class="set-block-y">
          <div class="label">Y：</div>
          <div class="input"><el-input></el-input></div>
        </div>

        <div class="btn">
          <el-button>确认提交</el-button>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props: ["id"],
  data() {
    return {
      is_edit: false,
    };
  },
  created() {
    if (this.id) this.is_edit = true;
  },
};
</script>

<style scoped>
.set-map {
  width: 100%;
  height: 100%;
  min-height: 800px;
  display: flex;
  flex-direction: row;
  background-color: rgb(250, 250, 250);
}
.set-map .title {
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
.set-map .title::after {
  content: "";
  display: block;
  width: 6px;
  height: 22px;
  background-color: #2e81e1;
  position: absolute;
  top: 6px;
  left: 0px;
}
.main {
  width: 75%;
  height: 100%;
  min-width: 1100px;
  position: relative;
}
.main .canvas {
  width: 900px;
  height: 600px;
  border-radius: 4px;
  border: 1px solid #ebeef5;
  background-color: #fff;
  box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1);

  margin: 0 auto;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);

  background-image: linear-gradient(rgb(241, 241, 241) 2px, transparent 0),
    linear-gradient(90deg, rgb(243, 243, 243) 2px, transparent 0),
    linear-gradient(hsl(0, 0%, 95%) 1px, transparent 0),
    linear-gradient(90deg, hsl(0, 0%, 97%) 1px, transparent 0);
  background-size: 75px 75px, 75px 75px, 15px 15px, 15px 15px;
}
.operation {
  width: 25%;
  height: 100%;
  background-color: #fff;
  box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1);
  padding: 20px;
  box-sizing: border-box;
  position: relative;
}

.set-map-name .label {
  font-size: 20px;
}
.set-map-name .input {
  margin-top: 10px;
}

.block-operation {
  box-sizing: border-box;
  width: auto;
  position: absolute;
  bottom: 0px;
  left: 0px;
  padding: 20px;
  padding-bottom: 50px;
}
.choose-shape .title {
  font-size: 18px;
}
.shapes {
  margin-top: 10px;
  display: flex;
  flex-direction: row;
  justify-content: space-around;
}
.shapes .square {
  
}
</style>