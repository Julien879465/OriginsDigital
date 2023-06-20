require("dotenv").config();

const mysql = require("mysql2/promise");

// create a connection pool to the database

const { DB_HOST, DB_PORT, DB_USER, DB_PASSWORD, DB_NAME } = process.env;

const pool = mysql.createPool({
  host: DB_HOST,
  port: DB_PORT,
  user: DB_USER,
  password: DB_PASSWORD,
  database: DB_NAME,
});

// try a connection

pool.getConnection().catch(() => {
  console.warn(
    "Warning:",
    "Failed to get a DB connection.",
    "Did you create a .env file with valid credentials?",
    "Routes using models won't work as intended"
  );
});

// declare and fill models: that's where you should register your own managers

const models = {};

const VideoManager = require("./VideoManager");

models.video = new VideoManager();
models.video.setDatabase(pool);

const ItemManager = require("./ItemManager");

models.item = new ItemManager();
models.item.setDatabase(pool);

const UserManager = require("./UserManager");

models.user = new UserManager();
models.user.setDatabase(pool);

const AvatarManager = require("./AvatarManager");

models.avatar = new AvatarManager();
models.avatar.setDatabase(pool);

const FavoriteManager = require("./FavoriteManager");

models.favorite = new FavoriteManager();
models.favorite.setDatabase(pool);

const LikedManager = require("./LikedManager");

models.liked = new LikedManager();
models.liked.setDatabase(pool);

const DislikedManager = require("./DislikedManager");

models.disliked = new DislikedManager();
models.disliked.setDatabase(pool);

const CategoryManager = require("./CategoryManager");

models.category = new CategoryManager();
models.category.setDatabase(pool);

// bonus: use a proxy to personalize error message,
// when asking for a non existing model

const handler = {
  get(obj, prop) {
    if (prop in obj) {
      return obj[prop];
    }

    const pascalize = (string) =>
      string.slice(0, 1).toUpperCase() + string.slice(1);

    throw new ReferenceError(
      `models.${prop} is not defined. Did you create ${pascalize(
        prop
      )}Manager.js, and did you register it in backend/src/models/index.js?`
    );
  },
};

module.exports = new Proxy(models, handler);
