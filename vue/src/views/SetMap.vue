<template>
  <div class="set-map">
    <div class="main">
      <div class="title">地图设置</div>
      <!-- 画布 -->
      <div
        class="canvas"
        @mousedown="canvasMousedown"
        @mouseup="canvasMouseup"
        @mousemove="canvasMousemove"
      >
        <!-- area元素 -->
        <div
          v-for="(item, index) in areaList"
          :key="item.a_id"
          class="area"
          :style="{
            width: item.width + 'px',
            height: item.height + 'px',
            left: item.left + 'px',
            top: item.top + 'px',
            lineHeight: item.height + 'px',
            backgroundColor: item.color || '#eee',
          }"
          :class="[item.shape, { active: index == selectedAreaIndex }]"
          @mousedown="areaMousedown($event, item.a_id)"
          @mouseup="areaMouseup"
          @mousemove="areaMousemove"
          @contextmenu.prevent="rightClickArea($event, item.a_id)"
        >
          {{ item.name }}
        </div>
        <!-- 虚拟正在绘制的元素 -->
        <div
          v-show="drawingArea.is_show"
          class="drawing-area"
          :class="{ ellipse: selectedShape == 'ellipse' }"
          :style="{
            width: drawingArea.width + 'px',
            height: drawingArea.height + 'px',
            left: drawingArea.left + 'px',
            top: drawingArea.top + 'px',
            lineHeight: drawingArea.height + 'px',
          }"
        ></div>
        <!-- 提示信息 -->
        <ul class="tips">
          <li>操作提示：</li>
          <li>1.选择形状</li>
          <li>></li>
          <li>2.鼠标在画布上长按移动</li>
          <li>></li>
          <li>3.生成区域</li>
        </ul>
      </div>
    </div>
    <!-- 操作区 -->
    <div class="operation">
      <!-- 设置区域名 -->
      <div class="set-map-name">
        <div class="label">地图名：</div>
        <div class="input">
          <el-input v-model="mapName"></el-input
          ><el-button v-if="isEdit">确定</el-button>
        </div>
      </div>
      <!-- 图形操作 -->
      <div class="block-operation">
        <div class="choose-shape">
          <div class="title">选择图形</div>
          <div class="shapes">
            <div
              class="square"
              :class="{ active: selectedShape == 'square' }"
              @click="selectShape('square')"
            >
              <div class="wrapper">
                <div class="square-shape"></div>
                <div class="square-text">矩形</div>
              </div>
            </div>
            <div
              class="ellipse"
              :class="{ active: selectedShape == 'ellipse' }"
              @click="selectShape('ellipse')"
            >
              <div class="wrapper">
                <div class="ellipse-shape"></div>
                <div class="ellipse-text">椭圆形</div>
              </div>
            </div>
          </div>
        </div>

        <div class="set-block-name">
          <div class="label">N：</div>
          <div class="input">
            <el-input
              v-model="movingAreaInfo.name"
              placeholder="区域名"
            ></el-input>
          </div>
        </div>
        <div class="set-block-width">
          <div class="label">W：</div>
          <div class="input">
            <el-input
              type="number"
              v-model="movingAreaInfo.width"
              placeholder="长度"
            ></el-input>
          </div>
        </div>
        <div class="set-block-height">
          <div class="label">H：</div>
          <div class="input">
            <el-input
              type="number"
              v-model="movingAreaInfo.height"
              placeholder="宽度"
            ></el-input>
          </div>
        </div>
        <div class="set-block-x">
          <div class="label">X：</div>
          <div class="input">
            <el-input
              type="number"
              v-model="movingAreaInfo.left"
              placeholder="X轴坐标"
            ></el-input>
          </div>
        </div>
        <div class="set-block-y">
          <div class="label">Y：</div>
          <div class="input">
            <el-input
              type="number"
              v-model="movingAreaInfo.top"
              placeholder="Y轴坐标"
            ></el-input>
          </div>
        </div>
        <div class="set-block-color">
          <div class="label">C：</div>
          <div class="input">
            <el-input
              v-model="movingAreaInfo.color"
              placeholder="颜色"
            ></el-input>
          </div>
        </div>

        <div class="btn">
          <el-button v-if="isEdit">保存设置</el-button>
          <el-button v-else>保存地图</el-button>
        </div>
      </div>
    </div>
    <!-- 右键area时的菜单 -->
    <ul
      v-if="areaMenuSite.is_show"
      :style="{ left: areaMenuSite.left + 'px', top: areaMenuSite.top + 'px' }"
      class="area-menu"
    >
      <li @click="deleteArea">删除</li>
    </ul>
  </div>
</template>

<script>
export default {
  props: ["id"],
  data() {
    return {
      // 地图名
      mapName: "",
      // 当前页面是否是修改地图页面
      isEdit: false,
      // 选中的绘画形状
      selectedShape: "square",
      // 当前选中的区域id
      selectedAreaIndex: -1,
      // 鼠标是否在canvas区域按下
      // is_drawing: false,
      // 地图上所有元素
      areaList: [
        {
          // a_id用于区分和查找各个区域，非真实id
          a_id: 1,
          name: "教学楼1",
          width: 100,
          height: 50,
          left: 50,
          top: 50,
          color: "",
          shape: "square",
        },
        {
          a_id: 2,
          name: "教学楼2",
          width: 200,
          height: 100,
          left: 200,
          top: 50,
          color: "",
          shape: "ellipse",
        },
      ],
      // 点击canvas前，鼠标的client坐标
      beforeDrawMouseSite: {
        x: 0,
        y: 0,
      },
      // 点击canvas前，创建出的area的坐标
      beforeDrawAreaSite: {
        left: 0,
        top: 0,
      },
      // 虚拟正在绘制的元素
      drawingArea: {
        is_show: false,
        width: 0,
        height: 0,
        left: 0,
        top: 0,
        shape: "square",
      },
      // 最后一个区域的id
      lastId: 2,
      // 移动area前，鼠标的client坐标
      beforeMoveMouseSite: {
        x: 0,
        y: 0,
      },
      // 移动area前，area的坐标
      beforeMoveAreaSite: {
        left: 0,
        top: 0,
      },
      // 是否正在移动区域
      isMoving: false,
      // 正在移动的区域的信息
      movingAreaInfo: {
        name: "",
        width: "",
        height: "",
        left: "",
        top: "",
        color: "",
        shape: "square",
      },
      // 右键area显示的menu位置
      areaMenuSite: {
        is_show: false,
        left: 0,
        top: 0,
      },
      // 要删除的area的a_id
      toDeleteAreaId:-1
    };
  },
  created() {
    console.log(`this.id`, this.id);
    if (this.id) this.isEdit = true;
  },
  methods: {
    // 选择图形
    selectShape(shape) {
      if (this.selectedShape == shape) {
        this.selectedShape = -1;
      } else {
        this.selectedShape = shape;
      }

      // 当此时选择到某一区域时，改变该区域形状
      if (this.selectedShape != -1 && this.selectedAreaIndex != -1) {
        this.areaList[this.selectedAreaIndex].shape = this.selectedShape;
      }
    },
    // canvas鼠标按下画图
    canvasMousedown(e) {
      if (e.target.className != "canvas") return false;
      // 点击canvas，取消选择area
      if (this.selectedShape == -1) {
        this.movingAreaInfo = {
          name: "",
          width: "",
          height: "",
          left: "",
          top: "",
          color: "",
          shape: "square",
        };
        return;
      }

      this.drawingArea.is_show = true;
      this.drawingArea.left = e.layerX;
      this.drawingArea.top = e.layerY;
      this.drawingArea.shape = this.selectedShape;

      this.beforeDrawMouseSite = {
        x: e.clientX,
        y: e.clientY,
      };
    },
    // canvas鼠标弹起,确认生成
    canvasMouseup() {
      if (this.drawingArea.is_show) {
        // 太小时则不生成
        if (this.drawingArea.width <= 10 && this.drawingArea.height <= 10) {
          this.drawingArea.is_show = false;
          return false;
        }
        // 添加到area数组
        this.areaList.push({
          a_id: ++this.lastId,
          name: "",
          width: this.drawingArea.width,
          height: this.drawingArea.height,
          left: this.drawingArea.left,
          top: this.drawingArea.top,
          color: "",
          shape: this.drawingArea.shape,
        });
        // 重置drawingarea
        this.drawingArea = {
          is_show: false,
          width: 0,
          height: 0,
          left: 0,
          top: 0,
          shape: "square",
        };

        this.selectArea(this.lastId);
        this.drawingArea.is_show = false;
      }
    },
    // canvas画图时鼠标移动
    canvasMousemove(e) {
      if (this.drawingArea.is_show) {
        // if (e.target.className == "canvas") {
        console.log(`e`, e);
        let canvasLeft = document.getElementsByClassName("canvas")[0]
          .offsetLeft;
        let canvasTop = document.getElementsByClassName("canvas")[0].scrollTop;

        this.drawingArea.width = Math.max(
          e.clientX - this.beforeDrawMouseSite.x,
          0
        );
        this.drawingArea.height = Math.max(
          e.clientY - this.beforeDrawMouseSite.y,
          0
        );
        // this.drawingArea.width = e.layerX - this.drawingArea.left;
        // this.drawingArea.height = e.layerY - this.drawingArea.top;
        // } else if (e.target.className == "drawing-area") {
        //   this.drawingArea.width = e.layerX;
        //   this.drawingArea.height = e.layerY;
        // }
      }
    },
    // 选中area
    selectArea(a_id) {
      console.log(`a_id`, a_id);
      let index = this.areaList.findIndex((item) => item.a_id == a_id);
      console.log(`index`, index);
      this.selectedAreaIndex = index;

      this.movingAreaInfo = this.areaList[index];
    },
    // 拖拽移动area
    // area的mousedown事件
    areaMousedown(e, a_id) {
      if (!e.target.classList.contains("area")) return false;
      this.selectArea(a_id);

      this.isMoving = true;
      this.beforeMoveMouseSite = {
        x: e.clientX,
        y: e.clientY,
      };
      this.beforeMoveAreaSite = {
        left: this.areaList[this.selectedAreaIndex].left,
        top: this.areaList[this.selectedAreaIndex].top,
      };
    },
    // area的mouseup事件
    areaMouseup(e) {
      this.isMoving = false;
    },
    // area的mousemove事件
    areaMousemove(e) {
      if (!e.target.classList.contains("area")) return false;
      if (this.isMoving) {
        this.areaList[this.selectedAreaIndex].left = Math.max(
          this.beforeMoveAreaSite.left +
            (e.clientX - this.beforeMoveMouseSite.x),
          0
        );
        this.areaList[this.selectedAreaIndex].top = Math.max(
          this.beforeMoveAreaSite.top +
            (e.clientY - this.beforeMoveMouseSite.y),
          0
        );
      }
    },
    // 右键area
    rightClickArea(e, a_id) {
      console.log(`e`, e);
      this.areaMenuSite.left = e.pageX;
      this.areaMenuSite.top = e.pageY;
      this.areaMenuSite.is_show = true;
      this.toDeleteAreaId = a_id;
      console.log(`a_id`, a_id);
    },
    // 点击删除area
    deleteArea() {
      let index = this.areaList.findIndex((item) => item.a_id == this.toDeleteAreaId);
      this.areaList.splice(index, 1);
      this.$message.success("删除区域成功")
      this.areaMenuSite.is_show = false;
    },
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
.set-map .main > .title {
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
.set-map .main > .title::after {
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
  position: relative;
  margin-top: 50px;

  background-image: linear-gradient(rgb(241, 241, 241) 2px, transparent 0),
    linear-gradient(90deg, rgb(243, 243, 243) 2px, transparent 0),
    linear-gradient(hsl(0, 0%, 95%) 1px, transparent 0),
    linear-gradient(90deg, hsl(0, 0%, 97%) 1px, transparent 0);
  background-size: 75px 75px, 75px 75px, 15px 15px, 15px 15px;

  user-select: none;
}
.canvas .area {
  border: 3px #aaa solid;
  background: #eee;
  font-style: italic;
  position: absolute;
  text-align: center;
  cursor: pointer;
  box-sizing: border-box;
}
.canvas .area.active {
  border-color: #dd5858;
  z-index: 100;
}
.canvas .area.ellipse {
  border-radius: 999px;
}
.canvas .drawing-area {
  position: absolute;
  border: 3px #2e81e1 dashed;
  z-index: 150;
  box-sizing: border-box;
}
.canvas .drawing-area.ellipse {
  border-radius: 999px;
}
.canvas .tips {
  position: absolute;
  left: 0px;
  bottom: -35px;
  font-size: 14px;
  color: #aaa;
}
.canvas .tips li {
  float: left;
  margin-right: 10px;
}
.operation {
  width: 25%;
  min-width: 370px;
  height: 100%;
  background-color: #fff;
  box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1);
  padding: 20px;
  box-sizing: border-box;
  position: relative;
}

.set-map-name {
  margin-top: 5px;
}
.set-map-name .label {
  font-size: 22px;
}
.set-map-name .input {
  margin-top: 18px;
  display: flex;
  flex-direction: row;
  justify-content: space-between;
}
.set-map-name .input button {
  margin-left: 15px;
  font-size: 15px;
}

.block-operation {
  box-sizing: border-box;
  width: 100%;
  position: absolute;
  bottom: 0px;
  left: 0px;
  padding: 20px;
  padding-bottom: 60px;
}
.choose-shape .title {
  font-size: 18px;
}
.shapes {
  margin-top: 10px;
  display: flex;
  flex-direction: row;
  justify-content: left;
}
.shapes .square {
  margin-right: 30px;
}
.shapes .square,
.shapes .ellipse {
  padding: 10px;
  box-sizing: border-box;
  text-align: center;
  cursor: pointer;
  border: 1px solid transparent;
  border-radius: 3px;
}

.shapes .square:hover,
.shapes .ellipse:hover {
  border: 1px solid #616161;
}
.shapes .square .wrapper,
.shapes .ellipse .wrapper {
  width: max-content;
}
.shapes .square.active .square-shape,
.shapes .ellipse.active .ellipse-shape {
  border-color: #2e81e1;
}
.shapes .square.active .square-text,
.shapes .ellipse.active .ellipse-text {
  color: #2e81e1;
}
.shapes .square-shape,
.shapes .ellipse-shape {
  width: 100px;
  height: 60px;
  background-color: #eee;
  border: 2px solid #aaa;
  border-radius: 3px;
}
.shapes .ellipse-shape {
  border-radius: 999px;
}
.shapes .square-text,
.shapes .ellipse-text {
  font-size: 12px;
  margin-top: 5px;
  text-align: center;
  color: #aaa;
}
.set-block-name,
.set-block-width,
.set-block-height,
.set-block-color,
.set-block-x,
.set-block-y {
  margin-top: 15px;
  display: flex;
  flex-direction: row;
}
.set-block-name .label,
.set-block-width .label,
.set-block-height .label,
.set-block-color .label,
.set-block-x .label,
.set-block-y .label {
  width: 30px;
  line-height: 36px;
  font-size: 14px;
}
.set-block-name .input,
.set-block-width .input,
.set-block-height .input,
.set-block-x .input,
.set-block-color .input,
.set-block-y .input {
  width: 100%;
}

.btn {
  margin-top: 50px;
}
.btn button {
  float: right;
}

.area-menu {
  position: fixed;
  z-index: 200;
  left: 100px;
  top: 100px;
  width: 120px;
  border-radius: 4px;
  border: 1px solid rgb(226, 226, 226);
  background-color: #fff;
}
.area-menu li {
  width: 100%;
  font-size: 16px;
  line-height: 20px;
  padding: 5px 12px;
  box-sizing: border-box;
  transition: 0.1s;
  background-color: #fff;
  color: #111;
  cursor: pointer;
}
.area-menu li:hover {
  background-color: #ecf5ff;
  color: #409eff;
}
</style>