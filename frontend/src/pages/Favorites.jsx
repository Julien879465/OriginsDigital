import React, { useEffect } from "react";
import { Link } from "react-router-dom";
import { TrashBinOutline } from "react-ionicons";
import { useSignInContext } from "../contexts/SignInContext";
import { useFavoriteContext } from "../contexts/FavoriteContext";
import instanceAxios from "../services/instanceAxios";

import styles from "../styles/Favorites.module.scss";

export default function Favorites() {
  const { userId, setUserId } = useSignInContext();
  const { favorites, setFavorites } = useFavoriteContext();

  useEffect(() => {
    instanceAxios
      .get(`/favorites`)
      .then((res) => res.data)
      .then((data) => {
        const userFav = data.filter((fav) => fav.user_id === userId);
        setFavorites(userFav);
      });
    instanceAxios.get(`/profile`).then((response) => {
      const userData = response.data;
      setUserId(userData.id);
    });
  }, [favorites]);

  const onPressDelete = (id) => {
    instanceAxios
      .delete(`/favorites/${id}`)
      .then(() => setFavorites(favorites.filter((f) => f.id !== id)))
      .catch((error) => console.error(error));
  };
  return (
    <div className={styles.container}>
      <div className={styles.title}>Favorites</div>
      <div className={styles.favorites}>
        {favorites.length === 0 ? (
          <p>
            No favorites found. You need to log in to add videos to your
            favorites.
          </p>
        ) : (
          favorites.map((favorite) => (
            <div key={favorite.id} className={styles["videos-container"]}>
              <Link to={`/videos/${favorite.video_id}`}>
                <img
                  key={favorite.id}
                  src={favorite.thumbnail}
                  alt={favorite.description}
                />
              </Link>
              <div className={styles["title-container"]}>
                <div className={styles["video-title"]}>{favorite.title}</div>
                <div className={styles.trashbin}>
                  <button
                    type="button"
                    onClick={() => onPressDelete(favorite.video_id)}
                    className={styles["trashbin-button"]}
                  >
                    <TrashBinOutline
                      color="#ffffff"
                      height="25px"
                      width="25px"
                    />
                  </button>
                </div>
              </div>
            </div>
          ))
        )}
      </div>
    </div>
  );
}
