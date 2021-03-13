// 创建router
const express = require("express")
let router = express.Router()
// 引入mysql
let query = require('../utils/query')
// 引入jwt
let jwt = require("jsonwebtoken")

// 1.根据账号密码登录
router.post("/", async (req, res) => {
  let username = req.body.username
  let password = req.body.password
  if (!username || !password) {
    res.send({
      code: 400,
      message: "用户名或密码错误"
    })
  }

  // 根据用户名和密码请求数据
  let res1 = await query("select * from user where username =? and password =?", [username, password])
  // 若有数据返回成功信息
  if (res1.length > 0) {
    let { username, role, id } = res1[0]
    // 生成token
    let token = "Bearer " + jwt.sign(username, "just_do_it")

    let decode = jwt.decode(token, "just_do_it")

    return res.send({
      code: 200,
      token,
      data: { username, role, id }
    })
    // 若没有则返回失败信息
  } else {
    res.send({
      code: 400,
      message: "用户名或密码错误"
    })
  }
})

// 2.根据token登录
router.get("/", async (req, res) => {
  // 否则判断token是否正确
  let token = req.query.token.slice(7);
  let encode = jwt.decode(token, "just_do_it")
  let res1 = await query("select * from user where username =?", [encode])

  // 若有数据返回成功信息
  if (res1) {
    let { username, role, id } = res1[0]
    return res.send({
      code: 200,
      data: { username, role, id }
    })
    // 若没有则返回失败信息
  } else {
    res.send({
      code: 400,
      message: "token错误,请重新登录"
    })
  }
})


module.exports = router;