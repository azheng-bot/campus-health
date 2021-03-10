<template>
  <div class="box">
    <el-form
      label-width="80px"
      :model="formLabelAlign"
      :rules="rules"
      ref="ruleForm"
    >
      <el-form-item label="区域" prop="area">
        <el-select v-model="formLabelAlign.area" placeholder="请选择">
          <el-option
            v-for="item in areaData"
            :key="item.value"
            :label="item.label"
            :value="item.value"
          >
          </el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="负责人" prop="principal">
        <el-select v-model="formLabelAlign.principal" placeholder="请选择">
          <el-option
            v-for="item in principalData"
            :key="item.value"
            :label="item.label"
            :value="item.value"
          >
          </el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="班级" prop="class">
        <el-select v-model="formLabelAlign.class" placeholder="请选择">
          <el-option
            v-for="item in classData"
            :key="item.value"
            :label="item.label"
            :value="item.value"
          >
          </el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="情况" prop="status">
        <el-select v-model="formLabelAlign.status" placeholder="请选择">
          <el-option
            v-for="item in statusData"
            :key="item.value"
            :label="item.label"
            :value="item.value"
          >
          </el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="时间" prop="time">
        <el-date-picker
          v-model="formLabelAlign.time"
          type="date"
          placeholder="选择日期"
          @blur="aaa"
        >
        </el-date-picker>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click="submitForm('ruleForm')"
          >添加分派</el-button
        >
      </el-form-item>
    </el-form>
  </div>
</template>

<script>
import axios from "axios";
import { ElMessage } from "element-plus";
export default {
  data() {
    return {
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
      classData: [
        {
          value: ["1", "2019级全栈1212"],
          label: "2019级全栈1212",
        },
        {
          value: ["2", "19级Java"],
          label: "19级Java",
        },
        {
          value: ["3", "19级python"],
          label: "19级python",
        },
        {
          value: ["4", "19级数媒"],
          label: "19级数媒",
        },
        {
          value: ["5", "20级全栈Python"],
          label: "20级全栈Python",
        },
        {
          value: ["6", "20级Java"],
          label: "20级Java",
        },
        {
          value: ["7", "20级数媒"],
          label: "20级数媒",
        },
      ],
      areaData: [
        {
          value: ["1", "足球场"],
          label: "足球场",
        },
        {
          value: ["2", "风雨操场"],
          label: "风雨操场",
        },
        {
          value: ["3", "篮球场"],
          label: "篮球场",
        },
        {
          value: ["4", "教学楼A区"],
          label: "教学楼A区",
        },
        {
          value: ["5", "教学楼B区"],
          label: "教学楼B区",
        },
      ],
      principalData: [
        {
          value: ["1", "李闯闯"],
          label: "李闯闯",
        },
        {
          value: ["2", "杨文林"],
          label: "杨文林",
        },
        {
          value: ["3", "徐丹丹"],
          label: "徐丹丹",
        },
        {
          value: ["4", "肖威"],
          label: "肖威",
        },
        {
          value: ["5", "毛娇娇"],
          label: "毛娇娇",
        },
      ],
      statusData: [
        {
          value: "0",
          label: "未检查",
        },
        {
          value: "1",
          label: "优",
        },
        {
          value: "2",
          label: "良",
        },
        {
          value: "3",
          label: "差",
        },
      ],
    };
  },
  methods: {
    aaa() {
      this.formLabelAlign.time = this.formLabelAlign.time
        .toLocaleDateString()
        .replaceAll("/", "-");
    },

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

<style>
.box {
  width: 500px;
  margin: 100px auto;
}
.el-select {
  width: 300px;
}
</style>