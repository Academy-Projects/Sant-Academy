const mongoose = require("mongoose");

const User = new mongoose.Schema({
  username: {
    type: String,
    required: true
  }
})

module.exports = {
  User: mongoose.model(User, "User")
}