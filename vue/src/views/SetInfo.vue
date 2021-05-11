<template>
  <div class="set-info">
    <div class="title">基础设置</div>
    <div class="main">
      <div class="set-name clear">
        <div class="label">校名:</div>
        <div class="input">
          <el-input v-model="school_name" placeholder="请输入内容"></el-input>
        </div>
      </div>
      <div class="set-logo clear">
        <div class="label">logo:</div>
        <div class="input">
          <el-upload
            class="avatar-uploader"
            action="/api/school/logo"
            :show-file-list="false"
            :on-success="handleAvatarSuccess"
            :before-upload="beforeAvatarUpload"
            name="logo"
          >
            <img v-if="imageUrl" :src="imageUrl" class="avatar" />
            <i v-else class="el-icon-plus avatar-uploader-icon"></i>
          </el-upload>
          <span style="color:#aaa;font-size:14px">(建议使用png格式图片)</span>
        </div>
      </div>
      <div class="btn">
        <el-button @click="handleSubmit">确定修改</el-button>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      imageUrl: "",
      school_name: "",
      school_logo: "",
      school_id: "",
    };
  },
  async created() {
    let res = await this.$axios.get("/api/school", { params: { id: 1 } });
    console.log(`res`, res);
    this.school_name = res.data.data.name;
    this.school_logo = res.data.data.logo;
    this.school_id = res.data.data.id;
  },
  methods: {
    handleAvatarSuccess(res, file) {
      console.log(`res`, res);
      this.imageUrl = URL.createObjectURL(file.raw);
      this.school_logo = res.imageUrl;
    },
    beforeAvatarUpload(file) {
      // const isJPG = file.type === "image/jpeg";
      const isLt2M = file.size / 1024 / 1024 < 2;

      // if (!isJPG) {
      //   this.$message.error("上传头像图片只能是 JPG 格式!");
      // }
      if (!isLt2M) {
        this.$message.error("上传头像图片大小不能超过 2MB!");
      }
      // return isJPG && isLt2M;
      return   isLt2M;
    },
    async handleSubmit() {
      console.log(`school`, this.school_name, this.school_logo, this.school_id);
      let res = await this.$axios.patch("/api/school", {
        id: this.school_id,
        name: this.school_name,
        logo: this.school_logo,
      });
      if (res.data.code == 200) {
        this.$store.commit("setSchoolData", {
          id: this.school_id,
          name: this.school_name,
          logo: this.school_logo,
        });
        this.$message.success("修改成功")
      }
    },
  },
};
</script>

<style scoped>
.set-info {
  height: 100%;
}
.set-info .title {
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
.set-info .title::after {
  content: "";
  display: block;
  width: 6px;
  height: 22px;
  background-color: #2e81e1;
  position: absolute;
  top: 6px;
  left: 0px;
}
.set-info .main {
  margin: 20px;
  margin-top: 25px;
  margin-bottom: 0px;
  height: calc(100% - 120px);
  padding: 20px;
  box-sizing: border-box;

  border-radius: 4px;
  border: 1px solid #ebeef5;
  background-color: #fff;
  box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1);
}
.set-name,
.set-logo {
  margin-bottom: 30px;
  margin-top: 10px;
}
.set-name .label,
.set-logo .label {
  font-size: 20px;
  float: left;
  margin-right: 15px;
}
.set-name .input,
.set-logo .input {
  float: left;
}

</style>
<style >
  
.avatar-uploader .el-upload {
  border: 1px dashed #d9d9d9;
  border-radius: 6px;
  cursor: pointer;
  position: relative;
  overflow: hidden;
}
.avatar-uploader .el-upload:hover {
  border-color: #409eff;
}
.avatar-uploader-icon {
  font-size: 28px;
  color: #8c939d;
  width: 178px;
  height: 178px;
  line-height: 178px;
  text-align: center;
}
.avatar {
  width: 178px;
  height: 178px;
  display: block;
}
</style>