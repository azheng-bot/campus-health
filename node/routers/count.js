// 创建router
const express = require("express")
let router = express.Router()
// 引入mysql
let query = require('../utils/query')

// 1.获取统计信息
router.get("/", async (req, res) => {
  // 总体卫生情况
  let allClassStatus = await getAllStatus()
  // 班级卫生优率、差率
  let statusByRate = await getRate(allClassStatus)
  // 负责人出勤情况
  let principalStatus = await getPrincipalStatus()
  // 总体优良差
  let totalStatus = await acountTotalStatus()

  res.json({
    code: 200,
    data: {
      allClassStatus,
      principalStatus,
      statusByGoodRate: statusByRate.statusByGoodRate,
      statusByBadRate: statusByRate.statusByBadRate,
      totalStatus
    }
  })
})
// 1.1 总体卫生情况
async function getAllStatus() {
  // 获取所有情况和所有班级
  let allStatus = await query("SELECT * FROM STATUS")
  let allClass = await query("SELECT *FROM CLASS")
  // 给每个班级添加上其各自的优、良、差的个数
  allClass.forEach(item => {
    item.no_checked = 0;
    item.good = 0;
    item.normal = 0;
    item.bad = 0;
    item.total = 0;
  })
  // 在所有情况中根据id获取到当前班级的所有情况
  allStatus.forEach(item => {
    let currentClass = allClass.find(item2 => item2.id == item.class_id)
    // 如果没有找到该班级，返回空值
    if (!currentClass) return false;
    currentClass.total++;
    if (item.status == 0) {
      currentClass.no_checked++
    } else if (item.status == 1) {
      currentClass.good++
    } else if (item.status == 2) {
      currentClass.normal++
    } else if (item.status == 3) {
      currentClass.bad++
    }
  })
  return allClass
}

// 1.2 班级卫生优率、差率
async function getRate(allClassStatus) {
  // 返回对象
  let returnObj = {}
  allClassStatus.forEach(item => {
    // 默认值
    item.good_rate = 0;
    item.bad_rate = 0
    // 如果有卫生情况total，则计算优率、差率
    if (item.total != 0) {
      // 计算优率、差率
      item.good_rate = Math.floor(item.good / item.total * 100)
      item.bad_rate = Math.floor(item.bad / item.total * 100)
    }
  })
  // 根据优率排序
  let statusByGoodRate = allClassStatus.sort((a, b) => { return b.good_rate - a.good_rate })
  returnObj.statusByGoodRate = statusByGoodRate.slice(0, 5)
  // 根据差率排序
  let statusByBadRate = allClassStatus.sort((a, b) => { return b.bad_rate - a.bad_rate })
  returnObj.statusByBadRate = statusByBadRate.slice(0, 5)

  // 返回
  return returnObj
}

// 1.3 负责人出勤情况
async function getPrincipalStatus() {
  // 获取所有情况和所有负责人
  let allStatus = await query("SELECT * FROM STATUS")
  let allPrincipal = await query("SELECT *FROM PRINCIPAL")
  // 给每一个负责人添加初始默认值
  allPrincipal.forEach(item => {
    item.total_status = 0;
    item.checked_status = 0;
    item.no_checked_status = 0;
  })
  // 遍历所有卫生情况，根据具体情况给负责人添加统计值
  allStatus.forEach(item => {
    let currentPrincipal = allPrincipal.find(item2 => item2.id == item.principal_id)
    currentPrincipal.total_status++
    // 如果具体情况不是“未检查”，则就是已完成
    if (item.status != 0) {
      currentPrincipal.checked_status++
    } else {
      currentPrincipal.no_checked_status++

    }
  })
  return allPrincipal.sort((a, b) => { return b.total_status - a.total_status })
}

// 1.4 总体优良差
async function acountTotalStatus() {
  let allStatus = await query("SELECT * FROM STATUS")
  // 返回对象
  let returnObj = {
    total_good: 0,
    total_normal: 0,
    total_bad: 0,
    total_no_checked:0
  }
  allStatus.forEach(item => {
    console.log('item', item)
    if (item.status == 0) {
      returnObj.total_no_checked++
    } else if (item.status == 1) {
      returnObj.total_good++
    } else if (item.status == 2) {
      returnObj.total_normal++
    } else if (item.status == 3) {
      returnObj.total_bad++
    }
  })

  // 返回
  return returnObj
}

module.exports = router;