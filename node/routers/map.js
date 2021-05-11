// 创建router
const express = require("express")
let router = express.Router()
// 引入mysql
let query = require('../utils/query')

// 1.获取地图信息
router.get("/", async (req, res) => {
  try {
    // 根据学校id，获取学校所有的map
    let res1 = await query("SELECT * FROM map where s_id = ?",[req.query.id])
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

// 添加地图



module.exports = router;