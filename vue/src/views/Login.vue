<template>
  <div class="login">
    <el-container>
      <el-header class="loginTitle">
        <div>
          校园卫生分派可视化系统 <br />
          <span> Visualization System for Campus Health Distribution </span>
        </div>
      </el-header>
      <el-main class="loginForm">
        <el-form
          :model="ruleForm"
          status-icon
          :rules="rules"
          ref="ruleForm"
          label-width="100px"
        >
          <el-form-item label="账号" prop="username">
            <el-input v-model="ruleForm.username"></el-input>
          </el-form-item>
          <el-form-item label="密码" prop="password">
            <el-input
              type="password"
              v-model="ruleForm.password"
              autocomplete="off"
            ></el-input>
          </el-form-item>

          <el-form-item>
            <el-button type="primary" @click="submitForm('ruleForm')"
              >登录</el-button
            >
            <el-button @click="resetForm('ruleForm')" class="resetButton"
              >重置</el-button
            >
          </el-form-item>
        </el-form>
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
      ruleForm: {
        username: "",
        password: "",
      },
      rules: {
        username: [
          { required: true, message: "账号不能为空", trigger: "blur" },
        ],
        password: [
          { required: true, message: "密码不能为空", trigger: "blur" },
        ],
      },
    };
  },
  methods: {
    submitForm(formName) {
      let _this = this;
      this.$refs[formName].validate((valid) => {
        if (valid) {
          axios
            .post("/api/login", this.ruleForm)
            .then(function (response) {
              window.sessionStorage.setItem("token", response.data.token);
              if (response.data.code == 200) {
                ElMessage.success({
                  message: "登录成功",
                  type: "success",
                });
                _this.$router.push("/index");
                _this.$store.commit("setAuthorData",response.data.data)
              } else {
                ElMessage.error(response.data.message);
              }
            })
            .catch(function (error) {
              console.log(error);
            });
        } else {
          console.log("error submit!!");
          return false;
        }
      });
    },
    resetForm(formName) {
      this.$refs[formName].resetFields();
    },
  },
};
</script>

<style scoped>
.login {
  width: 100%;
  height: 100%;
  background-image: url("../assets/bg.svg");
}
.loginForm {
  width: 500px;
  margin: 100px auto;
}
.loginTitle {
  text-align: center;
  font-size: 30px;
  margin-top: 100px;
}
.loginTitle div {
  padding-left: 100px;
}
.loginTitle div span {
  font-size: 24px;
}
.resetButton {
  float: right;
}
</style>