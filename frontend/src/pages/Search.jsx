import React, { useState, useEffect } from "react";
import axios from "axios";
import { NavLink, useSearchParams } from "react-router-dom";

import styles from "../styles/Search.module.scss";

export default function Search() {
  const [videos, setVideos] = useState([]);
  const [selectedFilter, setSelectedFilter] = useState("");
  const [videosFound, setVideosFound] = useState(true);

  const [getCategoryParams] = useSearchParams();
  const categoryName = getCategoryParams.get("category-name");

  useEffect(() => {
    axios
      .get(`${import.meta.env.VITE_BACKEND_URL}/videos`)
      .then((res) => res.data)
      .then((data) => {
        setVideos(data);
      });

    if (categoryName !== null) {
      setSelectedFilter(categoryName);
    } else {
      setSelectedFilter("");
    }
  }, []);

  useEffect(() => {
    if (selectedFilter !== "") {
      const filteredVideos = videos.filter(
        (video) => video.category_name === selectedFilter
      );
      setVideosFound(filteredVideos.length > 0);
    }
  }, [selectedFilter, videos]);

  return (
    <div className={styles.container}>
      <select
        name="filters"
        value={selectedFilter}
        onChange={(e) => setSelectedFilter(e.target.value)}
        className={styles.select}
      >
        <option value="">Categories</option>
        <option value="HTML">HTML</option>
        <option value="React">React</option>
        <option value="JavaScript">Javascript</option>
        <option value="CSS">CSS</option>
        <option value="Node.js">Node.js</option>
        <option value="Next.js">Next.js</option>
        <option value="Typescript">Typescript</option>
        <option value="Express.js">Express.js</option>
        <option value="PHP">PHP</option>
        <option value="Java">Java</option>
        <option value="SQL">SQL</option>
        <option value="NoSQL">NoSQL</option>
      </select>
      <div
        className={`${styles.thumbnails} ${
          !videosFound && styles["no-videos-found"]
        }`}
      >
        {!selectedFilter && (
          <h1 className={styles.browse}>Select a category</h1>
        )}
        {selectedFilter !== "" && (
          <>
            <h1 className={styles.browse}>Browse {selectedFilter}</h1>
            {!videosFound && (
              <div>
                <h1>No videos found in the selected category.</h1>
              </div>
            )}
            {videos
              .filter((video) => video.category_name === selectedFilter)
              .map((video) => (
                <div key={video.title} className={styles.imgContainer}>
                  <NavLink
                    key={video.id}
                    to={`/videos/${video.id}`}
                    className={styles["navlink-thumbnail"]}
                  >
                    <img
                      key={video.id}
                      src={video.thumbnail}
                      alt={video.description}
                    />
                    <p className={styles.title}>{video.title}</p>
                  </NavLink>
                </div>
              ))}
          </>
        )}
      </div>
    </div>
  );
}
