const express = require("express")
// 创建app
let app = express()


// 挂载
app.listen(3000,() => {
  console.log("http://127.0.0.1:3000")
})