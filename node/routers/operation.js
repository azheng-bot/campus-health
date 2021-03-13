// 创建router
const express = require("express")
let router = express.Router()
// 引入mysql
let query = require('../utils/query')

// 1.获取操作记录信息
router.get("/", async (req, res) => {
  let { page_num, page_size } = req.query
  if (!page_num) page_num = 1;
  if (!page_size) page_size = 10;

  // 查询操作记录
  // 查询语句
  let sqlStr = "SELECT * FROM OPERATION ORDER BY ID DESC ";
  // 添加分页条件
  if (page_num && page_size) {
    page_num = Number(page_num)
    page_size = Number(page_size)
    sqlStr += ` LIMIT ${(page_num - 1) * page_size},${page_size}`
  }
  // 发起查询请求
  let res1 = await query(sqlStr)
  // 查询总数
  let res2 = await query("SELECT COUNT(*) AS TOTAL FROM OPERATION")
  // 返回正确信息
  res.send({
    code: 200,
    data: {
      operationData: res1,
      total: res2[0].TOTAL
    }
  })
})


module.exports = router;