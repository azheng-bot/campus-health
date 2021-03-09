<template>
  <div class="count">
    <div class="view1">
      <div class="card">
        <div class="title">总卫生情况</div>
        <div class="wrapper">
          <div
            class="echart echart1"
            style="width: 100px; height: 100px"
            ref="echart1"
          ></div>
        </div>
      </div>
    </div>
    <div class="view2">
      <div class="row1">
        <div class="col1">
          <div class="card">
            <div class="title">班级卫生情况为优占总次数的比率</div>
            <div class="wrapper">
              <div
                class="echart echart2"
                style="width: 100px; height: 100px"
                ref="echart2"
              ></div>
            </div>
          </div>
        </div>
        <div class="col2">
          <div class="card">
            <div class="title">班级卫生情况为差占总次数的比率</div>
            <div class="wrapper">
              <div
                class="echart echart3"
                style="width: 100px; height: 100px"
                ref="echart3"
              ></div>
            </div>
          </div>
        </div>
        <div class="col3">
          <div class="card">
            <div class="title">总体优良差卫生情况占比</div>
            <div class="wrapper">
              <div
                class="echart echart4"
                style="width: 100px; height: 100px"
                ref="echart4"
              ></div>
            </div>
          </div>
        </div>
      </div>
      <div class="row2">
        <div class="card">
          <div class="title">负责人考勤情况</div>
          <div class="wrapper">
            <div
              class="echart echart5"
              style="width: 100px; height: 100px"
              ref="echart5"
            ></div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";
import * as echarts from "echarts";
export default {
  data() {
    return {};
  },
  created() {
    // 初始化信息
    this.init();
  },
  mounted() {
    // 初始化echarts
    this.initEcharts();
  },
  methods: {
    // 初始化信息
    init() {
      // 获取统计信息
      axios({
        method: "get",
        url: "/api/count",
        headers: {
          Authorization: window.sessionStorage.getItem("token"),
        },
      }).then((res) => {
        console.log(res);
        if (res.data.code == 200) {
          this.principalData = res.data.data;
          console.log(res);
        }
      });
    },
    initEcharts() {
      // 基于准备好的dom，初始化echarts实例
      // echart1 - 总体卫生情况
      var echart1 = echarts.init(document.getElementsByClassName("echart1")[0]);
      // 绘制图表
      echart1.setOption({
        title: {
          text: "ECharts 入门示例",
        },
        tooltip: {},
        xAxis: {
          data: ["衬衫", "羊毛衫", "雪纺衫", "裤子", "高跟鞋", "袜子"],
        },
        yAxis: {},
        series: [
          {
            name: "销量",
            type: "bar",
            data: [5, 20, 36, 10, 10, 20],
          },
        ],
      });
      // echart2 - 优率排行
      var echart2 = echarts.init(document.getElementsByClassName("echart2")[0]);
      // 绘制图表
      echart2.setOption({
        title: {
          text: "ECharts 入门示例",
        },
        tooltip: {},
        xAxis: {
          data: ["衬衫", "羊毛衫", "雪纺衫", "裤子", "高跟鞋", "袜子"],
        },
        yAxis: {},
        series: [
          {
            name: "销量",
            type: "bar",
            data: [5, 20, 36, 10, 10, 20],
          },
        ],
      });
      // echart3 - 差率排行
      var echart3 = echarts.init(document.getElementsByClassName("echart3")[0]);
      // 绘制图表
      echart3.setOption({
        title: {
          text: "ECharts 入门示例",
        },
        tooltip: {},
        xAxis: {
          data: ["衬衫", "羊毛衫", "雪纺衫", "裤子", "高跟鞋", "袜子"],
        },
        yAxis: {},
        series: [
          {
            name: "销量",
            type: "bar",
            data: [5, 20, 36, 10, 10, 20],
          },
        ],
      });
      // echart4 - 总体优良差占比
      var echart4 = echarts.init(document.getElementsByClassName("echart4")[0]);
      // 绘制图表
      echart4.setOption({
        title: {
          text: "ECharts 入门示例",
        },
        tooltip: {},
        xAxis: {
          data: ["衬衫", "羊毛衫", "雪纺衫", "裤子", "高跟鞋", "袜子"],
        },
        yAxis: {},
        series: [
          {
            name: "销量",
            type: "bar",
            data: [5, 20, 36, 10, 10, 20],
          },
        ],
      });
      // echart5 - 负责人考勤情况
      var echart5 = echarts.init(document.getElementsByClassName("echart5")[0]);
      // 绘制图表
      echart5.setOption({
        title: {
          text: "ECharts 入门示例",
        },
        tooltip: {},
        xAxis: {
          data: ["衬衫", "羊毛衫", "雪纺衫", "裤子", "高跟鞋", "袜子"],
        },
        yAxis: {},
        series: [
          {
            name: "销量",
            type: "bar",
            data: [5, 20, 36, 10, 10, 20],
          },
        ],
      });

      // 页面长度宽度改变时echarts自适应
      window.onresize = echartsAtaption;
      // echarts自适应
      function echartsAtaption() {
        echartArr.forEach((item) => {
          // echart的dom对象
          let echartElem = document.querySelector(item.cssName);
          // 父对象
          let parentElem = echartElem.parentElement;
          let width = parentElem.offsetWidth;
          let height = parentElem.offsetHeight;
          // 改变宽高
          item.echartObj.resize({ width, height });
        });
      }
      // 要自适应的echart对象数组
      let echartArr = [
        { echartObj: echart1, cssName: ".echart1" },
        { echartObj: echart2, cssName: ".echart2" },
        { echartObj: echart3, cssName: ".echart3" },
        { echartObj: echart4, cssName: ".echart4" },
        { echartObj: echart5, cssName: ".echart5" },
      ];
      // 初始时echarts自适应
      echartsAtaption();
    },
  },
};
</script>

<style scoped>
.count {
  width: 100%;
  height: 100%;
  color: #111;
  overflow: auto;
}
.view1 {
  height: 100%;
  width: 100%;
  padding: 15px;
  box-sizing: border-box;
}

.card {
  border-radius: 4px;
  border: 1px solid #ebeef5;
  background-color: #fff;
  box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1);
}
.view1 .card {
  width: 100%;
  height: 100%;
  padding: 15px;
  box-sizing: border-box;
  display: flex;
  flex-direction: column;
}
.view1 .card .title {
  text-align: center;
  line-height: 40px;
  font-size: 25px;
}
.view1 .card .wrapper {
  height: 100%;
  margin-top: 10px;
}

.view2 {
  height: 100%;
  width: 100%;
  padding: 15px;
  box-sizing: border-box;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
}
.view2 .row1 {
  height: 50%;
  margin-bottom: 20px;
  display: flex;
  flex-direction: row;
  justify-content: space-between;
}
.view2 .row1 .col1 {
  height: 100%;
  width: 33.3333%;
  margin-right: 20px;
}
.view2 .row1 .col1 .card {
  height: 100%;
  width: 100%;
  padding: 10px;
  box-sizing: border-box;
}
.view2 .row1 .card .title {
  line-height: 30px;
  font-size: 18px;
  padding-left: 5px;
}
.view2 .row1 .col2 {
  height: 100%;
  width: 33.3333%;
  margin-right: 20px;
}
.view2 .row1 .col2 .card {
  height: 100%;
  width: 100%;
  padding: 10px;
  box-sizing: border-box;
}
.view2 .row1 .col3 {
  height: 100%;
  width: 33.333%;
}
.view2 .row1 .col3 .card {
  height: 100%;
  width: 100%;
  padding: 10px;
  box-sizing: border-box;
}
.view2 .row2 {
  height: 50%;
}
.view2 .row2 .card {
  height: 100%;
  padding: 10px;
  box-sizing: border-box;
}
.view2 .row2 .card .title {
  line-height: 30px;
  font-size: 22px;
  text-align: center;
}
.view2 .wrapper {
  height: 100%;
}
</style>