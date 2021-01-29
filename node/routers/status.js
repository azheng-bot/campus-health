// 创建router
const express = require("express")
let router = express.Router()
// 引入mysql
let query = require('../utils/query')

// 1.获取卫生情况
router.get("/",async (req, res) => {
  console.log('req.params', req.params)

  res.send({
    code: 200,    
    data: {
      area: 1
    }
  })

})

module.exports = router;