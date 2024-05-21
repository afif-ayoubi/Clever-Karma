'use client';
import React, { useState } from 'react';
import axios from 'axios'; // Import Axios
import '../ui/global.css'; 
import styles from '../ui/sign/sign.module.css';

const Register = () => {
  const [formData, setFormData] = useState({
    name: '',
    email: '',
    password: '',
    aboutus: '',
    volunteer: '',
    image: '',
    longitude: '',
    latitude: ''
  });

  const handleInputChange = (e: React.ChangeEvent<HTMLInputElement | HTMLTextAreaElement>) => {
    const { name, value } = e.target;
    setFormData({
      ...formData,
      [name]: value
    });
  };

  const handleSubmit = (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    
    
    let data = {
      firstName: formData.name,
      lastName: '', 
      email: formData.email,
      password: formData.password,
      role: 'Organization',
      isActive: true,
      organizationDetail: {
        aboutUs: formData.aboutus,
        howToVolunteer: formData.volunteer,
        imageUrl: formData.image,
        location: {
          longitude: parseFloat(formData.longitude),
          latitude: parseFloat(formData.latitude)
        },
        volunteeringSectionId: '664943ac69b541102c576877' 
      },
      liveStreaming: {
        liveStremingId: '1234567',
        isActivated: false
      }
    };

    axios.post('http://localhost:3000/user/create-organization', data, {
      headers: {
        'Content-Type': 'application/json'
      }
    })
    .then((response) => {
      console.log('Response:', response.data);
    })
    .catch((error) => {
      console.error('Error:', error);
    });
  };

  return (
    <div className={styles.container}>
      <div className={styles.formContainer}>
        <h2 className={styles.title}>Register</h2>
        <form onSubmit={handleSubmit} className={styles.form}>
          <div className={styles.formGroup}>
            <label htmlFor="name" className={styles.label}>Name</label>
            <input type="text" id="name" name="name" value={formData.name} onChange={handleInputChange} className={styles.input} required />
          </div>
          <div className={styles.formGroup}>
            <label htmlFor="email" className={styles.label}>Email</label>
            <input type="email" id="email" name="email" value={formData.email} onChange={handleInputChange} className={styles.input} required />
          </div>
          <div className={styles.formGroup}>
            <label htmlFor="password" className={styles.label}>Password</label>
            <input type="password" id="password" name="password" value={formData.password} onChange={handleInputChange} className={styles.input} required />
          </div>
          <div className={styles.formGroup}>
            <label htmlFor="aboutus" className={styles.label}>About Us</label>
            <textarea id="aboutus" name="aboutus" value={formData.aboutus} onChange={handleInputChange} className={styles.textarea} rows={3}></textarea>
          </div>
          <div className={styles.formGroup}>
            <label htmlFor="volunteer" className={styles.label}>How to Volunteer</label>
            <textarea id="volunteer" name="volunteer" value={formData.volunteer} onChange={handleInputChange} className={styles.textarea} rows={3}></textarea>
          </div>
          <div className={styles.formGroup}>
            <label htmlFor="image" className={styles.label}>Image URL</label>
            <input type="url" id="image" name="image" value={formData.image} onChange={handleInputChange} className={styles.input} />
          </div>
          <div className={styles.formGroup}>
            <label htmlFor="longitude" className={styles.label}>Longitude</label>
            <input type="text" id="longitude" name="longitude" value={formData.longitude} onChange={handleInputChange} className={styles.input} />
          </div>
          <div className={styles.formGroup}>
            <label htmlFor="latitude" className={styles.label}>Latitude</label>
            <input type="text" id="latitude" name="latitude" value={formData.latitude} onChange={handleInputChange} className={styles.input} />
          </div>
          <div className={styles.submit}>
            <button type="submit" className={styles.button}>Register</button>
          </div>
        </form>
      </div>
    </div>
  );
};

export default Register;
