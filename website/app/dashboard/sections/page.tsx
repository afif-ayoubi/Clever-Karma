'use client'
import React, { useState } from 'react';
import axios from 'axios';
import styles from '../../ui/dashboard/users/addUser/addUser.module.css';

const Section = () => {
  const [formState, setFormState] = useState({
    season: '',
    accidents: '',
    demographicFactor: ''
  });
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState('');

  const handleChange = (e:any) => {
    const { name, value } = e.target;
    setFormState((prevState) => ({
      ...prevState,
      [name]: value,
    }));
  };

  const handleGeneratePrediction = () => {
    setLoading(true);

    let data = JSON.stringify({
      "name": formState.season,
      "description": formState.accidents,
      "imageUrl": formState.demographicFactor,
    });

    let config = {
      method: 'post',
      maxBodyLength: Infinity,
      url: 'http://localhost:3000/section',
      headers: {
        'Authorization': 'Bearer ' + localStorage.getItem('token'),
        'Content-Type': 'application/json'
      },
      data: data
    };

    axios.request(config)
      .then((response) => {
        console.log(response.data);
        setLoading(false);
        setError('');
      })
      .catch((error) => {
        console.error('Error fetching prediction:', error);
        setLoading(false);
        setError('Error generating prediction. Please try again.');
      });
  };

  return (
    <div className={styles.container}>
      <h2>Prediction</h2>
      <form className={styles.form} onSubmit={(e) => e.preventDefault()}>
        <input
          type="text"
          name="season"
          placeholder="Season"
          value={formState.season}
          onChange={handleChange}
          className={styles.input}
        />
        <input
          type="number"
          name="accidents"
          placeholder="Accidents"
          value={formState.accidents}
          onChange={handleChange}
          className={styles.input}
        />
        <input
          type="text"
          name="demographicFactor"
          placeholder="Demographic Factor"
          value={formState.demographicFactor}
          onChange={handleChange}
          className={styles.input}
        />
        <button className={styles.button} onClick={handleGeneratePrediction} disabled={loading}>
          {loading ? 'Adding...' : 'Add Section'}
        </button>
      </form>
      {error && <p className={styles.errorText}>{error}</p>}
    </div>
  );
};

export default Section;
