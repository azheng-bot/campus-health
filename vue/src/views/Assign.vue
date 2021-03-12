<template>
  <div class="assign">
    <div class="assign-boxs">
      <div v-for="(item, index) in assignForm" :key="index" class="assign-box">
        <div class="wrapper">
          <el-row>
            <el-col :span="5" style="line-height: 40px; font-size: 18px">
              日期：
            </el-col>
            <el-col :span="19">
              <el-date-picker
                v-model="time"
                type="date"
                placeholder="选择日期"
                style="width: 100%"
                height="40px"
                clearable
              >
              </el-date-picker>
            </el-col>
          </el-row>
          <el-row>
            <el-col :span="7" style="line-height: 40px; font-size: 18px">
              负责人：
            </el-col>
            <el-col :span="17">
              <el-select
                v-model="item.area_id"
                placeholder="请选择"
                style="width: 100%"
              >
                <el-option
                  v-for="item in areaData"
                  :key="item.value"
                  :label="item.label"
                  :value="item.value"
                >
                </el-option>
              </el-select>
            </el-col>
          </el-row>
          <el-row>
            <el-col :span="5" style="line-height: 40px; font-size: 18px">
              区域：
            </el-col>
            <el-col :span="19">
              <el-select
                v-model="item.area_id"
                placeholder="请选择"
                style="width: 100%"
              >
                <el-option
                  v-for="item in areaData"
                  :key="item.value"
                  :label="item.label"
                  :value="item.value"
                >
                </el-option>
              </el-select>
            </el-col>
          </el-row>
          <el-row>
            <el-col :span="5" style="line-height: 40px; font-size: 18px">
              班级：
            </el-col>
            <el-col :span="19">
              <el-select
                v-model="item.area_id"
                placeholder="请选择"
                style="width: 100%"
              >
                <el-option
                  v-for="item in areaData"
                  :key="item.value"
                  :label="item.label"
                  :value="item.value"
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
      <el-button style="font-size: 18px; width: 100px" type="primary"
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
          time: "",
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
    };
  },
  created() {
    this.init();
  },
  methods: {
    // 初始化获取基本信息
    async init() {
      // 获取区域信息
      let res = await axios({
        method: "get",
        url: "/api/area",
        headers: {
          Authorization: window.sessionStorage.getItem("token"),
        },
      });
      this.areaData = res.data.data;
      // 获取班级信息
      let res2 = await axios({
        method: "get",
        url: "/api/class",
        headers: {
          Authorization: window.sessionStorage.getItem("token"),
        },
      });
      this.classData = res2.data.data;
      // 获取负责人信息
      let res3 = await axios({
        method: "get",
        url: "/api/principal",
        headers: {
          Authorization: window.sessionStorage.getItem("token"),
        },
      });
      this.principalData = res3.data.data;
      console.log(this.areaData);
      console.log(this.classData);
      console.log(this.principalData);
    },

    // 新增分派任务
    addAssignBox() {
      // 当已经创建的分派任务超过五个时，返回错误信息
      if (this.assignForm.length >= 5) {
        return this.$message.info("创建的分派任务不能超过五个")
      }
      this.assignForm.push({
        time: "",
        class_id: "",
        class_name: "",
        area_id: "",
        area_name: "",
      });
    },
    // 格式日期
    formatDate(time) {
      return (
        time.getFullYear() + "-" + (time.getMonth() + 1) + "-" + time.getDate()
      );
    },
    // 提交表单
    submitForm(formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          axios({
            method: "post",
            url: "/api/status",
            data: {
              status: this.formLabelAlign.status,
              principal_id: this.formLabelAlign.principal[0],
              principal_name: this.formLabelAlign.principal[1],
              time: this.formLabelAlign.time,
              area_name: this.formLabelAlign.area[1],
              area_id: this.formLabelAlign.area[0],
              class_name: this.formLabelAlign.class[1],
              class_id: this.formLabelAlign.class[0],
            },
            headers: {
              Authorization: window.sessionStorage.getItem("token"),
            },
          })
            .then((res) => {
              if (res.data.code == 200) {
                console.log(res);
                ElMessage.success({
                  message: "分派成功",
                  type: "success",
                });
                this.formLabelAlign = {
                  time: "",
                  class: "",
                  area: "",
                  principal: "",
                  status: "",
                };
              }
            })
            .catch((err) => {
              console.log(err);
            });
        } else {
          console.log("error submit!!");
          return false;
        }
      });
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
.assign-boxs::after {
  content: "";
  display: block;
  clear: both;
}
.assign-box {
  width: 25%;
  height: 390px;
  padding: 25px;
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