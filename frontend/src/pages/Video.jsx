import React, { useEffect, useState } from "react";
import { useParams, useNavigate, Link } from "react-router-dom";
import ReactPlayer from "react-player";
import { toast } from "react-toastify";
import {
  ThumbsUp,
  ThumbsDown,
  ThumbsUpOutline,
  ThumbsDownOutline,
  BookmarkOutline,
  Bookmark,
} from "react-ionicons";
import { useSignInContext } from "../contexts/SignInContext";
import instanceAxios from "../services/instanceAxios";

import styles from "../styles/Video.module.scss";

function Video() {
  const { userId, setUserId } = useSignInContext();
  const [likeCount, setLikeCount] = useState(0);
  const [dislikeCount, setDislikeCount] = useState(0);
  const [isLiked, setIsLiked] = useState();
  const [isDisliked, setIsDisliked] = useState();
  const { id } = useParams();
  const [video, setVideo] = useState({});
  const [isFavorite, setIsFavorite] = useState(false);
  const navigate = useNavigate();

  useEffect(() => {
    instanceAxios.get(`/profile`).then((response) => {
      const userData = response.data;
      setUserId(userData.id);
      instanceAxios
        .get(`/videos/${id}`)
        .then((res) => res.data)
        .then((data) => {
          setVideo(data);
          setLikeCount(data.likes);
          setDislikeCount(data.dislikes);
        });
    });
  }, [userId, video.id, isLiked, isDisliked]);

  useEffect(() => {
    instanceAxios.get(`/liked`).then((resLiked) => {
      const res = resLiked.data.filter(
        (elem) => elem.user_id === userId && elem.video_id === video.id
      );
      if (res.length !== 0) {
        setIsLiked(true);
        setIsDisliked(false);
      }
    });
    instanceAxios.get(`/disliked`).then((resDisliked) => {
      const res = resDisliked.data.filter(
        (elem) => elem.user_id === userId && elem.video_id === video.id
      );
      if (res.length !== 0) {
        setIsLiked(false);
        setIsDisliked(true);
      }
    });
  }, [userId, video.id, isLiked, isDisliked]);

  useEffect(() => {
    instanceAxios.get(`/favorites`).then((resFav) => {
      const res = resFav.data.filter(
        (elem) => elem.user_id === userId && elem.video_id === video.id
      );
      if (res.length !== 0) {
        setIsFavorite(true);
      } else {
        setIsFavorite(false);
      }
    });
  }, [userId, video.id, isFavorite]);

  const onPressAdd = () => {
    instanceAxios.get(`/favorites`).then((response) => {
      const res = response.data.filter(
        (elem) => elem.user_id === userId && elem.video_id === video.id
      );
      if (res.length === 0) {
        instanceAxios.post(`/favorites`, {
          user_id: userId,
          video_id: video.id,
        });
        setIsFavorite(true);
        toast.success("Video added to favorites!");
      } else {
        instanceAxios.delete(`/favorites/${id}`, {
          user_id: userId,
          video_id: video.id,
        });
        setIsFavorite(false);
        toast.warning("Video removed from favorites!");
      }
    });
  };

  const onPressAddLiked = () => {
    instanceAxios.get(`/liked`).then((response) => {
      const res = response.data.filter(
        (elem) => elem.user_id === userId && elem.video_id === video.id
      );
      if (res.length === 0) {
        instanceAxios.post(`/liked`, {
          user_id: userId,
          video_id: video.id,
        });
        instanceAxios.put(`/videos/${id}`, { likes: likeCount + 1 });
        setIsLiked(true);
        setIsDisliked(false);
        toast.success("Like sent!");
      } else {
        instanceAxios.delete(`/liked/${id}`, {
          user_id: userId,
          video_id: video.id,
        });
        instanceAxios.put(`/videos/${id}`, { likes: likeCount - 1 });
        setIsLiked(false);
        toast.success("Like removed!");
      }
      instanceAxios.get(`/disliked`).then((responseDisliked) => {
        const resDisliked = responseDisliked.data.filter(
          (elem) => elem.user_id === userId && elem.video_id === video.id
        );
        if (resDisliked.length !== 0) {
          instanceAxios.delete(`/disliked/${id}`, {
            user_id: userId,
            video_id: video.id,
          });
          instanceAxios.put(`/videos/${id}/dislikes`, {
            dislikes: dislikeCount - 1,
          });
          setIsDisliked(false);
          toast.success("Dislike removed!");
        }
      });
    });
  };

  const onPressAddDisliked = () => {
    instanceAxios.get(`/disliked`).then((response) => {
      const res = response.data.filter(
        (elem) => elem.user_id === userId && elem.video_id === video.id
      );
      if (res.length === 0) {
        instanceAxios.post(`/disliked`, {
          user_id: userId,
          video_id: video.id,
        });
        instanceAxios.put(`/videos/${id}/dislikes`, {
          dislikes: dislikeCount + 1,
        });
        setIsDisliked(true);
        setIsLiked(false);
        toast.success("Dislike sent!");
      } else {
        instanceAxios.delete(`/disliked/${id}`, {
          user_id: userId,
          video_id: video.id,
        });
        instanceAxios.put(`/videos/${id}/dislikes`, {
          dislikes: dislikeCount - 1,
        });
        setIsDisliked(false);
        toast.success("Dislike removed!");
      }
      instanceAxios.get(`/liked`).then((responseliked) => {
        const resLiked = responseliked.data.filter(
          (elem) => elem.user_id === userId && elem.video_id === video.id
        );
        if (resLiked.length !== 0) {
          instanceAxios.delete(`/liked/${id}`, {
            user_id: userId,
            video_id: video.id,
          });
          instanceAxios.put(`/videos/${id}`, { likes: likeCount - 1 });
          setIsLiked(false);
          toast.success("Like removed!");
        }
      });
    });
  };

  const onPressCategory = (e) => {
    const category = e.target.textContent;
    const path = `/search?category-name=${category}`;
    navigate(path);
  };

  return (
    <div>
      {userId ? (
        <div className={styles.contvid}>
          <div>You must sign in to see videos</div>
          <div className={styles.videobox}>
            <ReactPlayer
              controls
              className={styles.video}
              url={video.url}
              height="100%"
              width="100%"
            />
          </div>
          <button
            type="button"
            className={styles.catbtn}
            onClick={(e) => onPressCategory(e)}
            onKeyDown={(e) => onPressCategory(e)}
          >
            <h3 className={styles.cattitle}>{video.category_name}</h3>
          </button>
          <h2 className={styles.videotitle}>{video.title}</h2>
          <div className={styles.boxlike}>
            <div className={styles.likes}>
              {isLiked ? (
                <ThumbsUp
                  color="#ffffff"
                  height="30px"
                  width="40px"
                  onClick={() => onPressAddLiked(userId, video.id)}
                  className={styles.like}
                />
              ) : (
                <ThumbsUpOutline
                  color="#ffffff"
                  height="30px"
                  width="40px"
                  onClick={() => onPressAddLiked(userId, video.id)}
                  className={styles.like}
                />
              )}
              <span className={styles.likeCount}>{likeCount}</span>
              {isDisliked ? (
                <ThumbsDown
                  color="#ffffff"
                  height="30px"
                  width="40px"
                  onClick={() => onPressAddDisliked(userId, video.id)}
                  className={styles.dislike}
                />
              ) : (
                <ThumbsDownOutline
                  color="#ffffff"
                  height="30px"
                  width="40px"
                  onClick={() => onPressAddDisliked(userId, video.id)}
                  className={styles.dislike}
                />
              )}
              <span className={styles.likeCount}>{dislikeCount}</span>
            </div>
            <div className={styles.favories}>
              {isFavorite ? (
                <Bookmark
                  color="#ffffff"
                  height="35px"
                  width="35px"
                  className={styles.favorite}
                  onClick={() => onPressAdd(userId, video.id)}
                />
              ) : (
                <BookmarkOutline
                  color="#ffffff"
                  height="35px"
                  width="35px"
                  className={styles.favorite}
                  onClick={() => onPressAdd(userId, video.id)}
                />
              )}
            </div>
          </div>
          <p className={styles.descvid}>{video.description}</p>
        </div>
      ) : (
        <div
          style={{
            display: "flex",
            justifyContent: "center",
            alignItems: "center",
            minHeight: `calc(100vh - 5rem)`,
            fontSize: "50px",
            ...(window.innerWidth <= 993 && {
              fontSize: "30px",
              textAlign: "center",
            }),
          }}
        >
          You must<span>&nbsp;</span>
          <Link
            to="/sign-in"
            style={{ textDecoration: "none", color: "#ff7402" }}
          >
            sign in
          </Link>
          <span>&nbsp;</span>
          to see videos
        </div>
      )}
    </div>
  );
}

export default Video;
