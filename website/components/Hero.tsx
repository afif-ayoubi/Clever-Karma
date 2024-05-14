import React from 'react'
import Image from "next/image"

const Hero = () => {
    return (
        <section className="max-container padding-container flex flex-col gap-20 py-10 pb-32 md:gap-28 lg:py-20 xl:flex-row">
            <div className="hero-map" />
            <div className="relative z-20 flex flex-1 flex-col xl:w-1/2">
                <Image
                    src="/camp.svg"
                    alt="camp"
                    width={50}
                    height={50}
                    className="absolute left-[-5px] top-[-30px] w-10 lg:w-[50px]"
                />
                <h1 className="bold-52 lg:bold-88">Join Our Volunteering Program</h1>
                <p className="regular-16 mt-6 text-gray-30 xl:max-w-[520px]">
                    Be part of a community dedicated to making a difference. Volunteer with us to help preserve nature and enrich lives, all while experiencing incredible adventures.
                </p>
            </div>
        </section>
    )
}

export default Hero
