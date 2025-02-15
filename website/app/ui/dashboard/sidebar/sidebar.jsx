import React from 'react'
import styles from "./sidebar.module.css";
import Image from 'next/image';
import MenuLink from './menuLink/menuLink';
import {
  MdDashboard,
  MdSupervisedUserCircle,
  MdShoppingBag,
  MdAttachMoney,
  MdWork,
  MdAnalytics,
  MdPeople,
  MdOutlineSettings,
  MdHelpCenter,
  MdLogout,
} from "react-icons/md";

const menuItems = [
  {
    title: "Pages",
    list: [
      {
        title: "Dashboard",
        path: "/dashboard",
        icon: <MdDashboard />,
      },
      {
        title: "Users",
        path: "/dashboard/users",
        icon: <MdSupervisedUserCircle />,
      },
      {
        title: "Sections",
        path: "/dashboard/sections",
        icon: <MdWork />,
      },
      {
        title: "Notification",
        path: "/dashboard/notification",
        icon: <MdPeople />,
      },
      {
        title: "Ai prediction",
        path: "/dashboard/prediction",
        icon: <MdAnalytics />,
      },
    ],
  },

  {
    title: "User",
    list: [
      {
        title: "Settings",
        path: "/dashboard/Settings",
        icon: <MdOutlineSettings />,
      },
      {
        title: "Help",
        path: "/dashboard/Help",
        icon: <MdHelpCenter />,
      },
    ],
  },
];
const Sidebar =  () => {
    return (
      <div className={styles.container}>
        <div className={styles.user}>
          <Image
            className={styles.userImage}
            src={ "/noavatar.png"}
            alt=""
            width="50"
            height="50"
          />
          <div className={styles.userDetail}>
            <span className={styles.username}>{"Admin"}</span>
            <span className={styles.userTitle}>Administrator</span>
          </div>
        </div>
        <ul className={styles.list}>
          {menuItems.map((cat) => (
            <li key={cat.title}>
              <span className={styles.cat}>{cat.title}</span>
              {cat.list.map((item) => (
                <MenuLink item={item} key={item.title} />
              ))}
            </li>
          ))}
        </ul>
        <form
       
        >
          <button className={styles.logout} >
            <MdLogout />
            Logout
          </button>
        </form>
      </div>
    );
  };
  
  export default Sidebar;