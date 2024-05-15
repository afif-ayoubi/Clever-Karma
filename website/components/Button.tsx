import Image from "next/image";
import { useRouter } from "next/navigation";

type ButtonProps = {
  type: 'button' | 'submit';
  title: string;
  icon?: string;
  variant: string;
  full?: boolean;
  destination: string;

}

const Button = ({ type, title, icon, variant, full, destination }: ButtonProps) => {
  const router = useRouter();
  const handleClick = () => {
    router.push(destination);


  }

  return (
    <button
      className={`flexCenter gap-3 rounded-full border ${variant} ${full && 'w-full'}`}
      type={type} 
      onClick={handleClick}
    >
      {icon && <Image src={icon} alt={title} width={24} height={24} />}
      <label className="bold-16 whitespace-nowrap cursor-pointer">{title}</label>
    </button>
  )
}

export default Button