"use client"

import Link from 'next/link'

export default function Contact() {
  return (
    <div className="min-h-screen bg-black text-white flex flex-col font-helvetica">
      <header className="p-6 flex justify-between items-center">
        <div>
          <Link href="/" className="font-bold text-2xl hover:text-gray-400 transition-colors">Far Sleep</Link>
        </div>
      </header>

      <main className="flex-grow container mx-auto px-4 max-w-3xl py-20">
        <h1 className="text-4xl font-bold mb-12">Contact Us</h1>
        
        <div className="space-y-12">
          <div>
            <h2 className="text-2xl font-light mb-4">General Inquiries</h2>
            <p className="text-lg mb-2">info@farsleep.com</p>
          </div>
          
          <div>
            <h2 className="text-2xl font-light mb-4">Research Collaborations</h2>
            <p className="text-lg mb-2">research@farsleep.com</p>
          </div>
          
          <div className="pt-8 mt-8 border-t border-gray-800">
            <Link href="/" className="inline-block px-6 py-3 border border-white text-white font-medium transition-colors hover:bg-white hover:text-black">
              Return to Home
            </Link>
          </div>
        </div>
      </main>

      <footer className="py-6 text-center border-t border-gray-800">
        <p>&copy; 2025 Far Sleep Inc.</p>
      </footer>
    </div>
  )
}