'use client'
import React, { useState } from 'react';
import axios from 'axios';
import styles from '../../ui/dashboard/users/addUser/addUser.module.css';

const Prediction = () => {
  const [formState, setFormState] = useState({
    season: '',
    accidents: '',
    demographicFactor: '',
    location: ''
  });
  const [predictionResult, setPredictionResult] = useState(null);
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
      "accidentData": {
        "season": formState.season,
        "accidents": formState.accidents,
        "demographicFactor": formState.demographicFactor,
        "location": formState.location
      }
    });

    let config = {
      method: 'post',
      maxBodyLength: Infinity,
      url: 'http://localhost:3000/openai/chat',
      headers: {
        'Content-Type': 'application/json'
      },
      data: data
    };

    axios.request(config)
      .then((response) => {
        console.log(response.data);
        setPredictionResult(response.data);
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
        <input
          type="text"
          name="location"
          placeholder="Location"
          value={formState.location}
          onChange={handleChange}
          className={styles.input}
        />
        <button className={styles.button} onClick={handleGeneratePrediction} disabled={loading}>
          {loading ? 'Generating...' : 'Generate Prediction'}
        </button>
      </form>
      {error && <p className={styles.errorText}>{error}</p>}
      {predictionResult && (
        <div className={styles.resultContainer}>
          <h3>Prediction Result:</h3>
          <pre className={styles.resultText}>{JSON.stringify(predictionResult, null, 2)}</pre>
        </div>
      )}
    </div>
  );
};

export default Prediction;
