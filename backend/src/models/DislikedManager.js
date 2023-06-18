const AbstractManager = require("./AbstractManager");

class DislikedManager extends AbstractManager {
  constructor() {
    super({ table: "disliked" });
  }

  insert(userId, videoId) {
    return this.database.query(
      `insert into ${this.table} (user_id, video_id) values (?, ?)`,
      [userId, videoId]
    );
  }

  delete(videoId) {
    return this.database.query(
      `delete from ${this.table} where disliked.video_id = ?`,
      [videoId]
    );
  }

  findAll() {
    return this.database.query(`SELECT * FROM ${this.table}`);
  }
}
module.exports = DislikedManager;
