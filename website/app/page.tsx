'use client'

import Features from "@/components/Features";
import Footer from "@/components/Footer";
import GetApp from "@/components/GetApp";
import Guide from "@/components/Guide";
import Hero from "@/components/Hero";
import Locations from "@/components/Locations";
import Navbar from "@/components/Navbar";
import { useRouter } from "next/navigation";
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
