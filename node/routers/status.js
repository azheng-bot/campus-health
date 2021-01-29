// 创建router
const express = require("express")
let router = express.Router()
// 引入mysql
let query = require('../utils/query')

// 1.获取卫生情况
router.get("/", async (req, res) => {
  console.log('req.params', req.query)
  let { time, area_id } = req.query

  let res1 = await query("SELECT * FROM STATUS WHERE TIME = ? AND AREA_ID = ?", [time, area_id])
  res.send({
    code: 200,
    data: res1[0]
  })

})

// 2.添加卫生情况
router.post("/", async (req, res) => {
  let { class_id, class_name, area_id, area_name, principal_id, principal_name, time, status } = req.body;

  // 判断是否重复添加
  let res1 = await query(`SELECT * FROM STATUS WHERE TIME = ('${time}') AND AREA_ID = ('${area_id}')`)
  console.log('res1', res1)
  // 如果重复添加则返回错误信息
  if (res1.length > 0) {
    return res.send({
      code: 400,
      msg: `${time} ${area_name} 区域的卫生情况重复添加`
    })
  }


  // 添加数据到数据库
  // mysql查询语句参数名
  let params_name = ['class_id', 'class_name', 'area_id', 'area_name', 'principal_id', 'principal_name', 'time', 'status']
  // mysql查询语句参数值
  let params_value = [class_id, class_name, area_id, area_name, principal_id, principal_name, time, status]
  // 为了能够正确添加到mysql数据库数据，给每个数据添加双引号
  params_value.forEach((item, index) => {
    params_value[index] = '"' + item + '"'
  })
  // 添加
  let res2 = await query(`INSERT INTO STATUS (${params_name}) VALUES (${params_value})`)
  console.log('res2', res2)
  res.send({
    code: 200,
    msg: "分派成功"
  })

})

module.exports = router;