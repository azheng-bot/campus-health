const mysql = require("mysql")
module.exports = mysql.createConnection({
  host: "http://121.36.32.228",
  port: 3306,
  user: "campus_health",
  password: "22Sj8KKrb43Rn2nC",
  multipleStatements: true,
  database: "campus_health",
})
