import type { Metadata } from "next";
import { Inter } from "next/font/google";
import "./globals.css";
import { StoreProvider } from "./store/storeProvider";


export const metadata: Metadata = {
  title: "Clever Karma",
  description: "Generated by create next app",
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="en">
      <main className="relative overflow-hidden">
        <body>
          <StoreProvider>
            {children}
          </StoreProvider>
        </body>
      </main>


    </html>
  );
}
