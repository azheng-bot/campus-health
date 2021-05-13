<template>
  <div class="home">
    <div v-if="$store.state.author" class="title">首页</div>
    <el-container>
      <el-main>
        <div class="container">
          <!-- 地图 -->
          <div class="c1">
            <div class="card" style="height: 100%">
              <!-- card_header -->
              <div class="card_header">
                <span style="font-size: 30px; font-weight: 550">{{mapName}}</span>
                <div class="map-select">
                  <el-select v-if="mapId" v-model="mapId" placeholder="请选择">
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
                <div class="map-canvas">aa</div>
              </div>
            </div>
          </div>
          <div class="c2" style="display: flex; flex-direction: column">
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
            <el-row style="margin-top: 20px">
              <el-col :span="24">
                <div class="card">
                  <div class="card_header">
                    <span style="font-size: 20px; font-weight: 550">日期 </span>
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
                      @change="formatDate"
                      style="font-size: 20px; width: 100%"
                    >
                    </el-date-picker>
                  </div>
                </div>
              </el-col>
            </el-row>
            <!-- 选择班级 -->
            <el-row v-if="searchMode == 'class'" style="margin-top: 20px">
              <el-col :span="24">
                <div class="card">
                  <div class="card_header">
                    <span style="font-size: 20px; font-weight: 550">班级 </span>
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
                    <el-select
                      v-if="classId"
                      v-model="classId"
                      style="font-size: 20px; width: 100%"
                      placeholder="请选择"
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
            <!-- 查询结果 -->
            <div class="search-result" style="">
              <!-- 班级 -->
              <el-row v-if="searchMode != 'class'" style="height: 50%">
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
                    <div class="card_body" v-loading="isLoading">
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
                    : 'margin-top: 10px; height: 50%'
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
                      <span class="text">
                        <template v-if="statusData[0]">
                          <template v-if="statusData[0].status == 0">
                            <div class="status_panel no_checked">未检查</div>
                          </template>
                          <template v-else-if="statusData[0].status == 1">
                            <div class="status_panel good">优</div>
                          </template>
                          <template v-else-if="statusData[0].status == 2">
                            <div style="" class="status_panel normal">良</div>
                          </template>
                          <template v-else-if="statusData[0].status == 3">
                            <div class="status_panel bad">差</div>
                          </template>
                        </template>
                        <div v-else class="status_panel" style="">
                          无班级打扫
                        </div>
                      </span>
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
      // 选择的那块区域
      area: 1,
      // 各个区域背景颜色
      areaColor: {
        playground: ["#d9f8c1", "#a9ee7b", 1],
        gym: ["#b5e4f5", " #08b3f1", 2],
        basketball: ["#f3ccb4", "#f87320", 3],
        floorLeft: ["#fdebb8", "#faca47", 4],
        floorRight: ["#c0d2f7", "#4c85f8", 5],
      },
      statusData: "",
      isLoading: true,
      // 地图列表
      mapList: [
        {
          value: "选项1",
          label: "黄金糕",
        },
        {
          value: "选项2",
          label: "双皮奶",
        },
        {
          value: "选项3",
          label: "蚵仔煎",
        },
        {
          value: "选项4",
          label: "龙须面",
        },
        {
          value: "选项5",
          label: "北京烤鸭",
        },
      ],
      mapId: "",
      mapName:"",
      classList: [],
      classId: "",
    };
  },
  async created() {
    // 获取所有地图
    await this.getMapList();
    // 获取所有班级
    await this.getClassList();
    // 获取地图对应的区域信息
    await this.getAreaList();

    await this.getStatus();
  },
  mounted() {
    // this.switcharea("playground");
  },
  watch: {
    mapId:function(oldV,newV) {
      console.log(`oldV,newV`, oldV,newV)

    }
  },
  methods: {
    // 获取所有地图
    async getMapList() {
      let res = await this.$axios.get("/map", {
        params: { s_id: this.$route.params.s_id },
      });
      console.log(`res1`, res);
      this.mapList = res.data.data;
      this.mapId = this.mapList[0].id;
      this.mapName = this.mapList[0].name
    },
    // 获取所有班级
    async getClassList() {
      let res = await this.$axios.get("/class", {
        params: { s_id: this.$route.params.s_id },
      });
      console.log(`res2`, res);
      this.classList = res.data.data;
      this.classId = this.classList[0].id;
    },
    // 获取地图对应的区域信息
    async getAreaList() {
      let res = await this.$axios.get("/area", {
        params: { m_id: this.mapId },
      });
      console.log(`res3`, res);
      this.areaList = res.data.data;
    },
    // 格式化日期选择器的信息
    formatDate(time) {
      this.cleanTime =
        time.getFullYear() + "-" + (time.getMonth() + 1) + "-" + time.getDate();
      this.hygieneData();
    },
    // 把时间调到今天
    todayDate() {
      let time = new Date();
      return (
        time.getFullYear() + "-" + (time.getMonth() + 1) + "-" + time.getDate()
      );
    },
    // 点击区域的事件
    switcharea(param) {
      let _this = this;
      this.area = this.areaColor[param][2];
      this.hygieneData();
      Object.keys(this.areaColor).forEach(function (key) {
        // 恢复默认颜色
        document.getElementsByClassName(key)[0].style.backgroundColor = "";
        // 取消框选
        document.getElementsByClassName(key)[0].style.border =
          "5px solid transparent";

        if (key == param) {
          // 颜色加重
          document.getElementsByClassName(param)[0].style.backgroundColor =
            _this.areaColor[param][1];
          // 框选
          document.getElementsByClassName(key)[0].style.border =
            "5px solid #5e5e5e";
        }
      });
    },
    getStatus() {
      this.isLoading = true;
      axios({
        method: "get",
        // ?time=2021-1-20&area_id=1
        url: "/api/status?" + `time=${this.cleanTime}&area_id=${this.area}`,
        headers: {
          Authorization: window.sessionStorage.getItem("token"),
        },
      }).then((res) => {
        if (res.data.code == 200) {
          this.statusData = res.data.data.statusData;
          this.isLoading = false;
        }
      });
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
  margin-right: 10px;
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
.search-result {
  flex: 1 1 0%;
  display: flex;
  padding: 10px;
  border-radius: 20px;
  border: 10px solid rgb(255, 255, 255);
  margin-top: 20px;
  flex-direction: column;
}
.search-result .card_body {
  display: flex;
  justify-content: center;
  align-items: center;
  padding: 20px;
}
.search-result .card_body .text {
  font-size: 45px;
  text-align: center;
}

// 给各个色块加深颜色
.color_block:hover .color_block::after {
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
</style>