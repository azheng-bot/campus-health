const path = require("path")
const fs = require('fs')
// 创建router
const express = require("express")
let router = express.Router()
// multer
const multer = require("multer")
let uploader = multer({
  dest: path.join(path.dirname(__dirname), 'public', 'images')
})

// 引入mysql
let query = require('../utils/query')


// 1.获取学校
router.get("/", async (req, res) => {
  console.log(`req.query1`, req.query)
  // 执行添加语句
  let res1 = await query("SELECT * FROM school where id = ?", [req.query.id])

  console.log(`res1`, res1)
  // 返回成功信息
  res.send({
    code: 200,
    data: res1[0]
  })
})

// 2.修改学校信息
router.patch("/", async (req, res) => {
  console.log(`req.body`, req.body)
  // 执行添加语句
  let res1 = await query("update school set name = ?, logo = ? where id = ?", [req.body.name, req.body.logo, req.body.id]).catch(err => console.log(`err`, err))
  // 返回成功信息
  res.send({
    code: 200,
    msg: "修改成功"
  })
})

// 3.上传logo图片
router.post("/logo", uploader.single("logo"), async (req, res) => {
  console.log(`req.file`, req.file)
  let file = req.file;
  //获取后缀名
  const extname = path.extname(file.originalname)
  //获取上传成功之后的文件路径
  const filepath = file.path
  //上传之后文件的名称
  const filename = file.filename + extname

  //重命名，借用fs的rename重命名的方法，第一参数是源文件地址路径，第二个参数是将源文件改名后的地址(和参数一地址相同，只不过名字变了而已，两个参数都是地址)
  fs.rename(filepath, path.join(path.dirname(filepath), filename), err => {
    if (err) return console.log(`err`, err)
    res.json({
      code: 200,
      imageUrl: "http://localhost:3000/school/logo?imageUrl=" + file.filename + extname
    })
  })

})

// 4.返回学校logo
router.get("/logo", async (req, res) => {
  try {
    console.log(`req.params`, req.query)
    // 找到图片
    res.sendFile(path.join(__dirname, '../', 'public', 'images', req.query.imageUrl))

  } catch {
    // 出现报错时，返回失败信息
    res.send({
      code: 400,
      msg: "ERROR"
    })
  }
})



module.exports = router;