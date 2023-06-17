import React, { useState } from "react";
import PropTypes from "prop-types";
import styles from "../styles/SignUp.module.scss";

function validateLastname(lastname) {
  const regex = /^[a-zA-Z]{3,30}$/;
  return regex.test(lastname);
}
function LastName({ lastName, setLastName }) {
  const [isValidLastName, setIsValidLastName] = useState(true);

  const handleChangeLastName = (event) => {
    const inputValue = event.target.value;
    setLastName(inputValue);
    if (!validateLastname(inputValue)) {
      setIsValidLastName(false);
    } else {
      setIsValidLastName(true);
    }
  };
  return (
    <div className={styles["form-group"]}>
      <label htmlFor="lastName"> </label>
      <input
        className={styles["sign-up-input"]}
        id="lastName"
        name="lastName"
        type="text"
        placeholder="Lastname"
        value={lastName || ""}
        onChange={handleChangeLastName}
        onTouchStart={(e) => {
          e.preventDefault();
        }}
        onTouchMove={(e) => {
          e.preventDefault();
        }}
        onWheel={(e) => {
          e.preventDefault();
        }}
        onScroll={(e) => {
          e.preventDefault();
        }}
      />
      {!isValidLastName && (
        <span className={styles["sign-span"]}>
          Your lastname lenght must be at least 3 caracter
        </span>
      )}
    </div>
  );
}
LastName.propTypes = {
  lastName: PropTypes.string,
  setLastName: PropTypes.func.isRequired,
};
LastName.defaultProps = {
  lastName: "",
};

export default LastName;
