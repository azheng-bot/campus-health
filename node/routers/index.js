
// 创建router
const express = require("express")
let router = express.Router()
// 引入mysql
let mysql = require("../mysql/index")

router.get("/", (req, res) => {

  mysql.query("select * from area", (error, result) => {
    console.log('res', result)
    console.log('err', error)
    res.send({
      code: 200, 
      data: {
        area: result
      }
    })
  })
})

module.exports = router;