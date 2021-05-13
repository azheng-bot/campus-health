<template>
  <div class="status">
    <div class="title">卫生情况</div>
    <el-container style="overflow: auto">
      <el-header class="top" style="height: auto">
        <el-card>
          <el-row :gutter="20">
            <el-col :span="5">
              <el-date-picker
                v-model="time"
                type="date"
                placeholder="选择日期"
                @change="formatDate1"
                style="width: 100%"
                clearable
              >
              </el-date-picker>
            </el-col>
            <el-col :span="5" :offset="0">
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
            <el-col :span="5">
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
            <div
              style="position:absolute;right:10px;width:20%;display:flex;justify-content:space-between"
            >
              <el-button
                type="primary"
                icon="el-icon-search"
                @click="handleSearch"
                style="width: 48%; margin-right: 5px"
                >搜索</el-button
              >
              <el-button
                type="info"
                icon="el-icon-delete"
                @click="handleReset"
                style="width: 48%"
                >重置</el-button
              ></div
            >
          </el-row></el-card
        >
      </el-header>
      <el-main>
        <el-table
          v-loading="tableLoading"
          :data="tableData"
          border
          style="width: 100%; box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1)"
        >
          <el-table-column prop="time" label="时间" width="180">
          </el-table-column>
          <el-table-column prop="class_name" label="班级"> </el-table-column>
          <el-table-column prop="area_name" label="区域" width="180">
          </el-table-column>
          <el-table-column label="情况">
            <template #default="scope">
              <el-tag
                class="status_tag"
                type="info"
                v-if="scope.row.status == 0"
                >未<span>检查</span>
              </el-tag>
              <el-tag type="success" v-else-if="scope.row.status == 1"
                >优</el-tag
              >
              <el-tag v-else-if="scope.row.status == 2">良</el-tag>
              <el-tag type="danger" v-else-if="scope.row.status == 3"
                >差</el-tag
              >
            </template>
          </el-table-column>

          <el-table-column prop="principal_name" label="负责人">
          </el-table-column>
          <el-table-column label="操作">
            <template #default="scope">
              <el-button
                size="mini"
                type="warning"
                @click="handleEdit(scope.row)"
                >编辑</el-button
              >
            </template>
          </el-table-column>
        </el-table>
        <el-row style="margin-top: 20px">
          <el-pagination
            :current-page="page_num"
            :page-size="page_size"
            :page-sizes="[5,10, 20, 50]"
            layout="total, sizes, prev, pager, next, jumper"
            :total="total"
            @size-change="handleSizeChange"
            @current-change="handleCurrentChange"
          >
          </el-pagination>
        </el-row>
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
                @change="formatDate2"
              >
              </el-date-picker>
            </el-form-item>
          </el-form>
          <template #footer>
            <span class="dialog-footer">
              <el-button @click="dialogVisible = false">取 消</el-button>
              <el-button
                type="primary"
                @click="handleOk('ruleForm')"
                :loading="editLoading"
                >确 定</el-button
              >
            </span>
          </template>
        </el-dialog>
      </el-main>
    </el-container>
  </div>
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
        { value: "0", label: "未检查" },
        { value: "1", label: "优" },
        { value: "2", label: "良" },
        { value: "3", label: "差" },
      ],
      classValue: "",
      regionValue: "",
      page_size: 10,
      page_num: 1,
      total: 0,
      tableLoading: false,
      editLoading: false,
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
    },
    formatDate1(time) {
      if (!time) return (this.time = "");
      this.time =
        time.getFullYear() + "-" + (time.getMonth() + 1) + "-" + time.getDate();
    },
    formatDate2(time) {
      if (!time) return (this.formLabelAlign.time = "");
      this.formLabelAlign.time =
        time.getFullYear() + "-" + (time.getMonth() + 1) + "-" + time.getDate();
    },
    handleSearch() {
      this.getStatus();
    },
    handleClose() {
      // this.formLabelAlign = {};
      // location.reload();
    },
    // 分页器发生改变时
    handleSizeChange(size) {
      this.page_size = size;
      this.getStatus();
    },
    handleCurrentChange(num) {
      this.page_num = num || 1;
      this.getStatus();
    },
    aaa() {
      this.time = this.time.toLocaleDateString().replaceAll("/", "-");
    },
    // 点击修改回显
    handleEdit(row) {
      this.dialogVisible = true;
      // 深拷贝
      this.formLabelAlign = JSON.parse(JSON.stringify(row));
    },
    // 确认提交修改
    handleOk(formName) {
      this.editLoading = true;
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
                this.editLoading = false;
                this.getStatus();
                this.principalValue = [];
                this.dialogVisible = false;

                this.$message.success("修改成功");
              } else {
                this.$message.error(res.data.msg)
                this.editLoading = false;
              }
            })
            .catch((err) => {
              console.log(err);
            });
        } else {
          return false;
        }
      });
    },
    // 重置搜索信息
    handleReset() {
      this.time = "";
      this.classValue = "";
      this.regionValue = "";
      // ElMessage.success({
      //   message: "重置成功",
      //   type: "success",
      // });
    },
    // 获取卫生情况数据
    getStatus() {
      // 加载状态
      this.tableLoading = true;
      axios({
        method: "get",
        url:
          "/api/status?" +
          `time=${this.time}&area_id=${this.regionValue}&class_id=${this.classValue}&page_num=${this.page_num}&page_size=${this.page_size}`,
        headers: {
          Authorization: window.sessionStorage.getItem("token"),
        },
      }).then((res) => {
        if (res.data.code == 200) {
          this.tableData = res.data.data.statusData;
          this.total = res.data.data.total;
          // 取消加载状态
          this.tableLoading = false;

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

<style scoped>
.status {
  height: 100%;
  overflow: auto;
}
.status .title {
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
.status .title::after {
  content: "";
  display: block;
  width: 6px;
  height: 22px;
  background-color: #2e81e1;
  position: absolute;
  top: 6px;
  left: 0px;
}
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