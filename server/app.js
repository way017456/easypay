const express = require("express");
const server = express();
server.listen(3000);
const cors = require("cors");
const bodyParser = require("body-parser");
const mysql = require("mysql");
const MD5 = require("md5");
server.use("/img", express.static("images"));

const pool = mysql.createPool({
  host: "127.0.0.1",
  user: "root",
  port: "3306",
  password: "",
  database: "easypay",
  connectionLimit: 20,
});
server.use(
  cors({
    origin: ["http://127.0.0.1:8080", "http://localhost:8080"],
  })
);

server.use(bodyParser.urlencoded({ extended: true }));

server.post("/login", (req, res) => {
  let value = req.body.phone;
  let password = MD5(req.body.password);
  console.log(password);
  let sql = "select * from user where value = ? and password = ?";
  pool.query(sql, [value, password], (err, result) => {
    if (err) throw err;
    console.log(result);
    if (result.length > 0) {
      res.send({ code: 1, result: result });
    } else {
      res.send({ code: 0 });
    }
  });
});

server.post("/register", (req, res) => {
  let phone = req.body.phone;
  let password = MD5(req.body.password);
  let sql = "select * from user where value = ?";
  pool.query(sql, [phone, password], (err, result) => {
    if (err) throw err;
    if (result.length > 0) {
      res.send({ code: 0 });
    } else {
      let sql = "insert into user set value = ?,password = ?";
      pool.query(sql, [phone, password], (err, result) => {
        if (err) throw err;
        if (result.affectedRows > 0) {
          // console.log(result);
          res.send({ code: 1 });
        } else {
          res.send({ code: 0 });
        }
      });
    }
  });
});

// 旅游列表
server.get("/travel", (req, res) => {
  let moreid = req.query.moreid;
  // console.log(moreid);
  let sql = "select * from pro where moreid = ?";
  pool.query(sql, [moreid], (err, result) => {
    if (err) throw err;
    res.send({ result });
  });
});

//美食列表
server.get("/food", (req, res) => {
  let food = req.query.food;
  let sql = "select * from pro where moreid = ?";
  pool.query(sql, [food], (err, result) => {
    if (err) throw err;
    res.send({ result });
  });
});

//奢侈品列表请求
server.get("/luxury", (req, res) => {
  let luxury = req.query.luxury;
  let sql = "select * from pro where moreid = ?";
  pool.query(sql, [luxury], (err, result) => {
    if (err) throw err;
    res.send({ result });
  });
});

//详情内容请求
server.get("/details", (req, res) => {
  let id = req.query.id;
  // console.log(id);
  let sql = "select * from pro where id = ?";
  let sql2 = "select * from details where detailsid = ?";
  pool.query(sql, [id], (err, result) => {
    if (err) throw err;
    // res.send({result});
    // console.log(result[0].relation)
    pool.query(sql2, [id], (err, result2) => {
      if (err) throw err;
      // res.send({pro:result[0],details:result2})
      res.json({ result, result2 });
    });
  });
});

// 获取搜索的数据
server.get("/search", (req, res) => {
  let pro = req.query.pro;
  pro = "%" + pro + "%";
  let sql = "select * from pro where title like ?";
  pool.query(sql, [pro], (err, result) => {
    if (err) throw err;
    res.send({ code: 1, result: result });
  });
});
