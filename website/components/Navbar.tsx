import Link from 'next/link'
import React from 'react'
import Image from "next/image"
import Button from './Button'

const Navbar = () => {
    return (
        <nav className="flexBetween max-container padding-container relative z-30 py-5">

            <Link href="/">
                <span className="text-2xl font-bold">
                    Clever <span className="text-green-50">Karma</span>
                </span>
            </Link>
            <div className="lg:flexCenter hidden gap-2">
                <Button
                    type="button"
                    title="Login"
                    icon="/user.svg"
                    variant="btn_dark_green"
                />
                   <Button
                    type="button"
                    title="Register"
                    icon="/user.svg"
                    variant="btn_white_text"
                />
            </div>
            <Image
                src="menu.svg"
                alt="menu"
                width={32}
                height={32}
                className="inline-block cursor-pointer lg:hidden"
            />

        </nav>



    )
}

export default Navbar