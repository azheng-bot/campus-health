const express = require("express")
const jwt = require("jsonwebtoken")
const query = require("./utils/query")
// 0.创建app
let app = express()
let bodyParser = require("body-parser")
app.use(bodyParser.json())
app.use(bodyParser.urlencoded({ extended: false }))




// 1.创建路由拦截器
app.use(async (req, res, next) => {
  // 以下情况可以直接放行
  // 登录
  if (req.url.match("/login")) return next()
  // 获取侧边栏信息
  if (req.url.match("/aside")) return next()
  // 获取首页卫生情况
  if (req.url.match("/status") && req.method == "GET") return next()
  // 如果没有令牌则返回没有令牌
  if (!req.get("Authorization")) return res.json({
    code: 400,
    message: "无效token"
  })

  // 否则判断token是否正确
  let token = req.get("Authorization").slice(7)
  let encode = jwt.decode(token, "just_do_it")
  let res1 = await query("select *from user where username =?", [encode])
  
  // 如果正确则放行
  if (res1.length > 0) {
    // 记录操作记录
    let url = req.url;
    let method = req.method;
    let username = res1[0].username;
    let user_id = res1[0].id;
    let time = new Date().toString();
    // 如果不是get方法则记录
    if (method != "GET") {
      await query("INSERT INTO OPERATION (URL,METHOD,USERNAME,USER_ID,TIME) VALUES (?)",[[url,method,username,user_id,time]]).catch(err => console.log('err', err))
    }

    return next()
    // 如果不正确则返回错误信息
  } else {
    return res.json({
      code: 400,
      message: "无效token"
    })
  }
})



// 2. 调用路由
// 2.1 登录路由
let loginRouter = require("./routers/login")
app.use("/login", loginRouter)
// 2.2 侧边栏路由
let asideRouter = require("./routers/aside")
app.use('/aside', asideRouter)
// 2.2 卫生情况路由
let statusRouter = require("./routers/status")
app.use("/status", statusRouter)
// 2.3 统计路由
let countRouter = require("./routers/count")
app.use("/count", countRouter)
// 2.4 班级管理路由
let classRouter = require("./routers/class")
app.use("/class", classRouter)
// 2.5 负责人管理路由
let principalRouter = require("./routers/principal")
app.use("/principal", principalRouter)
// 2.6 获取区域信息路由
let areaRouter = require("./routers/area")
app.use("/area", areaRouter)
// 2.7 获取操作记录信息路由
let operationRouter = require("./routers/operation")
app.use("/operation", operationRouter)

// 3. 挂载
app.listen(3000, () => {
  console.log("http://127.0.0.1:3000")
})