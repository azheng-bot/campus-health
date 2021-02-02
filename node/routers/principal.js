// 创建router
const express = require("express")
let router = express.Router()
// 引入mysql
let query = require('../utils/query')
// 引入jwt
let jwt = require("jsonwebtoken")

// 1.添加负责人
router.post("/", async (req, res) => {
})

module.exports = router;