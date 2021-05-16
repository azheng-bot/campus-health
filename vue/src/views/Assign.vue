<template>
  <div class="assign">
    <div class="title">卫生分派</div>
    <div class="assign-boxs">
      <div v-for="(item, index) in assignForm" :key="index" class="assign-box">
        <div class="wrapper">
          <el-row>
            <el-col :span="5" style="line-height: 40px; font-size: 18px"
              >日期:</el-col
            >
            <el-col :span="19">
              <el-date-picker
                v-model="item.time"
                type="date"
                placeholder="选择日期"
                style="width: 100%"
                @change="timeChange"
                clearable
              >
              </el-date-picker>
            </el-col>
          </el-row>
          <el-row>
            <el-col :span="7" style="line-height: 40px; font-size: 18px"
              >负责人:</el-col
            >
            <el-col :span="17">
              <el-input
                readonly
                v-if="$store.state.userInfo"
                v-model="$store.state.userInfo.username"
              ></el-input>
            </el-col>
          </el-row>
          <el-row>
            <el-col :span="5" style="line-height: 40px; font-size: 18px"
              >区域:</el-col
            >
            <el-col :span="19">
              <!-- <el-select v-model="item.area_id" placeholder="请选择">
                <el-option
                  v-for="item2 in areaData"
                  :key="item2.id"
                  :label="item2.area_name"
                  :value="item2.id"
                >
                </el-option>
              </el-select> -->
              <el-cascader
                v-if="areaData.length"
                v-model="item.area_id"
                :options="areaData"
                :props="{
                  label:'name',
                  value:'id',
                  children:'areaList',
                  emitPath:false
                }"
              ></el-cascader>
            </el-col>
          </el-row>
          <el-row>
            <el-col :span="5" style="line-height: 40px; font-size: 18px"
              >班级:</el-col
            >
            <el-col :span="19">
              <el-select
                v-model="item.class_id"
                placeholder="请选择"
                style="width: 100%"
              >
                <el-option
                  v-for="item2 in classData"
                  :key="item2.id"
                  :label="item2.class_name"
                  :value="item2.id"
                >
                </el-option>
              </el-select>
            </el-col>
          </el-row>
        </div>
      </div>
      <div class="assign-box add-box">
        <div class="wrapper" @click="addAssignBox">
          <div class="align_center">+</div>
        </div>
      </div>
    </div>
    <div class="submit_btn">
      <el-button
        style="font-size: 18px; width: 100px"
        type="primary"
        @click="submitForm"
        :loading="isLoading"
        >提交</el-button
      >
    </div>
  </div>
</template>

<script>
import axios from "axios";
import { ElMessage } from "element-plus";
export default {
  data() {
    return {
      assignForm: [
        {
          id: 1,
          time: new Date(),
          class_id: "",
          class_name: "",
          area_id: "", 
          area_name: "",
        },
      ],
      formLabelAlign: {
        time: "",
        class: "",
        area: "",
        principal: "",
        status: "",
      },
      rules: {
        time: [{ required: true, message: "请输入活动名称", trigger: "blur" }],
        class: [{ required: true, message: "请输入活动名称", trigger: "blur" }],
        area: [{ required: true, message: "请输入活动名称", trigger: "blur" }],
        principal: [
          { required: true, message: "请输入活动名称", trigger: "blur" },
        ],
        status: [
          { required: true, message: "请输入活动名称", trigger: "blur" },
        ],
      },
      classData: [],
      areaData: [],
      principalData: [],
      statusData: [
        { value: "0", label: "未检查" },
        { value: "1", label: "优" },
        { value: "2", label: "良" },
        { value: "3", label: "差" },
      ],
      defaultTime: new Date(),
      defaultId: 1,
      isLoading: false,
    };
  },
  created() {
    this.init();
    // this.username = this.$store.state.userInfo.username;
  },
  methods: {
    // 初始化获取基本信息
    async init() {
      // 获取区域信息
      let res = await this.$axios.get("/area", {
        params: { s_id: this.$route.params.s_id },
      });
      this.areaData = res.data.data;
      console.log(`res`, res);

      // 获取班级信息
      let res2 = await this.$axios.get("/class", {
        params: { s_id: this.$route.params.s_id },
      });
      this.classData = res2.data.data;

      // 获取负责人信息
      let res3 = await this.$axios.get("/principal", {
        params: { s_id: this.$route.params.s_id },
      });
      this.principalData = res3.data.data;
    },

    // 新增分派任务
    addAssignBox() {
      // 当已经创建的分派任务超过五个时，返回错误信息
      // if (this.assignForm.length >= 5) {
      //   return this.$message.info("单次最多创建五个卫生分派任务");
      // }
      this.assignForm.push({
        id: ++this.defaultId,
        time: this.defaultTime,
        class_id: "",
        class_name: "",
        area_id: "",
        area_name: "",
      });
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
    // 完善表单
    completeForm() {
      // 根据area_id、class_id选中area_name、class_name
      this.assignForm.forEach((item, index) => {
        // 根据area_id选中area_name
        if (item.area_id) {
          console.log(`item.area_id`, item.area_id)
          this.areaData.forEach(mapItem => {
            mapItem.areaList.forEach(areaItem => {
              if (areaItem.id == item.area_id) {
                return item.area_name = areaItem.name;
              }
            })
          })
          console.log(`item`, item)
        }


        // 根据class_id选中class_name
        if (item.class_id) {
          item.class_name = this.classData.find(
            (item2) => item2.id == item.class_id
          ).class_name;
        }
      });
    },
    // 校验表单
    validForm() {
      // 确定每一项表单内容都已填写
      let isAllRight = true;
      this.assignForm.forEach((item, index) => {
        for (var key in item) {
          if (!item[key]) {
            return (isAllRight = false);
          }
        }
      });
      // 如果没有完全填写则返回错误信息
      if (!isAllRight) return false;
      return true;
    },
    // 提交表单
    async submitForm() {
      // 完善表单
      this.completeForm();
      console.log("this.", this.assignForm);
      // 校验表单
      let valid = this.validForm();
      if (!valid) {
        return this.$message.error("请将表单填写完整");
      }
      this.isLoading = true;
      // 成功提交任务数组
      let successAssign = [];
      // 提交表单
      this.assignForm.forEach(async (item, index) => {
        await axios({
          method: "post",
          url: "/api/status",
          data: {
            principal_id: this.$store.state.userInfo.id,
            principal_name: this.$store.state.userInfo.username,
            time: this.formatDate(item.time),
            area_id: item.area_id,
            area_name: item.area_name,
            class_id: item.class_id,
            class_name: item.class_name,
          },
          headers: {
            Authorization: window.sessionStorage.getItem("token"),
          },
        })
          .then((res) => {
            // 分派成功
            if (res.data.code == 200) {
              this.$message.success("分派成功");
              successAssign.push(item.id);
              // 分派失败
            } else {
              this.$message({
                message: res.data.msg,
                duration: 10000,
                showClose: true,
                type: "error",
              });
            }

            // 当任务提交到最后一个时，清理表单内容
            if (index == this.assignForm.length - 1) {
              console.log("finish");
              console.log("successAssign", successAssign);
              this.clearForm(successAssign);
            }
          })
          .catch((err) => {
            console.log(err);
          });
      });
    },
    // 根据成功提交的任务id，清理表单内容
    clearForm(successAssign) {
      // 判断表单是否会被清空
      let isEmpty = successAssign.length == this.assignForm.length;
      console.log(successAssign.length, this.assignForm.length);
      console.log("isEmpty", isEmpty);
      // 删除成功提交的任务
      successAssign.forEach((item) => {
        let index = this.assignForm.findIndex((item2) => item2.id == item);
        this.assignForm.splice(index, 1);
      });

      // 清理完之后如果数组被清空，则新增一条初始信息
      if (this.assignForm.length == 0) {
        this.assignForm.push({
          id: ++this.defaultId,
          time: this.defaultTime,
          class_id: "",
          class_name: "",
          area_id: "",
          area_name: "",
        });
      }

      // 完成分派
      this.isLoading = false;
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
.assign-boxs::after {
  content: "";
  display: block;
  clear: both;
}
.assign-box {
  width: 25%;
  height: 390px;
  padding: 29px;
  float: left;
  box-sizing: border-box;
}
.assign-box .wrapper {
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  width: 100%;
  height: 100%;
  padding: 40px;
  box-sizing: border-box;
  background-color: #fff;
  border-radius: 20px;
  overflow: hidden;
}
.add-box .wrapper {
  border: 5px dashed #d9d9d9;
  box-sizing: border-box;
  position: relative;
  font-size: 300px;
  font-weight: 200;
  color: #d9d9d9;
  cursor: pointer;
}
.add-box .wrapper:hover {
  border-color: #66b1ff;
}
.add-box .wrapper .align_center {
  margin-top: -20px;
}
/* 水平垂直居中（父元素需相对定位） */
.align_center {
  display: block;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
}
.submit_btn {
  margin-top: 20px;
  margin-bottom: 20px;
  padding-left: 25px;
}
</style>