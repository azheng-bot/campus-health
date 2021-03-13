// 创建router
const express = require("express")
let router = express.Router()
// 引入mysql
let query = require('../utils/query')

// 1.获取负责人
router.get("/", async (req, res) => {
  try {
    // 执行添加语句
    let res1 = await query("SELECT * FROM PRINCIPAL")
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


// 2.添加负责人
router.post("/", async (req, res) => {
  try {
    // 执行添加语句
    let res1 = await query("insert into PRINCIPAL (principal_name) values(?)", [req.body.principal_name])
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

// 3.删除负责人
router.delete("/", async (req, res) => {
  try {
    // 执行添加语句
    let res1 = await query("delete from PRINCIPAL where id = ?", [req.query.id])
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

// 4.修改负责人
router.patch("/", async (req, res) => {
  console.log('req.body', req.query)
  try {
    // 执行添加语句
    let res1 = await query("update PRINCIPAL set principal_name = ? where id = ?", [req.body.principal_name, req.body.id])
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