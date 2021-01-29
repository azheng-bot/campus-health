// 引入数据库
const db = require('../db/index')

// 请求函数
let query = (queryStr, params) => {
  // Promise
  return new Promise(function (resolve, reject) {
    // 发起请求
    db.query(queryStr, params || [], function (err, result) {
      console.log('queryStr', queryStr)
      // reject返回报错
      if (err) reject(new Error(err))
      // resolve返回数据
      resolve(result)
    })
  })
}

module.exports = query