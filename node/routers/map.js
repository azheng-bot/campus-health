// 创建router
const express = require("express")
let router = express.Router()
// 引入mysql
let query = require('../utils/query')
// 引入雪花算法
const snowId = require("../utils/snowflake")

// 1.获取某一学校里的所有地图
router.get("/", async (req, res) => {
  try {
    // 根据学校id，获取学校所有的map
    let res1 = await query("SELECT * FROM map where s_id = ?", [req.query.s_id])
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

// 2.获取某一地图的区域信息
router.get("/areas", async (req, res) => {
  console.log(`req.query`, req.query)
  let res1 = await query("select * from map where id = ?", [req.query.id]);
  let res2 = await query("select * from area where m_id = ?", [req.query.id]);
  console.log(`res1`, res1)
  console.log(`res2`, res2)

  res.json({
    code: 200,
    data: {
      name: res1[0].name,
      areaList: res2
    }
  })
})

// 3.添加地图
router.post("/", async (req, res) => {
  try {
    if (!req.body.name || !req.body.s_id || !req.body.areaList) {
      return res.send({
        code: 401,
        msg: "信息未填写完全"
      })
    }

    let name = req.body.name;
    let areaList = req.body.areaList;
    let s_id = req.body.s_id;


    // 添加map
    let m_id = snowId();
    let res1 = await query("insert into map (id,name,s_id) values (?,?,?)", [m_id, name, s_id]);
    console.log(`res1`, res1)
    // 添加area
    for (var i = 0; i < areaList.length; i++) {
      let { area_name, width, height, left, top, color, shape } = areaList[i];
      let res2 = await query("insert into area (area_name,m_id ,width, height, `left`, top, color,shape) values (?)", [[area_name, m_id, width, height, left, top, color, shape]])
      console.log(`res2`, res2)
    }

    res.json({
      code: 200,
      m_id
    })
  }
  catch (err) {
    console.log(`err`, err)
    res.json({
      code: 400,
      msg: "添加失败"
    })
  }
})

// 4.修改地图名
router.patch("/name", async (req, res) => {
  console.log(`req`, req.body)
  try {
    let res1 = await query("update map set name = ? where id = ?", [req.body.name, req.body.id])
    console.log(`res1`, res1)

    res.json({
      code: 200,
      msg: "修改成功"
    })
  } catch (err) {
    console.log(`err`, err)
    res.json({
      code: 400,
      msg: "修改失败"
    })
  }
})

// 5.修改地图区域
router.patch("/", async (req, res) => {
  try {
    console.log(`req`, req.body)
    let areaList = req.body.areaList;
    let m_id = req.body.id

    

    for (var i = 0; i < areaList.length; i++) {
      // 有id则对其进行修改
      if (areaList[i].id) {
        let { area_name, width, height, left, top, color, id } = areaList[i];
        let res1 = await query("update area set area_name = ?,width = ?,height = ?,`left` =?,top = ?,color =?,m_id = ? where id = ?", [area_name, width, height, left, top, color, m_id, id])
      }
      // 没有id则添加到数据库
      else {
        let { area_name, width, height, left, top, color } = req.body.areaList[i];
        let res1 = await query("insert into area (area_name, width, height, `left`, top, color,m_id) values(?)", [[area_name, width, height, left, top, color, m_id]]);
      }
    }

    res.json({
      code: 200,
      msg: "修改成功"
    })
  } catch (err) {
    console.log(`err`, err)
    res.json({
      code: 400,
      msg: "修改失败"
    })
  }

})

// 6.删除地图
router.delete("/", async (req, res) => {
  console.log(`req`, req.query)
  try {
    let res1 = await query("delete from map where id = ?", [req.query.id])
    console.log(`res1`, res1)

    res.json({
      code: 200,
      msg: "删除成功"
    })
  } catch (err) {
    console.log(`err`, err)
    res.json({
      code: 400,
      msg: "删除失败"
    })
  }
})





module.exports = router;