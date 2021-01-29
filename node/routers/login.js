// 创建router
const express = require("express")
let router = express.Router()
// 引入mysql
let query = require('../utils/query')
// 引入jwt
let jwt = require("jsonwebtoken")

// 1.登录
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
    // 生成token
    let token ="Bearer "+ jwt.sign(username,"just_do_it")

    let decode = jwt.decode(token,"just_do_it")
    console.log('decode', decode)

    return res.send({
      code: 200,
      token
    })
    // 若没有则返回失败信息
  } else {
    res.send({
      code: 400,
      message: "用户名或密码错误"
    })
  }
})

module.exports = router;