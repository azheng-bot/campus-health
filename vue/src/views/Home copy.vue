<template>
  <div class="home">
    <div v-if="$store.state.userInfo" class="title">首页</div>
    <el-container>
      <el-main>
        <div class="container">
          <!-- 地图 -->
          <div class="c1">
            <div class="card" style="height: 100%">
              <!-- card_header -->
              <div class="card_header">
                <span
                  style="font-size: 30px; font-weight: 550; margin-left: 8px"
                  >{{ mapName }}</span
                >
                <span
                  style="
                    font-size: 30px;
                    font-weight: 500;
                    float: right;
                    color: #c9c9c9;
                  "
                  >AREA</span
                >
              </div>
              <!-- card_body -->

              <div
                class="card_body"
                style="
                  padding: 15px;
                  display: flex;
                  flex-direction: column;
                  justify-content: center;
                  font-style: italic;
                "
              >
                <div v-loading="isAreaLoading" class="map-canvas">
                  <!-- area元素 -->
                  <div
                    v-for="item in areaList"
                    :key="item.id"
                    class="area"
                    :style="{
                      width: item.width + 'px',
                      height: item.height + 'px',
                      left: item.left + 'px',
                      top: item.top + 'px',
                      lineHeight: item.height + 'px',
                      backgroundColor: item.color || '#eee',
                      fontSize: item.width / 10 + 'px',
                    }"
                    :class="[item.shape, { active: item.id == areaId }]"
                    @click="handleArea(item.id)"
                  >
                    {{ item.area_name }}
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="c2" style="display: flex; flex-direction: column">
            <!-- 查询条件 -->
            <div class="search-condition" style="">
              <!-- 查询方式 - 班级/日期 -->
              <el-row>
                <div class="search-mode">
                  <div class="label">查询方式</div>
                  <el-select
                    v-model="searchMode"
                    style="width: 100%; font-size: 18px"
                  >
                    <el-option
                      v-for="item in searchModeList"
                      :key="item.value"
                      :label="item.label"
                      :value="item.value"
                    >
                    </el-option>
                  </el-select>
                </div>
              </el-row>
              <!-- 选择日期 -->
              <el-row style="margin-top: 15px">
                <el-col :span="24">
                  <div class="card">
                    <div class="card_header">
                      <span style="font-size: 20px; font-weight: 550"
                        >日期
                      </span>
                      <span
                        style="
                          font-size: 20px;
                          font-weight: 500;
                          float: right;
                          color: #c9c9c9;
                        "
                        >DATE</span
                      >
                    </div>
                    <div class="card_body" style="padding: 15px">
                      <el-date-picker
                        v-model="cleanTime"
                        type="date"
                        placeholder="选择日期"
                        @change="dateChange"
                        style="width: 100%"
                      >
                      </el-date-picker>
                    </div>
                  </div>
                </el-col>
              </el-row>
              <!-- 选择班级 -->
              <el-row v-if="searchMode == 'class'" style="margin-top: 15px">
                <el-col :span="24">
                  <div class="card">
                    <div class="card_header">
                      <span style="font-size: 20px; font-weight: 550"
                        >班级
                      </span>
                      <span
                        style="
                          font-size: 20px;
                          font-weight: 500;
                          float: right;
                          color: #c9c9c9;
                        "
                        >CLASS</span
                      >
                    </div>
                    <div class="card_body" style="padding: 15px">
                      <el-select
                        v-if="classId"
                        v-model="classId"
                        style="font-size: 20px; width: 100%"
                        placeholder="请选择"
                        @change="classChange"
                      >
                        <el-option
                          v-for="item in classList"
                          :key="item.id"
                          :label="item.class_name"
                          :value="item.id"
                        >
                        </el-option>
                      </el-select>
                    </div>
                  </div>
                </el-col>
              </el-row>
              <!-- 选择地图 -->
              <el-row v-if="searchMode == 'area'" style="margin-top: 15px">
                <el-col :span="24">
                  <div class="card">
                    <div class="card_header">
                      <span style="font-size: 20px; font-weight: 550"
                        >地图
                      </span>
                      <span
                        style="
                          font-size: 20px;
                          font-weight: 500;
                          float: right;
                          color: #c9c9c9;
                        "
                        >MAP</span
                      >
                    </div>
                    <div class="card_body" style="padding: 15px">
                      <el-select
                        v-if="mapId"
                        v-model="mapId"
                        placeholder="请选择"
                        style="width: 100%"
                        @change="mapChange"
                      >
                        <el-option
                          v-for="item in mapList"
                          :key="item.id"
                          :label="item.name"
                          :value="item.id"
                        >
                        </el-option>
                      </el-select>
                    </div>
                  </div>
                </el-col>
              </el-row>
            </div>
            <!-- 查询结果 -->
            <div class="search-result" style="">
              <!-- 班级 -->
              <el-row v-if="searchMode != 'class'" >
                <el-col :span="24">
                  <div class="card" style="height: 100%">
                    <div class="card_header">
                      <span style="font-size: 20px; font-weight: 500"
                        >打扫班级</span
                      >
                      <span
                        style="
                          font-size: 20px;
                          font-weight: 500;
                          float: right;
                          color: #c9c9c9;
                        "
                        >CLASS</span
                      >
                    </div>
                    <div class="card_body clean-class" v-loading="isLoading">
                      <span v-if="statusData[0]" class="text">{{
                        statusData[0].class_name
                      }}</span>
                      <span v-else class="text">无班级打扫</span>
                    </div>
                  </div>
                </el-col>
              </el-row>
              <!-- 情况 -->
              <el-row
                :style="
                  searchMode == 'class'
                    ? 'height:100%;'
                    : 'margin-top: 10px; height: 100%'
                "
              >
                <el-col :span="24">
                  <div class="card" style="height: 100%">
                    <div class="card_header">
                      <span style="font-size: 20px; font-weight: 500"
                        >打扫情况</span
                      >
                      <span
                        style="
                          font-size: 20px;
                          font-weight: 500;
                          float: right;
                          color: #c9c9c9;
                        "
                        >STATUS</span
                      >
                    </div>
                    <div class="card_body" style="" v-loading="isLoading">
                      <template v-if="statusData[0]">
                        <template v-if="statusData[0].status == 0">
                          <div class="status_panel no_checked">
                            <span class="text"> 未检查 </span>
                          </div>
                        </template>
                        <template v-else-if="statusData[0].status == 1">
                          <div class="status_panel good">
                            <span class="text"> 优 </span>
                          </div>
                        </template>
                        <template v-else-if="statusData[0].status == 2">
                          <div style="" class="status_panel normal">
                            <span class="text"> 良 </span>
                          </div>
                        </template>
                        <template v-else-if="statusData[0].status == 3">
                          <div class="status_panel bad">
                            <span class="text"> 差 </span>
                          </div>
                        </template>
                      </template>
                      <div v-else class="status_panel" style="">
                        <span class="text"> 无班级打扫 </span>
                      </div>
                    </div>
                  </div>
                </el-col>
              </el-row>
            </div>
          </div>
        </div>
      </el-main>
    </el-container>
  </div>
</template>

<script>
// @ is an alias to /src
import axios from "axios";
export default {
  name: "Home",
  data() {
    return {
      // 搜索方式 -
      searchMode: "class",
      searchModeList: [
        { label: "通过班级查询", value: "class" },
        { label: "通过区域查询", value: "area" },
      ],
      // 时间
      cleanTime: this.todayDate(),
      statusData: "",
      isLoading: true,
      // 地图列表
      mapList: [],
      mapId: "",
      mapName: "",
      // 班级列表
      classList: [],
      classId: "",
      // 区域列表
      areaList: [],
      areaId: "",
      isAreaLoading: true,
    };
  },
  watch: {},
  async created() {
    // 获取所有地图
    await this.getMapList();
    // 获取所有班级
    await this.getClassList();
    // 获取地图对应的区域信息
    await this.getAreaList();

    // 获取初始信息对应的卫生状态
    await this.getStatus();
  },
  mounted() {
    // this.handleArea("playground");
  },
  methods: {
    // 获取所有地图
    async getMapList() {
      let res = await this.$axios.get("/map", {
        params: { s_id: this.$route.params.s_id },
      });
      this.mapList = res.data.data;
      this.mapId = this.mapList[0].id;
      this.mapName = this.mapList[0].name;
    },
    // 获取所有班级
    async getClassList() {
      let res = await this.$axios.get("/class", {
        params: { s_id: this.$route.params.s_id },
      });
      this.classList = res.data.data;
      this.classId = this.classList[0].id;
    },
    // 获取地图对应的区域信息
    async getAreaList() {
      let res = await this.$axios.get("/area", {
        params: { m_id: this.mapId },
      });
      this.areaList = res.data.data;
      if (this.areaList[0]) {
        this.areaId = this.areaList[0].id;
      } else {
        this.areaId = "";
      }
      this.isAreaLoading = false;
    },
    // 格式化日期选择器的信息
    // formatDate(time) {
    //   this.cleanTime =
    //     time.getFullYear() + "-" + (time.getMonth() + 1) + "-" + time.getDate();
    //   this.getStatus();
    // },
    // 把时间调到今天
    todayDate() {
      let time = new Date();
      return (
        time.getFullYear() + "-" + (time.getMonth() + 1) + "-" + time.getDate()
      );
    },
    // 点击区域的事件
    handleArea(id) {
      if (this.areaId == id) return false;
      this.areaId = id;
      this.getStatus();
    },
    // 获取卫生情况
    async getStatus() {
      this.isLoading = true;
      // 根据查询模式配置参数
      let params;
      if (this.searchMode == "class") {
        params = {
          time: this.cleanTime,
          area_id: this.areaId,
          class_id: this.classId,
        };
      } else {
        params = {
          time: this.cleanTime,
          area_id: this.areaId,
        };
      }
      let res = await this.$axios.get("/status", {
        params,
      });
      if (res.data.code == 200) {
        this.statusData = res.data.data.statusData;
        this.isLoading = false;
      }
    },
    // 日期发生改变
    dateChange(time) {
      // 格式化日期选择器的信息
      this.cleanTime =
        time.getFullYear() + "-" + (time.getMonth() + 1) + "-" + time.getDate();
      this.getStatus();
    },
    // 地图发生改变
    async mapChange(mapId) {
      this.isAreaLoading = true;
      this.mapName = this.mapList.find((item) => item.id == mapId).name;
      await this.getAreaList();
      this.getStatus();
    },
    // 班级发生改变
    classChange(classId) {
      this.getStatus();
    },
  },
};
</script>

<style lang="less" scoped>
.home {
  height: 100%;
  width: 100%;
  overflow: auto;
  min-height: 700px;
}
.home .title {
  font-size: 28px;
  font-weight: 500;
  line-height: 30px;
  padding-left: 17px;
  box-sizing: border-box;
  margin: 28px 0px;
  margin-left: 20px;
  margin-bottom: 3px;
  position: relative;
}
.home .title::after {
  content: "";
  display: block;
  width: 6px;
  height: 22px;
  background-color: #2e81e1;
  position: absolute;
  top: 6px;
  left: 0px;
}
.el-container {
  height: 100%;
}
.el-main {
  height: 100%;
}
.el-header {
  border-bottom: 1px solid #000;
  line-height: 60px;
}

.card {
  border-radius: 3px;
  box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1);
  background-color: #fff;
  display: flex;
  flex-direction: column;
}

.card_header {
  padding: 15px;
  font-size: 20px;
  border-bottom: 1px solid #ebeef5;
}
.card_body {
  flex: 1;
}
.container {
  width: max-content;
  height: 100%;
  margin: 0 auto;
  display: flex;
  flex-direction: row;
}
.container .c1 {
  width: 1200px;
  margin-right: 20px;
}
.container .c1 .card_header .map-select {
  float: right;
}
.container .c1 .map-canvas {
  width: 900px;
  height: 600px;
  position: relative;
  margin: 0 auto;
}
.map-canvas .area {
  border: 4px #aaa solid;
  background: #eee;
  font-style: italic;
  position: absolute;
  text-align: center;
  cursor: pointer;
  box-sizing: border-box;
}
.map-canvas .area.ellipse {
  border-radius: 999px;
}
.map-canvas .area.active {
  border-color: #dd5858;
  z-index: 100;
}
.container .c2 {
  width: 400px;
}
.search-mode {
  width: 100%;
  border-radius: 3px;
  box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1);
  background-color: #fff;
  padding: 15px;
  box-sizing: border-box;

  display: flex;
  flex-direction: row;
}

.search-mode .label {
  margin-right: 3px;
  font-size: 20px;
  width: 120px;
  line-height: 40px;
  font-weight: 550;
}
// 水平垂直居中（父元素需相对定位）
.align_center {
  display: block;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
}
.search-condition {
  padding: 10px;
  border-radius: 20px;
  border: 10px solid rgb(255, 255, 255);
  flex-direction: column;
}
.search-result {
  flex: 1 1 0%;
  display: flex;
  padding: 10px;
  border-radius: 20px;
  border: 10px solid rgb(255, 255, 255);
  margin-top: 20px;
  flex-direction: column;
}
// 给各个色块加深颜色
.area:hover .area::after {
  width: 100%;
  height: 100%;
  position: absolute;
  left: 0;
  top: 0;
  background-color: #0000000a;
}
// 情况面板
.status_panel {
  height: 100%;
  padding: 15px;
  box-sizing: border-box;
  font-size: 40px;
}
.status_panel.good {
  background-image: linear-gradient(
    115deg,
    #fff,
    #fff,
    #f1ffec,
    #e8ffdf,
    #ccfab8,
    #b9f69f,
    #96dd73,
    #4ec413
  );
}
.status_panel.normal {
  background-image: linear-gradient(
    115deg,
    #fff,
    #fff,
    #fffbf1,
    #fff4db,
    #ffebba,
    #ffdc8c,
    #f6cb6b,
    #f6c960
  );
}
.status_panel.bad {
  background-image: linear-gradient(
    115deg,
    #fff,
    #fff,
    #fff0f0,
    #ffd6d6,
    #ffb6b6,
    #ff9191,
    #f46a6a,
    #dd3636
  );
}
.status_panel.no_checked {
  background-image: linear-gradient(
    115deg,
    #fff,
    #fff,
    #fafafa,
    #eeeeee,
    #e5e5e5,
    #dbdbdb,
    #c5c5c5,
    #9f9f9f
  );
}
.status_panel {
  display: flex;
  justify-content: center;
  align-items: center;
  padding: 20px;
}
.status_panel .text {
  font-size: 35px;
  text-align: center;
}
.clean-class {
  display: flex;
  align-items: center;
  padding: 20px;
}
.clean-class .text {
  font-size: 30px;
  text-align: center;
}
</style>