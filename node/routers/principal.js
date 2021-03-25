// 创建router
const express = require("express")
let router = express.Router()
// 引入mysql
let query = require('../utils/query')

// 1.获取负责人
router.get("/", async (req, res) => {
  try {
    // 执行添加语句
    let res1 = await query("SELECT * FROM USER")

    // 删除查询结果中的admin超级管理员
    let index = res1.findIndex(item => item.username == "admin")
    res1.splice(index, 1)

    // 把username改成principal_name
    // 把password删除
    res1.forEach(item => {
      item.principal_name = item.username
      delete item.username
      delete item.password
    })

    // 返回成功信息
    res.send({
      code: 200,
      data: res1
    })
  } catch {
    // 出现报错时，返回失败信息
    res.send({
      code: 400,
      msg: "获取失败"
    })

  }
})

// 2.获取负责人（用户名&密码）
router.get("/user", async (req, res) => {
  try {
    // 执行添加语句
    let res1 = await query("SELECT * FROM USER")

    // 删除查询结果中的admin超级管理员
    let index = res1.findIndex(item => item.username == "admin")
    res1.splice(index, 1)

    // 把username改成principal_name
    res1.forEach(item => {
      item.principal_name = item.username
      delete item.username
    })

    // 返回成功信息
    res.send({
      code: 200,
      data: res1
    })
  } catch {
    // 出现报错时，返回失败信息
    res.send({
      code: 400,
      msg: "获取失败"
    })

  }
})


// 3.添加负责人
router.post("/", async (req, res) => {
  try {
    // 执行添加语句
    let res2 = await query("insert into USER (username,password,role) values(?)", [[req.body.principal_name, req.body.password, "principal"]]).catch(err => console.log('err1', err)
    )
    // 返回成功信息
    res.send({
      code: 200,
      msg: "添加成功"
    })
  } catch {
    // 出现报错时，返回失败信息
    res.send({
      code: 400,
      msg: "添加失败"
    })
  }
})

// 4.删除负责人
router.delete("/", async (req, res) => {
  try {
    // 执行添加语句
    let res1 = await query("delete from USER where id = ?", [req.query.id])
    // 返回成功信息
    res.send({
      code: 200,
      msg: "删除成功"
    })
  } catch {
    // 出现报错时，返回失败信息
    res.send({
      code: 400,
      msg: "删除失败"
    })

  }
})

// 5.修改负责人
router.patch("/", async (req, res) => {
  try {
    // 执行添加语句
    let res1 = await query("update USER set USERNAME = ?, PASSWORD = ? where id = ?", [req.body.principal_name,req.body.password, req.body.id]).catch(err => console.log(`err`, err))
    // 返回成功信息
    res.send({
      code: 200,
      msg: "修改成功"
    })
  } catch {
    // 出现报错时，返回失败信息
    res.send({
      code: 400,
      msg: "修改失败"
    })

  }
})



module.exports = router;