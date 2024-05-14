import React from 'react'
import Link from 'next/link'
const Footer = () => {
  return (
    <footer className="flexCenter mb-24">
      <div className="padding-container max-container flex w-full flex-col gap-14">
        <div className="flex flex-col items-start justify-center gap-[10%] md:flex-row">
          <Link href="/" className="mb-10">
            <span className="text-2xl font-bold">
              Clever <span className="text-green-50">Karma</span>
            </span>          </Link>
        </div>
      </div>
    </footer>
  )
}
type FooterColumnProps = {
  title: string;
  children: React.ReactNode;
}
const FooterColumn = ({ title, children }: FooterColumnProps) => {
  return (
    <div className="flex flex-col gap-5">
      <h4 className="bold-18 whitespace-nowrap">{title}</h4>
      {children}
    </div>
  )
}
export default Footer