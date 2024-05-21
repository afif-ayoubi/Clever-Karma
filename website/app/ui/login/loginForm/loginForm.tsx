import { useState } from 'react';
import { useDispatch } from 'react-redux';
import { loginUser } from '../../../store/user/user.slice';
import { useRouter } from 'next/router';
import styles from './loginForm.module.css';
import { AppDispatch } from '@/app/store/store';

interface Credentials {
  email: string;
  password: string;
}

const LoginForm = () => {
  const dispatch = useDispatch<AppDispatch>();
  const router = useRouter();

  const [credentials, setCredentials] = useState<Credentials>({
    email: '',
    password: ''
  });

  const [errors, setErrors] = useState({
    email: '',
    password: ''
  });

  const handleFieldChange = (fieldName: keyof Credentials) => (e: React.ChangeEvent<HTMLInputElement>) => {
    setCredentials((prevCredentials) => ({
      ...prevCredentials,
      [fieldName]: e.target.value,
    }));
  };

  const handleSubmit = async (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();

    let valid = true;
    const newErrors = {
      email: '',
      password: ''
    };

    if (!credentials.email) {
      newErrors.email = 'Email is required';
      valid = false;
    }

    if (!credentials.password) {
      newErrors.password = 'Password is required';
      valid = false;
    }

    setErrors(newErrors);

    if (valid) {
      try {
        const loginPromise = dispatch(loginUser(credentials));
        loginPromise.then((response) => {
          if (response.payload?.role === 'Admin') {
            router.push('/dashboard');
          }
        });
      } catch (error) {
        console.error('Login failed:', error);
      }
    }
  };

  return (
    <form className={styles.form} onSubmit={handleSubmit}>
      <h1>Login</h1>
      <div className={styles.formGroup}>
        <label htmlFor="email">Email</label>
        <input
          type="text"
          id="email"
          name="email"
          value={credentials.email}
          onChange={handleFieldChange('email')}
        />
        {errors.email && <div className={styles.error}>{errors.email}</div>}
      </div>
      <div className={styles.formGroup}>
        <label htmlFor="password">Password</label>
        <input
          type="password"
          id="password"
          name="password"
          value={credentials.password}
          onChange={handleFieldChange('password')}
        />
        {errors.password && <div className={styles.error}>{errors.password}</div>}
      </div>
      <button type="submit">Login</button>
    </form>
  );
};

export default LoginForm;
