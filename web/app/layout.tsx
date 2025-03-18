import type { Metadata } from "next";
import "./globals.css";

export const metadata: Metadata = {
  title: "Far Sleep Inc",
  description: "Compress human sleep. Create more time for humanity.",
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="en" className="dark">
      <body className="min-h-screen">{children}</body>
    </html>
  );
}
