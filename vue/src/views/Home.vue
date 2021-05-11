<template>
  <div class="home">
    <div v-if="$store.state.author" class="title">首页</div>
    <el-container>
      <el-main>
        <el-row style="height: 100%" :gutter="24">
          <!-- 地图 -->
          <el-col :span="17">
            <div class="card" style="height: 100%">
              <!-- card_header -->
              <div class="card_header">
                <span style="font-size: 30px; font-weight: 550">地图</span>
                <span
                  style="
                    font-size: 30px;
                    font-weight: 500;
                    float: right;
                    color: #c9c9c9;
                  "
                  >MAP</span
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
                <el-row class="map">
                  <el-col
                    :span="10"
                    class="playground color_block"
                    @click="switchRegion('playground')"
                    style="font-size: 50px"
                  >
                    <span class="align_center">足球场</span>
                  </el-col>
                  <el-col
                    :span="10"
                    style="
                      display: flex;
                      flex-direction: column;
                      justify-content: space-between;
                    "
                  >
                    <div
                      class="gym"
                      style="position: relative"
                      @click="switchRegion('gym')"
                    >
                      <span class="align_center">风雨操场</span>
                    </div>
                    <div
                      class="basketball"
                      style="position: relative"
                      @click="switchRegion('basketball')"
                    >
                      <span class="align_center">篮球场</span>
                    </div>
                  </el-col>
                </el-row>
                <div class="road" style="color:#Fff">马<span>路</span></div>
                <div class="teaching">
                  <el-row style="height: 100%">
                    <el-col
                      :span="12"
                      class="floorLeft"
                      @click="switchRegion('floorLeft')"
                    >
                      <div
                        class="align_center"
                        style="
                          font-size: 60px;
                          font-weight: 200;
                          color: #111;
                          z-index: 200;
                          white-space: nowrap;
                          margin-top: -10px;
                        "
                      >
                        教学楼 A区
                      </div>
                      <el-row class="parking">
                        <el-col :span="10">停车位</el-col>
                        <el-col :span="8" :offset="6">停车位</el-col>
                      </el-row>
                      <el-row>
                        <el-col :span="10">草坪</el-col>
                        <el-col :span="8" :offset="6">草坪</el-col>
                      </el-row>
                      <el-row class="parking">
                        <el-col :span="10">走廊</el-col>
                        <el-col :span="8" :offset="6">走廊</el-col>
                      </el-row>
                      <el-row class="studyFloor">
                        <el-col :span="10"> A栋 <br />教学楼 </el-col>
                        <el-col :span="6" style="border-top: 0px">
                          <span class="trashLeft">垃圾桶</span>
                          <span class="trashRight">垃圾桶</span>
                        </el-col>
                        <el-col :span="8">
                          B栋 <br />教学楼
                          <el-row class="door">
                            <el-col :span="8"></el-col>
                            <el-col :span="8"></el-col>
                            <el-col :span="8">门</el-col>
                          </el-row>
                        </el-col>
                      </el-row>
                    </el-col>
                    <el-col
                      :span="12"
                      class="floorRight"
                      @click="switchRegion('floorRight')"
                    >
                      <div
                        class="align_center"
                        style="
                          font-size: 60px;
                          font-weight: 200;
                          color: #111;
                          z-index: 200;
                          white-space: nowrap;
                          margin-top: -10px;
                        "
                      >
                        教学楼 B区
                      </div>
                      <el-row class="parking">
                        <el-col :span="8">停车位</el-col>
                        <el-col :span="10" :offset="6">停车位</el-col>
                      </el-row>
                      <el-row>
                        <el-col :span="8">草坪</el-col>
                        <el-col :span="10" :offset="6">草坪</el-col>
                      </el-row>
                      <el-row class="parking">
                        <el-col :span="8">走廊</el-col>
                        <el-col :span="10" :offset="6">走廊</el-col>
                      </el-row>
                      <el-row class="studyFloor">
                        <el-col :span="8">
                          B栋 <br />教学楼
                          <el-row class="door">
                            <el-col :span="8"></el-col>
                            <el-col :span="8"></el-col>
                            <el-col :span="8">门</el-col>
                          </el-row>
                        </el-col>
                        <el-col :span="6" style="border-top: 0px">
                          <span class="trashLeft">垃圾桶</span>
                          <span class="trashRight">垃圾桶</span>
                        </el-col>
                        <el-col :span="10"> C栋 <br />教学楼 </el-col>
                      </el-row>
                    </el-col>
                  </el-row>
                </div>
              </div>
            </div>
          </el-col>
          <el-col style="display: flex; flex-direction: column" :span="7">
            <!-- 选择日期 -->
            <el-row>
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
            <div
              style="
                flex: 1 1 0%;
                display: flex;
                padding: 10px;
                border-radius: 20px;
                border: 10px solid rgb(255, 255, 255);
                margin-top: 20px;
                flex-direction: column;
              "
            >
              <!-- 班级 -->
              <el-row style="height: 50%">
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
                    <div
                      class="card_body"
                      style="padding: 15px; font-size: 35px"
                      v-loading="isLoading"
                    >
                      <span v-if="dataHygiene[0]">{{
                        dataHygiene[0].class_name
                      }}</span>
                      <span v-else>无班级打扫</span>
                    </div>
                  </div>
                </el-col>
              </el-row>
              <!-- 情况 -->
              <el-row style="margin-top: 10px; height: 50%">
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
                    <div
                      class="card_body"
                      style="font-size: 35px; font-weight: 500"
                      v-loading="isLoading"
                    >
                      <template v-if="dataHygiene[0]">
                        <template v-if="dataHygiene[0].status == 0">
                          <div class="status_panel no_checked">未检查</div>
                        </template>
                        <template v-else-if="dataHygiene[0].status == 1">
                          <div class="status_panel good">优</div>
                        </template>
                        <template v-else-if="dataHygiene[0].status == 2">
                          <div style="" class="status_panel normal">良</div>
                        </template>
                        <template v-else-if="dataHygiene[0].status == 3">
                          <div class="status_panel bad">差</div>
                        </template>
                      </template>
                      <div v-else class="status_panel" style="">无班级打扫</div>
                    </div>
                  </div>
                </el-col>
              </el-row>
            </div>
          </el-col>
        </el-row>
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
      // 时间
      cleanTime: this.todayDate(),
      // 选择的那块区域
      region: 1,
      // 各个区域背景颜色
      regionColor: {
        playground: ["#d9f8c1", "#a9ee7b", 1],
        gym: ["#b5e4f5", " #08b3f1", 2],
        basketball: ["#f3ccb4", "#f87320", 3],
        floorLeft: ["#fdebb8", "#faca47", 4],
        floorRight: ["#c0d2f7", "#4c85f8", 5],
      },
      dataHygiene: "",
      isLoading: true,
    };
  },
  created() {
    this.hygieneData();
  },
  mounted() {
    this.switchRegion("playground");
  },

  methods: {
    // aaa() {
    //   this.hygieneData();
    //   this.cleanTime = this.cleanTime.toLocaleDateString().replaceAll("/", "-");
    // },
    formatDate(time) {
      this.cleanTime =
        time.getFullYear() + "-" + (time.getMonth() + 1) + "-" + time.getDate();
      this.hygieneData();
    },
    todayDate() {
      let time = new Date();
      return (
        time.getFullYear() + "-" + (time.getMonth() + 1) + "-" + time.getDate()
      );
    },
    // 点击区域的事件
    switchRegion(param) {
      let _this = this;
      this.region = this.regionColor[param][2];
      this.hygieneData();
      Object.keys(this.regionColor).forEach(function (key) {
        // 恢复默认颜色
        document.getElementsByClassName(key)[0].style.backgroundColor = "";
        // 取消框选
        document.getElementsByClassName(key)[0].style.border =
          "5px solid transparent";

        if (key == param) {
          // 颜色加重
          document.getElementsByClassName(param)[0].style.backgroundColor =
            _this.regionColor[param][1];
          // 框选
          document.getElementsByClassName(key)[0].style.border =
            "5px solid #5e5e5e";
        }
      });
    },
    hygieneData() {
      this.isLoading = true;
      axios({
        method: "get",
        // ?time=2021-1-20&area_id=1
        url: "/api/status?" + `time=${this.cleanTime}&area_id=${this.region}`,
        headers: {
          Authorization: window.sessionStorage.getItem("token"),
        },
      }).then((res) => {
        if (res.data.code == 200) {
          this.dataHygiene = res.data.data.statusData;
          console.log("res", res);
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
  // min-width: 1400px;
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
.bg-purple {
  height: 100px;
  background-color: aqua;
}
.bg-purples {
  height: 100px;
  background-color: saddlebrown;
}
.map {
  text-align: center;
  font-size: 30px;
  font-weight: 200;
  height: 35%;
}
.playground {
  background-color: #f0ffe6;
  height: 100%;
  margin-right: 30px;
  border-radius: 999px;
  cursor: pointer;
}
.playground:hover {
  background-color: #a9ee7b;
}
.gym {
  background-color: #ecfaff;
  height: 45%;
  line-height: 60px;
  cursor: pointer;
}
.gym:hover {
  background-color: #08b3f1;
}
.basketball {
  background-color: #ffeee3;
  height: 55%;
  line-height: 90px;
  margin-top: 10px;
  cursor: pointer;
}
.basketball:hover {
  background-color: #f87320;
}
.tennis {
  background-color: #ffecf1;
  height: 75px;
  line-height: 75px;
  cursor: pointer;
}
.tennis:hover {
  background-color: #f184a5;
}
.badminton {
  background-color: #f5bfb8;
  height: 75px;
  line-height: 75px;
  margin-top: 10px;
  cursor: pointer;
}
.badminton:hover {
  background-color: #f2543f;
}
.road {
  height: 30px;
  line-height: 30px;
  margin-top: 30px;
  background-color: #727272;
  text-align: center;
}
.road span {
  margin-left: 50px;
}
.teaching {
  border: 1px solid #e1e1e1;
  height: 50%;
  color: #5e5e5e;
  .floorLeft {
    padding-left: 16px;
    padding-bottom: 16px;
    background-color: #fff7e3;
  }
  .floorLeft:hover {
    background-color: #faca47;
  }
  .floorRight {
    padding-right: 16px;
    padding-bottom: 16px;
    background-color: #e7efff;
  }
  .floorRight:hover {
    background-color: #4c85f8;
  }
  .el-col {
    border: 1px solid #e1e1e1;
    text-align: center;
    display: flex;
    flex-direction: column;
    justify-content: center;
  }
  .parking {
    margin-top: 16px;
  }

  .studyFloor {
    flex: 1;
    .el-col {
      height: 100%;
      box-sizing: border-box;
      padding-top: 40px;
      .door {
        // margin-top: 19px;
        position: absolute;
        bottom: 0px;
        width: 100%;
        .el-col {
          height: 18px;
          line-height: 18px;
          padding: 0;
        }
      }
      .trashLeft {
        float: left;
        font-size: 12px;
      }
      .trashRight {
        float: right;
        font-size: 12px;
      }
    }
  }
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

// 水平垂直居中（父元素需相对定位）
.align_center {
  display: block;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
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
.active::after {
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