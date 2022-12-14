const models = require("../database/models");

class DatabaseService {
  async createUser(user) {
    try {
      let createdUser = await models.User.create({
        username: user.username
      })
      
      createdUser = createdUser.toJSON();

      return createdUser;

    } catch (err) {
      console.log(err);
    }
  }

  async getUser(username) {
    const queryUser = await models.User
      .where("username")
      .equals(username);

    return queryUser;
  }
}

module.exports = new DatabaseService();