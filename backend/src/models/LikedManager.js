const AbstractManager = require("./AbstractManager");

class LikedManager extends AbstractManager {
  constructor() {
    super({ table: "liked" });
  }

  insert(userId, videoId) {
    return this.database.query(
      `insert into ${this.table} (user_id, video_id) values (?, ?)`,
      [userId, videoId]
    );
  }

  delete(videoId) {
    return this.database.query(
      `delete from ${this.table} where liked.video_id = ?`,
      [videoId]
    );
  }

  findAll() {
    return this.database.query(`SELECT * FROM ${this.table}`);
  }
}

module.exports = LikedManager;
