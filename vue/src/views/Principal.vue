<template>
  <div class="principal">
    <div class="title">负责人管理</div>
    <el-container>
      <el-header>
        <el-button
          type="primary"
          style="margin-top: 20px"
          @click="openPrincipal"
          >添加负责人</el-button
        >
        <el-dialog
          title="添加"
          v-model="dialogVisible"
          width="30%"
          @close="guan"
        >
          <el-form
            :model="numberValidateForm"
            ref="numberValidateForm"
            label-width="80px"
            principal="demo-ruleForm"
          >
            <el-form-item
              label="姓名"
              prop="principal_name"
              :rules="[{ required: true, message: '负责人名不能为空' }]"
            >
              <el-input
                type="principal"
                v-model="numberValidateForm.principal_name"
              ></el-input>
            </el-form-item>
            <el-form-item
              label="密码"
              prop="password"
              :rules="[{ required: true, message: '密码不能为空' }]"
            >
              <el-input
                type="principal"
                v-model="numberValidateForm.password"
              ></el-input>
            </el-form-item>
          </el-form>
          <template #footer>
            <span principal="dialog-footer">
              <el-button @click="dialogVisible = false">取 消</el-button>
              <el-button
                type="primary"
                @click="submitForm('numberValidateForm')"
                >确 定</el-button
              >
            </span>
          </template>
        </el-dialog>
      </el-header>
      <el-main>
        <el-table
          :data="principalData"
          style="width: 100%; box-shadow: rgba(0, 0, 0, 0.1) 0px 2px 12px 0px"
          border
        >
          <!-- <el-table-column prop="date" label="日期" width="180">
        </el-table-column> -->
          <el-table-column type="index"> </el-table-column>
          <el-table-column prop="principal_name" label="姓名" align="center">
          </el-table-column>
          <el-table-column prop="password" label="密码" align="center">
          </el-table-column>
          <el-table-column label="操作" align="center">
            <template #default="scope">
              <el-button size="mini" @click="handleEdit(scope.row)"
                >编辑</el-button
              >
              <el-popconfirm title="您确定要删除吗？" @confirm="del(scope.row)">
                <template #reference>
                  <el-button size="mini" type="danger">删除</el-button>
                </template>
              </el-popconfirm>
            </template>
          </el-table-column>
        </el-table>
      </el-main>
      <el-dialog
        title="编辑"
        v-model="editVisible"
        width="30%"
        @close="editGuan"
      >
        <el-form
          :model="edit"
          ref="edit"
          label-width="80px"
          class="demo-ruleForm"
        >
          <el-form-item
            label="负责人"
            prop="principal_name"
            :rules="[{ required: true, message: '负责人名不能为空' }]"
          >
            <el-input type="principal" v-model="edit.principal_name"></el-input>
          </el-form-item>
          <el-form-item
            label="密码"
            prop="password"
            :rules="[{ required: true, message: '密码不能为空' }]"
          >
            <el-input type="principal" v-model="edit.password"></el-input>
          </el-form-item>
        </el-form>
        <template #footer>
          <span class="dialog-footer">
            <el-button @click="editVisible = false">取 消</el-button>
            <el-button type="primary" @click="editForm('edit')"
              >确 定</el-button
            >
          </span>
        </template>
      </el-dialog>
    </el-container>
  </div>
</template>

<script>
import axios from "axios";
import { ElMessage } from "element-plus";
export default {
  data() {
    return {
      principalData: [],
      dialogVisible: false,
      numberValidateForm: {
        principal: "",
        password: "",
      },
      editVisible: false,
      edit: {
        id:0,
        principal: "",
        password: "",
      },
      id: "",
    };
  },
  created() {
    this.getPrincipal();
  },
  methods: {
    getPrincipal() {
      axios({
        method: "get",
        url: "/api/principal/user",
        headers: {
          Authorization: window.sessionStorage.getItem("token"),
        },
      }).then((res) => {
        if (res.data.code == 200) {
          this.principalData = res.data.data;
          console.log(res);
        }
      });
    },
    openPrincipal() {
      this.dialogVisible = true;
    },
    guan() {
      this.numberValidateForm.principal = "";
      this.numberValidateForm.password = "";
    },
    submitForm(formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          axios({
            method: "post",
            url: "/api/principal",
            data: {
              principal_name: this.numberValidateForm.principal_name,
              password: this.numberValidateForm.password,
            },
            headers: {
              Authorization: window.sessionStorage.getItem("token"),
            },
          })
            .then((res) => {
              if (res.data.code == 200) {
                console.log(res);
                ElMessage.success({
                  message: "添加成功",
                  type: "success",
                });
                this.numberValidateForm = {
                  principal: "",
                };
                this.dialogVisible = false;
                this.getPrincipal();
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
    del(id) {
      //   console.log(id);
      axios({
        method: "delete",
        url: "/api/principal?" + `id=${id.id}`,
        headers: {
          Authorization: window.sessionStorage.getItem("token"),
        },
      }).then((res) => {
        if (res.data.code == 200) {
          this.getPrincipal();
          this.$message.success("删除成功")
        }
      });
    },
    handleEdit(row) {
      this.editVisible = true;
      this.edit.id = row.id;
      this.edit.principal_name = row.principal_name;
      this.edit.password = row.password;
    },
    editGuan() {
      this.edit.principal = "";
      this.edit.password = "";
    },
    editForm(formName) {
      //   console.log(this.id);

      this.$refs[formName].validate((valid) => {
        if (valid) {
          axios({
            method: "patch",
            url: "/api/principal",
            headers: {
              Authorization: window.sessionStorage.getItem("token"),
            },
            data: {
              id: this.edit.id,
              principal_name: this.edit.principal_name,
              password: this.edit.password,
            },
          })
            .then((res) => {
              if (res.data.code == 200) {
                
                this.getPrincipal();
                this.$message.success("修改成功")
                this.editVisible = false;
                this.edit.principal = "";
                this.edit.password = "";
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
.principal .title {
  font-size: 24px;
  font-weight: 500;
  line-height: 30px;
  padding-left: 17px;
  box-sizing: border-box;
  margin: 28px 0px;
  margin-left: 20px;
  margin-bottom: 3px;
  position: relative;
}
.principal .title::after {
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