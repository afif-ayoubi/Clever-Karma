'use client';
import React, { useState } from 'react';
import styles from '../../ui/dashboard/users/addUser/addUser.module.css';

const Notification = () => {
  const [title, setTitle] = useState('');
  const [body, setBody] = useState('');
  const [showPopup, setShowPopup] = useState(false);
  const [validationError, setValidationError] = useState('');

  const handleSubmit = (e) => {
    e.preventDefault();

    if (!title.trim() || !body.trim()) {
      setValidationError('Please fill out both fields.');
      return;
    }

    const token = localStorage.getItem('token');

    const myHeaders = new Headers();
    myHeaders.append("Authorization", `Bearer ${token}`);
    myHeaders.append("Content-Type", "application/json");

    const raw = JSON.stringify({
      "title": title,
      "body": body
    });

    const requestOptions = {
      method: "POST",
      headers: myHeaders,
      body: raw,
      redirect: "follow"
    };

    fetch("http://localhost:3000/firebase/send-notification", requestOptions)
      .then((response) => response.text())
      .then((result) => {
        console.log(result);
        setShowPopup(true);
        setTimeout(() => {
          setShowPopup(false);
        }, 3000);
      })
      .catch((error) => console.error('Error sending notification:', error));

    setTitle('');
    setBody('');
    setValidationError('');
  };

  return (
    <div className={styles.container}>
      <form className={styles.form} onSubmit={handleSubmit}>
        <input
          type="text"
          placeholder="Title"
          value={title}
          onChange={(e) => setTitle(e.target.value)}
          className={validationError && !title.trim() ? styles.inputError : ''}
        />
        <textarea
          placeholder="Body"
          value={body}
          onChange={(e) => setBody(e.target.value)}
          rows={4}
          className={validationError && !body.trim() ? styles.inputError : ''}
        />
        {validationError && <p className={styles.errorText}>{validationError}</p>}
        <button type="submit">Send Notification</button>
      </form>

      {showPopup && (
        <div className={styles.popup}>
          <p>Notification sent successfully!</p>
          <button onClick={() => setShowPopup(false)}>Close</button>
        </div>
      )}
    </div>
  );
};

export default Notification;
