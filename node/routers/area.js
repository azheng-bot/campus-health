// 创建router
const express = require("express")
let router = express.Router()
// 引入mysql
let query = require('../utils/query')

// 1.获取区域信息
router.get("/", async (req, res) => {
  try {
    // 执行添加语句
    let res1 = await query("SELECT * FROM AREA")
    console.log('res1', res1)
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


module.exports = router;