const mongoose = require("mongoose");

const User = new mongoose.Schema(
  {
    username: {
      type: String,
      unique: true,
      required: true
    }
  },
  { collection: "Users" }
)

module.exports = {
  User: mongoose.model("Users", User)
}