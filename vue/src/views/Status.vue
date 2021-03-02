<template>
  <el-container>
    <el-header class="top">
      <el-row :gutter="20">
        <el-col :span="4">
          <el-date-picker
            v-model="time"
            type="date"
            placeholder="选择日期"
            @blur="aaa"
          >
          </el-date-picker>
        </el-col>
        <el-col :span="4" :offset="1">
          <el-select v-model="classValue" placeholder="请选择班级">
            <el-option
              v-for="item in classData"
              :key="item.value"
              :label="item.label"
              :value="item.value"
            >
            </el-option>
          </el-select>
        </el-col>
        <el-col :span="4">
          <el-select v-model="regionValue" placeholder="请选择区域">
            <el-option
              v-for="item in regionData"
              :key="item.value"
              :label="item.label"
              :value="item.value"
            >
            </el-option>
          </el-select>
        </el-col>
        <el-col :span="6" :offset="3">
          <el-button type="primary" icon="el-icon-search" @click="handelSearch"
            >搜索</el-button
          >
          <el-button type="info" icon="el-icon-delete" @click="handelReset"
            >重置</el-button
          ></el-col
        >
      </el-row>
    </el-header>
    <el-main>
      <el-table :data="tableData" border style="width: 100%">
        <el-table-column prop="time" label="时间" width="180">
        </el-table-column>
        <el-table-column prop="area_name" label="区域" width="180">
        </el-table-column>
        <el-table-column prop="class_name" label="班级"> </el-table-column>
        <el-table-column label="情况">
          <template #default="scope">
            <span v-if="scope.row.status == 0">未检查</span>
            <span v-else-if="scope.row.status == 1">优</span>
            <span v-else-if="scope.row.status == 2">良</span>
            <span v-else-if="scope.row.status == 3">差</span>
          </template>
        </el-table-column>

        <el-table-column prop="principal_name" label="负责人">
        </el-table-column>
        <el-table-column label="操作"> 修改 </el-table-column>
      </el-table>
    </el-main>
  </el-container>
</template>

<script>
import axios from "axios";
import { ElMessage } from "element-plus";
export default {
  data() {
    return {
      time: "",
      classData: [
        {
          value: "1",
          label: "2019级全栈1212",
        },
        {
          value: "2",
          label: "19级Java",
        },
        {
          value: "3",
          label: "19级python",
        },
        {
          value: "4",
          label: "19级数媒",
        },
        {
          value: "5",
          label: "20级全栈Python",
        },
        {
          value: "6",
          label: "20级Java",
        },
        {
          value: "7",
          label: "20级数媒",
        },
      ],
      regionData: [
        {
          value: "1",
          label: "足球场",
        },
        {
          value: "2",
          label: "风雨操场",
        },
        {
          value: "3",
          label: "篮球场",
        },
        {
          value: "4",
          label: "教学楼A区",
        },
        {
          value: "5",
          label: "教学楼B区",
        },
      ],
      classValue: "",
      regionValue: "",
      tableData: [],
    };
  },
  created() {
    this.handeltableData();
  },
  methods: {
    handelSearch() {
      this.handeltableData();
    },
    aaa() {
      this.time = this.time.toLocaleDateString().replaceAll("/", "-");
    },
    handelReset() {
      this.time = "";
      this.classValue = "";
      this.regionValue = "";
      ElMessage.success({
        message: "重置成功",
        type: "success",
      });
    },
    handeltableData() {
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
          console.log(res.data.data);
        }
      });
    },
  },
};
</script>

<style>
.top {
  margin-top: 20px;
}
</style>