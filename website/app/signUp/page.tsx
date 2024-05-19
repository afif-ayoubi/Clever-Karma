import styles from "@/app/ui/signup/signup.module.css";
import '../ui/global.css'

const SignUpPage = () => {
  return (
    <div className={styles.container}>
      <SignUpForm />
    </div>
  );
};

export default SignUpPage;
