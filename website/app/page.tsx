'use client'

import Features from "@/app/ui/home/Features";
import Footer from "@/app/ui/home/Footer";
import GetApp from "@/app/ui/home/GetApp";
import Guide from "@/app/ui/home/Guide";
import Hero from "@/app/ui/home/Hero";
import Locations from "@/app/ui/home/Locations";
import Navbar from "@/app/ui/home/Navbar";
export default function Home() {

  return (
    <>
      <Navbar />
      <Hero></Hero>
      <Locations></Locations>
      <Guide></Guide>
      <Features></Features>
      <GetApp></GetApp>
      <Footer />
    </>

  );
}
