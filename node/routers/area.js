// 创建router
const express = require("express")
let router = express.Router()
// 引入mysql
let query = require('../utils/query')

// 1.获取区域信息
router.get("/", async (req, res) => {
  console.log(`req.query`, req.query)
  try {
    // 执行添加语句
    if (req.query.m_id) {
      let res1 = await query("SELECT * FROM area where m_id = ?", req.query.m_id)
      // 返回成功信息
      res.send({
        code: 200,
        data: res1
      })
    }
    else if (req.query.s_id) {
      let res1 = await query("SELECT id,name FROM map where s_id = ?", req.query.s_id)
      let res2 = await query("SELECT id,area_name as name,m_id FROM area where m_id in (select id from map where s_id = ?)", req.query.s_id)
      console.log(`res1`, res1)
      console.log(`res2`, res2)

      res1.forEach(mapItem => {
        mapItem.areaList = res2.filter(areaItem => areaItem.m_id == mapItem.id)
      })

      // 返回成功信息
      res.send({
        code: 200,
        data: res1
      })
    } else {
      res.send({
        code: 400,
        msg: "获取失败"
      })
    }
  } catch {
    // 出现报错时，返回失败信息
    res.send({
      code: 400,
      msg: "获取失败"
    })
  }
})



// 2.删除区域
router.delete("/", async (req, res) => {
  try {
    if (!req.query.id) {
      // 返回失败信息
      return res.send({
        code: 400,
        msg: "缺失参数"
      })
    }
    let res1 = query("delete from area where id = " + req.query.id);
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


module.exports = router;