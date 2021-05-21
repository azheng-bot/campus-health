<template>
  <div class="assign">
    <div class="title">快速分派</div>
    <div class="lists" v-loading="!mapData.length || !classData.length">
      <!-- 选择日期 -->
      <list
        class="list"
        :source="dateList"
        keyword="date"
        label="date"
        header="日期"
        :width="260"
        :height="650"
        :use-finished="true"
        :use-delete="true"
        @deleteItem="deleteItem"
        v-model:value="date"
      >
        <el-date-picker
          style="
            width: 100%;
            margin-top: 5px;
            padding: 5px;
            box-sizing: border-box;
          "
          v-model="datePickerData"
          type="date"
          placeholder="选择日期"
        >
        </el-date-picker>
      </list>
      <div class="right-turn">
        <img
          :style="{ opacity: date ? 1 : 0, zIndex: 10 }"
          src="/images/right-turn.png"
          alt=""
        />
        <img src="/images/right-turn-ready.png" alt="" />
      </div>
      <!-- 选择地图 -->
      <list
        class="list"
        v-if="mapData.length"
        :source="mapData"
        label="name"
        header="地图"
        :width="260"
        :height="650"
        v-model:value="mapId"
      ></list>
      <div class="right-turn">
        <img v-if="mapId && date" src="/images/right-turn.png" alt="" />
        <img v-else src="/images/right-turn-ready.png" alt="" />
        <img
          :style="{ opacity: date && mapId ? 1 : 0, zIndex: 10 }"
          src="/images/right-turn.png"
          alt=""
        />
        <img src="/images/right-turn-ready.png" alt="" />
      </div>
      <!-- 选择班级 -->
      <list
        class="list"
        v-if="classData.length"
        :source="classData"
        label="class_name"
        header="班级"
        :width="260"
        :height="650"
        v-model:value="classId"
      ></list>
      <div class="right-turn">
        <img
          :src="
            mapId && date && selectedClassList[0]
              ? '/images/right-turn.png'
              : '/images/right-turn-ready.png'
          "
          alt=""
        />
      </div>
      <!-- 已经被选择了的班级 -->
      <list
        class="list"
        :source="selectedClassList"
        label="className"
        keyword="classId"
        header="分派的班级"
        :width="260"
        :height="650"
        :use-delete="true"
        v-model:value="selectedClassId"
      ></list>
    </div>
    <div class="submit_btn">
      <el-button
        style="font-size: 18px"
        type="primary"
        @click="submitForm"
        :loading="isLoading"
        >点击分派</el-button
      >
    </div>
  </div>
</template>

<script>
import axios from "axios";
import { ElMessage } from "element-plus";
import List from "../components/List.vue";
import { time } from "echarts";
export default {
  components: {
    List,
  },
  data() {
    return {
      // 当前选择的信息
      date: "",
      mapId: 0,
      classId: 0,
      selectedClassId: 0,
      // 总分派数据
      assignList: [],
      lastAssignId: 0,
      // 显示在页面的数据
      dateList: [],
      mapData: [],
      classData: [],
      selectedClassList: [],
      // 时间选择器数据
      datePickerData: "",
      defaultTime: new Date(),
      isLoading: false,
    };
  },
  watch: {
    // 选择时间 - 时间选择器数据更改时
    datePickerData(newValue, oldValue) {
      if (newValue == "") return false;
      // 更改当前选中的date
      this.date = this.formatDate(newValue);
      // 查找是否已有该date，如果没有则添加
      if (!this.dateList.find((item) => item.date == this.date)) {
        this.dateList.push({
          date: this.date,
          mapList: [],
        });
      }
      // 更改当前mapId
      // this.mapId = this.mapData[0].id;
      // 更新selectedClassList
      this.getSelectedClassList();
      // datePicker数据清空
      this.datePickerData = "";
    },
    // 选择日期 - date更改时
    date(newValue) {
      // 更新selectedClassList
      this.getSelectedClassList();
    },
    // 选择地图 - 地图id更改时
    mapId(newValue) {
      if (!this.date) return false;
      // 更新selectedClassList
      this.getSelectedClassList();
    },
    // 选择班级 - 班级id更改时
    classId(newValue) {
      if (!(this.date && this.mapId)) return false;
      if (newValue == "") return false;
      if (!this.mapId && this.date)
        return this.$message.info("请选择日期和区域后再进行操作");

      // 添加班级数据
      // 如果当前日期、区域和当前选中的班级都有，则删除该班级
      let index = this.assignList.findIndex(
        (item) =>
          item.date == this.date &&
          item.mapId == this.mapId &&
          item.classId == this.classId
      );
      if (index != -1) {
        this.assignList.splice(index, 1);
        this.updateFinished();
        // 删除已分派班级列表信息
        this.selectedClassId = newValue;
        this.classId = "";
        return;
      }

      // 如果当前地图已经添加满，则取消添加并返回报错信息
      if (this.mapData.find((item) => item.id == this.mapId).finished) {
        this.classId = "";

        return this.$message.info("当前地图已添加满");
      }
      // 如果没有，则添加
      let className = this.classData.find((item) => item.id == this.classId)
        .class_name;
      this.assignList.push({
        id: ++this.lastAssignId,
        date: this.date,
        mapId: this.mapId,
        classId: this.classId,
        className,
      });
      // 更新selectedClassList
      this.getSelectedClassList();
      // 更新数据finished状态
      this.updateFinished();
      this.classId = "";
    },
    // selectedClassId信息改变时，删除该被选中的分派班级
    selectedClassId(newValue) {
      console.log(`newValue`, newValue);
      console.log(`this.selectedClassList`, this.selectedClassList);
      if (newValue == "") return false;
      this.assignList = this.assignList.filter(
        (item) =>
          !(
            item.date == this.date &&
            item.mapId == this.mapId &&
            item.classId == newValue
          )
      );
      this.selectedClassList = this.selectedClassList.filter(
        (item) => item.classId != newValue
      );
      this.updateFinished();
      this.selectedClassId = "";
    },
  },
  created() {
    this.init();
  },
  methods: {
    // 初始化获取基本信息
    async init() {
      // 获取地图信息
      let res = await this.$axios.get("/map/area_num", {
        params: { s_id: this.$route.params.s_id },
      });
      this.mapData = res.data.data;

      // 获取班级信息
      let res2 = await this.$axios.get("/class", {
        params: { s_id: this.$route.params.s_id },
      });
      this.classData = res2.data.data;
    },

    // 日期改变时调整默认日期
    timeChange(time) {
      this.defaultTime = time;
    },
    // 格式日期
    formatDate(time) {
      return (
        time.getFullYear() + "-" + (time.getMonth() + 1) + "-" + time.getDate()
      );
    },
    // 获取当前数据对应的已选班级
    getSelectedClassList() {
      this.selectedClassList = this.assignList.filter(
        (item) => item.mapId == this.mapId && item.date == this.date
      );
      // 跟新班级列表的finished状态
      this.updateFinished();
    },
    // 更新数据后，变更数据的finished状态
    updateFinished() {
      // 初始化finished状态
      // this.dateList.forEach((item) => (item.finished = undefined));
      this.mapData.forEach((item) => (item.finished = undefined));
      this.classData.forEach((item) => (item.finished = undefined));

      // this.assignList.forEach((item) => {
      // 1.更新当前date对应的maplist状态
      this.mapData.forEach((item) => {
        let filter = this.assignList.filter(
          (item2) => item2.date == this.date && item2.mapId == item.id
        );
        // 分派班级和该地图区域量相等时
        if (filter.length == item.area_num) {
          item.finished = true;
        }
        // 该地图区域有分派班级时
        else if (filter.length) {
          item.finished = false;
        }
      });
      // 2.更新datelist列表状态
      this.dateList.forEach((item) => {
        if (item.date != this.date) return false;
        let filter = this.mapData.filter(
          (item2) => item2.finished !== undefined
        );
        if (filter.length) {
          item.finished = false;
          if (!filter.find((item2) => item2.finished === false))
            item.finished = true;
        }
      });
      // 3.更新当前date、mapid对应的classlist
      this.classData.forEach((item) => {
        this.assignList.forEach((item2) => {
          if (
            item2.date == this.date &&
            item2.mapId == this.mapId &&
            item2.classId == item.id
          ) {
            item.finished = true;
          }
        });
      });
    },
    // 删除datelist里的元素
    deleteItem(date) {
      console.log(`date`, date);
      this.dateList = this.dateList.filter((item) => item.date != date);
      this.assignList = this.assignList.filter((item) => item.date != date);
    },
    // 校验表单
    validForm() {
      if (!this.assignList.length) return false;
      // 当某个地图未写完时，返回提示信息
      let falseDate = this.dateList.find((item) => !item.finished);
      if (falseDate) {
        this.$message.info(falseDate.date + "的分派任务未填写完成");
        return false;
      } else {
        return true;
      }
    },
    // 完善表单
    completeForm() {
      let formData = [];
      this.assignList.forEach((item) => {
        // 查找是否有对应date
        let dateIndex = formData.findIndex((item2) => item2.date == item.date);
        if (dateIndex != -1) {
          // 查找是否有对应map
          let mapIndex = formData[dateIndex].mapList.findIndex(
            (item2) => item2.mapId == item.mapId
          );

          if (mapIndex != -1) {
            // 如果有则添加class
            formData[dateIndex].mapList[mapIndex].classList.push({
              classId: item.classId,
            });
          } else {
            // 没有则添加map
            formData[dateIndex].mapList.push({
              mapId: item.mapId,
              // 添加class
              classList: [{ classId: item.classId }],
            });
          }
        } else {
          // 没有则添加date
          formData.push({
            date: item.date,
            // 添加map
            mapList: [
              {
                mapId: item.mapId,
                // 添加class
                classList: [{ classId: item.classId }],
              },
            ],
          });
        }
      });
      return formData;
    },
    // 点击分派
    async submitForm() {
      // 校验表单
      if (!this.validForm()) return false;
      // 提交表单
      let formData = this.completeForm();
      this.isLoading = true;
      await this.$axios
        .post("/status/quick", {
          s_id: this.$route.params.s_id,
          principal_id: this.$store.state.userInfo.id,
          principal_name: this.$store.state.userInfo.username,
          assignData: formData,
        })
        .then((res) => {
          if (res.data.code == 200) {
            // 分派成功
            this.$message.success("分派成功");
            // 重置表单内容
            this.resetData();
          } else if (res.data.code == 201) {
            // 部分重复
            res.data.repeatList.forEach((item) => {
              setTimeout(() => {
                this.$message.error(
                  `${item.time} ${item.area_name} 区域的卫生情况重复添加`
                );
              }, 1);
            });
            setTimeout(() => {
              this.$message.success("分派成功");
            }, 1);
            // 重置表单内容
            this.resetData();
          } else {
            // 分派失败
            this.$message.error("分派失败");
          }
          this.isLoading = false;
        })
        .catch((err) => {
          console.log(err);
        });
    },
    // 提交完成之后，清空已选内容
    resetData() {
      // 清空数据
      this.assignList = [];
      this.dateList = [];
      this.lastAssignId = 0;
      // 更新状态
      this.updateFinished();
    },
  },
};
</script>

<style scoped>
.assign {
  padding: 25px;
  min-width: 1600px;
  box-sizing: border-box;
}
.assign .title {
  font-size: 28px;
  font-weight: 500;
  line-height: 30px;
  padding-left: 17px;
  box-sizing: border-box;
  margin: 5px 0px;
  position: relative;
}
.assign .title::after {
  content: "";
  display: block;
  width: 6px;
  height: 22px;
  background-color: #2e81e1;
  position: absolute;
  top: 6px;
  left: 0px;
}
.lists {
  margin-top: 30px;
  width: 90%;
  display: flex;
  flex-direction: row;
  justify-content: space-between;
  align-items: center;
}
.lists .right-turn {
  width: 70px;
  height: 70px;
  position: relative;
}
.lists .right-turn img {
  position: absolute;
  opacity: 1;
  transition: 0.35s;
}
.submit_btn {
  margin-top: 30px;
  margin-bottom: 20px;
  padding-left: 0px;
}
</style>