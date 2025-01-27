const models = require("../models");

const add = (req, res) => {
  const userId = req.body.user_id;
  const videoId = req.body.video_id;
  models.disliked
    .insert(userId, videoId)
    .then(([result]) => {
      res.location(`/disliked/${result.insertId}`).sendStatus(201);
    })
    .catch((err) => {
      console.error(err);
      res.sendStatus(500);
    });
};

const destroy = (req, res) => {
  models.disliked
    .delete(req.params.id)
    .then(([result]) => {
      if (result.affectedRows === 0) {
        res.sendStatus(404);
      } else {
        res.sendStatus(204);
      }
    })
    .catch((err) => {
      console.error(err);
      res.sendStatus(500);
    });
};
const browse = (req, res) => {
  models.disliked
    .findAll()
    .then(([rows]) => {
      res.send(rows);
    })
    .catch((err) => {
      console.error(err);
      res.sendStatus(500);
    });
};

module.exports = { add, destroy, browse };
