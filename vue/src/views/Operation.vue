<template>
  <div class="operation">
    <div class="title">操作记录</div>
    <el-container>
      <el-main>
        <el-table
          :data="operationData"
          style="width: 100%; box-shadow: rgba(0, 0, 0, 0.1) 0px 2px 12px 0px"
          border
        >
          <!-- <el-table-column prop="date" label="日期" width="180">
        </el-table-column> -->
          <el-table-column width="40" center type="index"> </el-table-column>
          <el-table-column prop="username" label="操作人"> </el-table-column>
          <el-table-column prop="method" label="method"> </el-table-column>
          <el-table-column prop="url" label="url"> </el-table-column>
          <el-table-column prop="time" label="操作时间">
            <template #default="scope">
              {{ formatDate(scope.row.time) }}
            </template>
          </el-table-column>
        </el-table>
        <el-row style="margin-top: 20px">
          <el-pagination
            :current-page="page_num"
            :page-size="page_size"
            :page-sizes="[5, 10, 20, 50]"
            layout="total, sizes, prev, pager, next, jumper"
            :total="total"
            @size-change="handleSizeChange"
            @current-change="handleCurrentChange"
          >
          </el-pagination>
        </el-row>
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
      operationData: [],
      page_num: 1,
      page_size: 10,
      total: 0,
    };
  },
  async created() {
    await this.getOperaion();
  },
  methods: {
    async getOperaion() {
      await axios({
        method: "get",
        url: "/api/operation",
        params: {
          page_num: this.page_num,
          page_size: this.page_size,
        },
        headers: {
          Authorization: window.sessionStorage.getItem("token"),
        },
      })
        .then((res) => {
          if (res.data.code == 200) {
            this.operationData = res.data.data.operationData;
            this.total = res.data.data.total;
            console.log(res);
          }
        })
        .err((err) => console.log("err", err));
    },
    // 分页器发生改变时
    handleSizeChange(size) {
      this.page_size = size;
      this.getOperaion();
    },
    handleCurrentChange(num) {
      this.page_num = num || 1;
      this.getOperaion();
    },
    // 格式时间
    formatDate(time) {
      time = new Date(time);
      console.log(
        "object",
        time.getFullYear() +
          "-" +
          (time.getMonth() + 1) +
          "-" +
          time.getDate() +
          " " +
          time.getHours() +
          ":" +
          time.getMinutes() +
          ":" +
          time.getSeconds()
      );
      return (
        time.getFullYear() +
        "-" +
        (time.getMonth() + 1) +
        "-" +
        time.getDate() +
        " " +
        time.getHours() +
        ":" +
        time.getMinutes().toString().padStart(2, "0") +
        ":" +
        time.getSeconds().toString().padStart(2, "0")
      );
    },
  },
};
</script>

<style scoped>
.operation .title {
  font-size: 28px;
  font-weight: 500;
  line-height: 30px;
  padding-left: 17px;
  box-sizing: border-box;
  margin: 28px 0px;
  margin-left: 20px;
  margin-bottom: 5px;
  position: relative;
}
.operation .title::after {
  content: "";
  display: block;
  width: 6px;
  height: 22px;
  background-color: #2e81e1;
  position: absolute;
  top: 6px;
  left: 0px;
}
</style>