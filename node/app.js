const express = require("express")
// 创建app
let app = express()

// 调用路由
// 首页路由
let indexRoter = require("./routers/index")
app.use("/index",indexRoter)

// 挂载
app.listen(3000,() => {
  console.log("http://127.0.0.1:3000")
})