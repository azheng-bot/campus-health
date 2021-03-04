<template>
  <el-container>
    <el-header>
      <el-button type="primary" style="margin-top: 20px" @click="openClass"
        >添加班级</el-button
      >
      <el-dialog title="添加" v-model="dialogVisible" width="30%" @close="guan">
        <el-form
          :model="numberValidateForm"
          ref="numberValidateForm"
          label-width="80px"
          class="demo-ruleForm"
        >
          <el-form-item
            label="班级"
            prop="class"
            :rules="[{ required: true, message: '班级名不能为空' }]"
          >
            <el-input
              type="class"
              v-model="numberValidateForm.class"
            ></el-input>
          </el-form-item>
        </el-form>
        <template #footer>
          <span class="dialog-footer">
            <el-button @click="dialogVisible = false">取 消</el-button>
            <el-button type="primary" @click="submitForm('numberValidateForm')"
              >确 定</el-button
            >
          </span>
        </template>
      </el-dialog>
    </el-header>
    <el-main>
      <el-table :data="principalData" style="width: 100%" border>
        <!-- <el-table-column prop="date" label="日期" width="180">
        </el-table-column> -->
        <el-table-column type="index"> </el-table-column>
        <el-table-column prop="class_name" label="班级" align="center">
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
    <el-dialog title="编辑" v-model="editVisible" width="30%" @close="editGuan">
      <el-form
        :model="edit"
        ref="edit"
        label-width="80px"
        class="demo-ruleForm"
      >
        <el-form-item
          label="班级"
          prop="class"
          :rules="[{ required: true, message: '班级名不能为空' }]"
        >
          <el-input type="class" v-model="edit.class"></el-input>
        </el-form-item>
      </el-form>
      <template #footer>
        <span class="dialog-footer">
          <el-button @click="editVisible = false">取 消</el-button>
          <el-button type="primary" @click="editForm('edit')">确 定</el-button>
        </span>
      </template>
    </el-dialog>
  </el-container>
</template>

<script>
import axios from "axios";
import { ElMessage } from "element-plus";
export default {
  data() {
    return {
      principalData: [],
      dialogVisible: false,
      editVisible: false,
      edit: {
        class: "",
      },
      numberValidateForm: {
        class: "",
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
        url: "/api/class",
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
    openClass() {
      this.dialogVisible = true;
    },
    guan() {
      this.numberValidateForm.class = "";
    },

    submitForm(formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          axios({
            method: "post",
            url: "/api/class",
            data: {
              class_name: this.numberValidateForm.class,
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
                  class: "",
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
        url: "/api/class?" + `id=${id.id}`,
        headers: {
          Authorization: window.sessionStorage.getItem("token"),
        },
      }).then((res) => {
        if (res.data.code == 200) {
          console.log(res);
          this.getPrincipal();
        }
      });
    },
    handleEdit(row) {
      this.editVisible = true;
      this.id = row.id;
    },
    editGuan() {
      this.edit.class = "";
    },
    editForm(formName) {
      //   console.log(this.id);

      this.$refs[formName].validate((valid) => {
        if (valid) {
          axios({
            method: "patch",
            url: "/api/class",
            headers: {
              Authorization: window.sessionStorage.getItem("token"),
            },
            data: {
              id: this.id,
              class_name: this.edit.class,
            },
          })
            .then((res) => {
              if (res.data.code == 200) {
                // console.log(res);
                this.getPrincipal();
                this.editVisible = false;
                this.edit.class = "";
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
</style>