'use client'
import React from 'react'
import '../ui/global.css'
import Card from "../ui/dashboard/card/card";
import styles from '../ui/dashboard/dashboard.module.css'
const Dashboard = () => {
  return (
    <div>
      <div className={styles.cards}>
        <Card />
        <Card />
        <Card />
      </div>  
    </div>
  )
}

export default Dashboard