"use client";
import React, { useState } from 'react';
import '../ui/global.css'

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
    console.log('Submitted data:', formData);

  };

  return (
    <div className="flex justify-center items-center h-screen mt-10 ">
      <div className="bg-bgSoft p-8 rounded-lg shadow-md w-full max-w-md">
        <h2 className="text-2xl mb-6 text-center">Register</h2>
        <form onSubmit={handleSubmit}>
          <div className="mb-4">
            <label htmlFor="name" className="block text-textSoft mb-1">Name</label>
            <input type="text" id="name" name="name" value={formData.name} onChange={handleInputChange} className="w-full px-3 py-2 bg-bg text-textSoft rounded" required />
          </div>
          <div className="mb-4">
            <label htmlFor="email" className="block text-textSoft mb-1">Email</label>
            <input type="email" id="email" name="email" value={formData.email} onChange={handleInputChange} className="w-full px-3 py-2 bg-bg text-textSoft rounded" required />
          </div>
          <div className="mb-4">
            <label htmlFor="password" className="block text-textSoft mb-1">Password</label>
            <input type="password" id="password" name="password" value={formData.password} onChange={handleInputChange} className="w-full px-3 py-2 bg-bg text-textSoft rounded" required />
          </div>
          <div className="mb-4">
            <label htmlFor="aboutus" className="block text-textSoft mb-1">About Us</label>
            <textarea id="aboutus" name="aboutus" value={formData.aboutus} onChange={handleInputChange} className="w-full px-3 py-2 bg-bg text-textSoft rounded" rows={3}></textarea>
          </div>
          <div className="mb-4">
            <label htmlFor="volunteer" className="block text-textSoft mb-1">How to Volunteer</label>
            <textarea id="volunteer" name="volunteer" value={formData.volunteer} onChange={handleInputChange} className="w-full px-3 py-2 bg-bg text-textSoft rounded" rows={3}></textarea>
          </div>
          <div className="mb-4">
            <label htmlFor="image" className="block text-textSoft mb-1">Image URL</label>
            <input type="url" id="image" name="image" value={formData.image} onChange={handleInputChange} className="w-full px-3 py-2 bg-bg text-textSoft rounded" />
          </div>
          <div className="mb-4">
            <label htmlFor="longitude" className="block text-textSoft mb-1">Longitude</label>
            <input type="text" id="longitude" name="longitude" value={formData.longitude} onChange={handleInputChange} className="w-full px-3 py-2 bg-bg text-textSoft rounded" />
          </div>
          <div className="mb-4">
            <label htmlFor="latitude" className="block text-textSoft mb-1">Latitude</label>
            <input type="text" id="latitude" name="latitude" value={formData.latitude} onChange={handleInputChange} className="w-full px-3 py-2 bg-bg text-textSoft rounded" />
          </div>
          <div className="text-center">
            <button type="submit" className="px-4 py-2 bg-bgSoft text-textSoft rounded hover:bg-bg hover:text-text transition duration-300">Register</button>
          </div>
        </form>
      </div>
    </div>
  );
};

export default Register;