<template>
  <el-container>
    <el-header class="top" style="height: auto">
      <el-row :gutter="20">
        <el-col :span="4">
          <el-date-picker
            v-model="time"
            type="date"
            placeholder="选择日期"
            @change="formatDate"
            style="width: 100%"
            clearable 
          >
          </el-date-picker>
        </el-col>
        <el-col :span="4" :offset="0">
          <el-select
            v-model="classValue"
            placeholder="请选择班级"
            style="width: 100%"
            clearable 
          >
            <el-option
              v-for="item in classData"
              :key="item.id"
              :label="item.class_name"
              :value="item.id"
            >
            </el-option>
          </el-select>
        </el-col>
        <el-col :span="4">
          <el-select
            v-model="regionValue"
            placeholder="请选择区域"
            style="width: 100%"
            clearable 
          >
            <el-option
              v-for="item in areaData"
              :key="item.id"
              :label="item.area_name"
              :value="item.id"
            >
            </el-option>
          </el-select>
        </el-col>
        <el-col :span="6" :offset="0">
          <el-button type="primary" icon="el-icon-search" @click="handleSearch"
            >搜索</el-button
          >
          <el-button type="info" icon="el-icon-delete" @click="handleReset"
            >重置</el-button
          ></el-col
        >
      </el-row>
    </el-header>
    <el-main>
      <el-table
        v-loading="tableLoading"
        :data="tableData"
        border
        style="width: 100%"
      >
        <el-table-column prop="time" label="时间" width="180">
        </el-table-column>
        <el-table-column prop="class_name" label="班级"> </el-table-column>
        <el-table-column prop="area_name" label="区域" width="180">
        </el-table-column>
        <el-table-column label="情况">
          <template #default="scope">
            <el-tag class="status_tag" type="info" v-if="scope.row.status == 0"
              >未<span>检查</span>
            </el-tag>
            <el-tag type="success" v-else-if="scope.row.status == 1">优</el-tag>
            <el-tag v-else-if="scope.row.status == 2">良</el-tag>
            <el-tag type="danger" v-else-if="scope.row.status == 3">差</el-tag>
          </template>
        </el-table-column>

        <el-table-column prop="principal_name" label="负责人">
        </el-table-column>
        <el-table-column label="操作">
          <template #default="scope">
            <el-button size="mini" type="warning" @click="handleEdit(scope.row)"
              >编辑</el-button
            >
          </template>
        </el-table-column>
      </el-table>
      <el-dialog
        title="编辑"
        v-model="dialogVisible"
        width="30%"
        @close="handleClose"
      >
        <el-form
          label-width="80px"
          :model="formLabelAlign"
          :rules="rules"
          ref="ruleForm"
        >
          <el-form-item label="区域" prop="area_id">
            <el-select v-model="formLabelAlign.area_id" placeholder="请选择">
              <el-option
                v-for="item in areaData"
                :key="item.id"
                :label="item.area_name"
                :value="item.id"
              >
              </el-option>
            </el-select>
          </el-form-item>
          <el-form-item label="负责人" prop="principal_id">
            <el-select
              v-model="formLabelAlign.principal_id"
              placeholder="请选择"
            >
              <el-option
                v-for="item in principalData"
                :key="item.id"
                :label="item.principal_name"
                :value="item.id"
              >
              </el-option>
            </el-select>
          </el-form-item>
          <el-form-item label="班级" prop="class_id">
            <el-select v-model="formLabelAlign.class_id" placeholder="请选择">
              <el-option
                v-for="item in classData"
                :key="item.id"
                :label="item.class_name"
                :value="item.id"
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
              @change="formatDate"
            >
            </el-date-picker>
          </el-form-item>
        </el-form>
        <template #footer>
          <span class="dialog-footer">
            <el-button @click="dialogVisible = false">取 消</el-button>
            <el-button type="primary" @click="handleOk('ruleForm')"
              >确 定</el-button
            >
          </span>
        </template>
      </el-dialog>
    </el-main>
  </el-container>
</template>

<script>
import axios from "axios";
import { ElMessage } from "element-plus";
export default {
  data() {
    return {
      dialogVisible: false,
      time: "",
      classData: [],
      areaData: [],
      principalData: [],
      tableData: [],
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
      classValue: "",
      regionValue: "",
      row: "",
      tableLoading: false,
    };
  },
  created() {
    this.init();
    this.getStatus();
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
    formatDate(time) {
      this.formLabelAlign.time =
        time.getFullYear() + "-" + time.getMonth() + "-" + time.getDate();
    },
    handleSearch() {
      this.getStatus();
    },
    handleClose() {
      // this.formLabelAlign = {};
      // location.reload();
    },
    aaa() {
      this.time = this.time.toLocaleDateString().replaceAll("/", "-");
    },
    // 点击修改回显
    handleEdit(row) {
      this.dialogVisible = true;
      console.log("object", Object(row));
      // 深拷贝
      this.formLabelAlign = JSON.parse(JSON.stringify(row));
    },
    // 确认提交修改
    handleOk(formName) {
      this.$refs[formName].validate((valid) => {
        // 根据id确定各个参数的name
        this.formLabelAlign.class_name = this.classData.find(
          (item) => item.id == this.formLabelAlign.class_id
        ).class_name;
        this.formLabelAlign.area_name = this.areaData.find(
          (item) => item.id == this.formLabelAlign.area_id
        ).area_name;
        this.formLabelAlign.principal_name = this.principalData.find(
          (item) => item.id == this.formLabelAlign.principal_id
        ).principal_name;
        console.log("this.formLabelAlign", this.formLabelAlign);

        if (valid) {
          axios({
            method: "patch",
            url: "/api/status",
            headers: {
              Authorization: window.sessionStorage.getItem("token"),
            },
            data: this.formLabelAlign,
          })
            .then((res) => {
              if (res.data.code == 200) {
                this.getStatus();
                this.principalValue = [];
                this.dialogVisible = false;

                this.$message.success("修改成功");
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
    handleReset() {
      this.time = "";
      this.classValue = "";
      this.regionValue = "";
      ElMessage.success({
        message: "重置成功",
        type: "success",
      });
    },
    getStatus() {
      this.tableLoading = true;
      axios({
        method: "get",
        url:
          "/api/status?" +
          `time=${this.time}&area_id=${this.regionValue}&class_id=${this.classValue}`,
        headers: {
          Authorization: window.sessionStorage.getItem("token"),
        },
      }).then((res) => {
        if (res.data.code == 200) {
          this.tableData = res.data.data;
          this.tableLoading = false;
          console.log(res.data.data);
          this.formLabelAlign = {
            time: "",
            class: "",
            area: "",
            principal: "",
            status: "",
          };
        }
      });
    },
  },
};
</script>

<style>
.top {
  margin-top: 24px;
}

.status_tag span {
  display: none;
}
.status_tag:hover span {
  display: inline-block;
}
</style>