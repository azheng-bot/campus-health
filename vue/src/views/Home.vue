<template>
  <div class="home">
    <el-container>
      <el-header>
        <!-- 时间选择 -->
        <el-date-picker v-model="cleanTime" type="date" placeholder="选择日期">
        </el-date-picker>
      </el-header>

      <el-main>
        <el-row :gutter="24">
          <!-- 地图 -->
          <el-col :span="16">
            <el-card class="box-card">
              <template #header>
                <span>地图</span>
              </template>
              <el-row :gutter="20" class="map">
                <el-col
                  :span="10"
                  class="playground"
                  @click="switchRegion('playground')"
                  >操场</el-col
                >
                <el-col :span="8">
                  <div class="gym" @click="switchRegion('gym')">室内体育馆</div>
                  <div class="basketball" @click="switchRegion('basketball')">
                    篮球场
                  </div>
                </el-col>
                <el-col :span="6">
                  <div class="tennis" @click="switchRegion('tennis')">
                    网球场
                  </div>
                  <div class="badminton" @click="switchRegion('badminton')">
                    羽毛球场
                  </div>
                </el-col>
              </el-row>
              <div class="road">马<span>路</span></div>
              <div class="teaching">
                <el-row>
                  <el-col
                    :span="12"
                    class="floorLeft"
                    @click="switchRegion('floorLeft')"
                  >
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
            </el-card>
          </el-col>
          <el-col :span="8">
            <!-- 班级 -->
            <el-row>
              <el-col :span="24">
                <el-card class="box-card" style="margin-bottom: 24px">
                  <template #header>
                    <span>班级</span>
                  </template>
                  {{ region }}
                </el-card>
              </el-col>
            </el-row>
            <!-- 情况 -->
            <el-row>
              <el-col :span="24">
                <el-card class="box-card">
                  <template #header>
                    <span>情况</span>
                  </template>
                </el-card></el-col
              >
            </el-row>
          </el-col>
        </el-row>
      </el-main>
    </el-container>
  </div>
</template>

<script>
// @ is an alias to /src

export default {
  name: "Home",
  data() {
    return {
      // 时间
      cleanTime: new Date(),
      // 选择的那块区域
      region: "playground",
      // 各个区域背景颜色
      regionColor: {
        playground: ["#d9f8c1", "#a9ee7b"],
        gym: ["#b5e4f5", " #08b3f1"],
        basketball: ["#f3ccb4", "#f87320"],
        tennis: ["#fad1dd", " #f184a5"],
        badminton: ["#f5bfb8", "#f2543f"],
        floorLeft: ["#fdebb8", "#faca47"],
        floorRight: ["#c0d2f7", "#4c85f8"],
      },
    };
  },
  methods: {
    // 点击区域的事件
    switchRegion(param) {
      let _this = this;
      this.region = param;
      Object.keys(this.regionColor).forEach(function (key) {
        // 恢复默认颜色
        document.getElementsByClassName(key)[0].style.backgroundColor =
          _this.regionColor[key][0];
        if (key == param) {
          // 颜色加重
          document.getElementsByClassName(param)[0].style.backgroundColor =
            _this.regionColor[param][1];
        }
      });
    },
  },
};
</script>

<style lang="scss" scoped>
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
  font-size: 26px;
  font-weight: 600;
}
.playground {
  background-color: #d9f8c1;
  height: 160px;
  border-radius: 80px;
  line-height: 160px;
  cursor: pointer;
}
.playground:hover {
  background-color: #a9ee7b;
}
.gym {
  background-color: #b5e4f5;
  height: 60px;
  line-height: 60px;
  cursor: pointer;
}
.gym:hover {
  background-color: #08b3f1;
}
.basketball {
  background-color: #f3ccb4;
  height: 90px;
  line-height: 90px;
  margin-top: 10px;
  cursor: pointer;
}
.basketball:hover {
  background-color: #f87320;
}
.tennis {
  background-color: #fad1dd;
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
  height: 20px;
  margin-top: 30px;
  background-color: #aeaaab;
  text-align: center;
}
.road span {
  margin-left: 50px;
}
.teaching {
  border: 1px solid #000;
  .floorLeft {
    padding-left: 16px;
    padding-bottom: 16px;
    background-color: #fdebb8;
  }
  .floorLeft:hover {
    background-color: #faca47;
  }
  .floorRight {
    padding-right: 16px;
    padding-bottom: 16px;
    background-color: #c0d2f7;
  }
  .floorRight:hover {
    background-color: #4c85f8;
  }
  .el-col {
    border: 1px solid #000;
    text-align: center;
  }
  .parking {
    margin-top: 16px;
  }

  .studyFloor {
    .el-col {
      height: 120px;
      box-sizing: border-box;
      padding-top: 40px;
      .door {
        margin-top: 19px;
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
</style>
