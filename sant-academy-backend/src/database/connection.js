const db = require("mongoose");

require("dotenv").config();

db.set('strictQuery', false);

db.connect(process.env.DATABASE_URI, { useUnifiedTopology: true, useNewUrlParser: true })
  .then(() => {
    console.log("Database connected.");
  })
  .catch(error => {
    console.log("Error while connecting to database");
    console.error(error);
    process.exit(1);
  })

module.exports = db.connection;
