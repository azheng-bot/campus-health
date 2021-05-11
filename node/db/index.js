const mysql = require("mysql")
module.exports = mysql.createConnection({
  host: "localhost",
  port: 3306,
  user: "root",
  password: "root",
  multipleStatements: true,
  database: "campus_health",
})
