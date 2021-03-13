// 创建router
const express = require("express")
let router = express.Router()
// 引入mysql
let query = require('../utils/query')

// 1.获取班级
router.get("/", async (req, res) => {
  try {
    // 执行添加语句
    let res1 = await query("SELECT * FROM CLASS")
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


// 2.添加班级
router.post("/", async (req, res) => {
  try {
    // 执行添加语句
    let res1 = await query("insert into class (class_name) values(?)", [req.body.class_name])
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

// 3.删除班级
router.delete("/", async (req, res) => {
  try {
    // 执行添加语句
    let res1 = await query("delete from class where id = ?", [req.query.id])
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

// 4.修改班级
router.patch("/", async (req, res) => {
  try {
    // 执行添加语句
    let res1 = await query("update class set class_name = ? where id = ?", [req.body.class_name, req.body.id])
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