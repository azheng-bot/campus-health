// 创建router
const express = require("express")
let router = express.Router()
// 引入mysql
let query = require('../utils/query')
// 引入jwt
let jwt = require("jsonwebtoken")

// 1.获取侧边栏
router.get("/", async (req, res) => {
  // 如果没有登录信息，则认定为游客，返回空信息
  if (!req.get("Authorization")) {
    return res.send({
      code: 201,
      data: {}
    })
  }

  // 如果有token信息，则判定是否正确
  let token = req.get("Authorization").slice(7)
  let encode = jwt.decode(token, "just_do_it")
  let res1 = await query("select *from user where username =?", [encode])

  // 如果不正确则认定为游客，返回空信息
  if (res1.length <= 0) {
    return res.json({
      code: 201,
      msg: "登录已失效，请重新登录",
      data: {}
    })
  }

  // 如果正确则判断其权限,根据不同权限返回不同信息
  else {
    // 如果是管理员admin
    if (res1[0].role == "admin") {
      return res.send({
        code: 200,
        data: [
          { id: "1", name: "首页", url: "/index" },
          { id: "3", name: "卫生情况", url: "/status" },
          { id: "4", name: "统计分析", url: "/count" },
          {
            id: "5", name: "人员管理", children: [
              { id: "6", name: "负责人", url: "/principal" },
              { id: "7", name: "班级", url: "/class" }
            ]
          },
          { id: "8", name: "操作记录", url: "/operation" },

        ]
      })
    }
    // 如果是负责人principal
    if (res1[0].role == "principal") {
      return res.send({
        code: 200,
        data: [
          { id: "1", name: "首页", url: "/index" },
          { id: "2", name: "卫生分派", url: "/assign" },
          { id: "3", name: "卫生情况", url: "/status" },
          // { id: "4", name: "统计分析", url: "/count" },
        ]
      })
    }
  }


})

module.exports = router;