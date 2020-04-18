const fs = require('fs');
const express = require("express");
const path = require("path");
const bodyParser = require("body-parser");
const app = express();
const cors = require('cors');

const Matrix = require('./exercise/functions/matrix');

app.use(cors());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

app.use("/", express.static("public"));

app.get("/", function(req, res) {
  // res.send('Hello World')
  const filePath = path.join(__dirname, "public/index.html");
  res.sendFile(filePath);
});

const databasePath = path.join(__dirname, 'data/database.json');

function readDatabaseFile() {
  const data = JSON.parse(fs.readFileSync(databasePath, 'utf-8'));
  return data;
}

function getDatabaseTable(table) {
  const fileData = readDatabaseFile();
  return fileData[table];
}

function insertRecordIntoDatabase(table, record) {
  const data = readDatabaseFile();
  data[table].push(record);

  fs.writeFileSync(databasePath, JSON.stringify(data), { encoding: 'utf-8' });
}

app.get("/users", function(req, res) {
  const users = getDatabaseTable('users');
  res.json(users);
});

app.post("/users/create", function(req, res) {
  console.log("Cuerpo de la petición", req.body);

  insertRecordIntoDatabase('users', req.body);

  res.redirect("/");
});

app.post('/matrix', function(req, res) {
  const resultMatrix = Matrix(req.body.matrix);

  res.json({
    message: 'Exitoso',
    result: resultMatrix.getDeterminant()
  });
});

app.listen(3001, function() {
  console.log("App is running at http://localhost:3001");
});
