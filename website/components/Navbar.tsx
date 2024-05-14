import Link from 'next/link'
import React from 'react'
import Image from "next/image"
import Button from './Button'

const Navbar = () => {
    return (
        <nav className="flexBetween max-container padding-container relative z-30 py-5">

            <Link href="/">
                <Image src="/logo.png" alt="logo" width={74} height={29} />
            </Link>
            <div className="lg:flexCenter hidden">
                <Button
                    type="button"
                    title="Login"
                    icon="/user.svg"
                    variant="btn_dark_green"
                />
            </div>

        </nav>



    )
}

export default Navbar