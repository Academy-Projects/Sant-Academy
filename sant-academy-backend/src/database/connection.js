const db = require("mongoose");

require("dotenv");

db.set('strictQuery', false);
db.connect(
  process.env.DATABASE_URI, 
  { useUnifiedTopology: true, useNewUrlParser: true }
);

db.connection.once("open", () => {
  console.log("Database connected.");
})

db.connection.on("error", () => {
  console.error("Error while connecting to database");
})

module.exports = db.connection;
