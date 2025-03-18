"use client"

import Link from 'next/link'
import { useState } from 'react'

export default function Home() {
  const [email, setEmail] = useState('');
  const [subscribed, setSubscribed] = useState(false);

  const handleSubmit = (e) => {
    e.preventDefault();
    // Here you would integrate with your backend
    console.log('Email submitted:', email);
    // Simulate successful subscription
    setSubscribed(true);
    setEmail('');
  };

  return (
    <div className="min-h-screen bg-black text-white flex flex-col font-helvetica">
      <header className="p-6 flex justify-between items-center">
        <div>
          <span className="font-bold text-2xl">Far Sleep</span>
        </div>
        <nav>
          <ul className="flex space-x-6">
            <li><Link href="#technology" className="hover:text-gray-400 transition-colors">Technology</Link></li>
            <li><Link href="#milestones" className="hover:text-gray-400 transition-colors">Milestones</Link></li>
            <li><Link href="#updates" className="hover:text-gray-400 transition-colors">Updates</Link></li>
            <li><Link href="#contact" className="hover:text-gray-400 transition-colors">Contact</Link></li>
          </ul>
        </nav>
      </header>

      <main className="flex-grow">
        <section 
          className="h-screen flex flex-col justify-center items-center text-center px-4 relative"
          style={{
            backgroundImage: 'url("/mission_background.jpg")',
            backgroundSize: 'cover',
            backgroundPosition: 'center 100px',
            backgroundRepeat: 'no-repeat'
          }}
        >
          <div className="absolute inset-0 bg-black bg-opacity-60"></div>
          <div className="relative z-10">
            <h1 className="text-5xl md:text-7xl font-bold mb-6">Compress Human Sleep</h1>
            <p className="text-xl md:text-2xl mb-16">Making time for humanity to do awesome things</p>
          </div>
        </section>

        <section id="milestones" className="py-20">
          <div className="container mx-auto px-4 max-w-3xl">
            <h2 className="text-3xl font-bold mb-12">Impact</h2>
            <div className="grid grid-cols-1 md:grid-cols-2 gap-16">
              <div>
                <p className="text-4xl font-light">1 hour</p>
                <p className="text-xl mt-2">less sleep per day</p>
              </div>
              <div>
                <p className="text-4xl font-light">½ month</p>
                <p className="text-xl mt-2">extra waking hours per year</p>
              </div>
            </div>
          </div>
        </section>

        <section id="mission" className="py-20">
          <div className="container mx-auto px-4 max-w-3xl">
            <h2 className="text-3xl font-bold mb-12">Milestones</h2>
            <div className="space-y-8">
              <div className="mb-8">
                <div className="flex items-center mb-2">
                  <h3 className="text-xl font-light">Reduce Sleep Requirements</h3>
                  <span className="ml-4 text-xs text-gray-500 uppercase tracking-wider">in progress</span>
                </div>
                <p className="text-gray-400 text-sm">Developing interventions to condense sleep cycles while preserving restorative benefits.</p>
              </div>
              
              <div className="mb-8">
                <div className="flex items-center mb-2">
                  <h3 className="text-xl font-light">Optimize Sleep/Wake Transitions</h3>
                  <span className="ml-4 text-xs text-gray-500 uppercase tracking-wider">in progress</span>
                </div>
                <p className="text-gray-400 text-sm">Creating technologies for rapid, on-demand transitions between alertness and sleep states.</p>
              </div>
              
              <div className="mb-8">
                <div className="flex items-center mb-2">
                  <h3 className="text-xl font-light">Enhance Cognitive Performance</h3>
                  <span className="ml-4 text-xs text-gray-500 uppercase tracking-wider">in progress</span>
                </div>
                <p className="text-gray-400 text-sm">Combining sleep optimization with cognitive enhancement to improve memory and focus.</p>
              </div>
            </div>
          </div>
        </section>

        <section id="technology" className="py-20">
          <div className="container mx-auto px-4 max-w-3xl">
            <h2 className="text-3xl font-bold mb-12">Technology</h2>
            <div className="space-y-12">
              <div>
                <h3 className="text-2xl font-light mb-4">Drugs</h3>
                <p className="text-lg mb-6">Substance S</p>

                <div className="text-sm">
                  <div className="py-3 border-t border-gray-800 grid grid-cols-2">
                    <span className="text-gray-400">Compound</span>
                    <span>Peptide</span>
                  </div>
                  <div className="py-3 border-t border-gray-800 grid grid-cols-2">
                    <span className="text-gray-400">Target</span>
                    <span>Neuropeptide S receptor (agonist/positive allosteric modulation)</span>
                  </div>
                  <div className="py-3 border-t border-gray-800 grid grid-cols-2">
                    <span className="text-gray-400">Effect</span>
                    <span>Enhanced arousal, reduced sleep need</span>
                  </div>
                  <div className="py-3 border-t border-gray-800 grid grid-cols-2">
                    <span className="text-gray-400">Potential</span>
                    <span>Natural short sleep replication, potent anxiolytic stimulant</span>
                  </div>
                  <div className="border-t border-gray-800"></div>
                </div>
              </div>
              <div>
                <h3 className="text-2xl font-light mb-4">Cybernetics</h3>

                <div className="mb-10">
                  <h4 className="text-xl font-light mb-4">Gland</h4>

                  <div className="text-sm mb-8">
                    <div className="py-3 border-t border-gray-800 grid grid-cols-2">
                      <span className="text-gray-400">Format</span>
                      <span>Implatable device</span>
                    </div>
                    <div className="py-3 border-t border-gray-800 grid grid-cols-2">
                      <span className="text-gray-400">System</span>
                      <span>Synthetic machine-interfacing cells secreting peptides</span>
                    </div>
                    <div className="py-3 border-t border-gray-800 grid grid-cols-2">
                      <span className="text-gray-400">Function</span>
                      <span>Circadian and sleep pressure regulation via targeted peptide secretion</span>
                    </div>
                    <div className="py-3 border-t border-gray-800 grid grid-cols-2">
                      <span className="text-gray-400">Potential</span>
                      <span>Greater daytime arousal + deeper, more efficient sleep
                      </span>
                    </div>
                    <div className="border-t border-gray-800"></div>
                  </div>
                </div>

                <div>
                  <h4 className="text-xl font-light mb-4">Nightcap</h4>

                  <div className="text-sm">
                    <div className="py-3 border-t border-gray-800 grid grid-cols-2">
                      <span className="text-gray-400">Format</span>
                      <span>Non-invasive wearable
                      </span>
                    </div>
                    <div className="py-3 border-t border-gray-800 grid grid-cols-2">
                      <span className="text-gray-400">System</span>
                      <span>Phase-locked acoustic stimulation (50dB) </span>
                    </div>
                    <div className="py-3 border-t border-gray-800 grid grid-cols-2">
                      <span className="text-gray-400">Function</span>
                      <span>SWS enhancement and coordination
                      </span>
                    </div>
                    <div className="py-3 border-t border-gray-800 grid grid-cols-2">
                      <span className="text-gray-400">Potential</span>
                      <span>Improved memory consolidation and cognitive flexibility</span>
                    </div>
                    <div className="border-t border-gray-800"></div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </section>

        <section id="updates" className="py-20 bg-gray-1000">
          <div className="container mx-auto px-4 max-w-3xl">
            <h2 className="text-3xl font-bold mb-8">Updates</h2>
            <p className="text-gray-400 mb-8">Stay informed about our latest breakthroughs and developments.</p>
            
            {!subscribed ? (
              <form onSubmit={handleSubmit} className="flex flex-col md:flex-row gap-4">
                <input
                  type="email"
                  placeholder="Your email address"
                  className="flex-grow px-4 py-3 bg-black border border-gray-700 text-white focus:outline-none focus:border-blue-500"
                  value={email}
                  onChange={(e) => setEmail(e.target.value)}
                  required
                />
                <button 
                  type="submit" 
                  className="px-6 py-3 bg-blue-600 text-white font-medium transition-colors hover:bg-blue-700"
                >
                  Subscribe
                </button>
              </form>
            ) : (
              <div className="bg-gray-800 p-6 text-center">
                <p className="text-xl font-light text-green-400 mb-2">Thank you for subscribing!</p>
                <p className="text-gray-400">We'll keep you updated on our latest developments.</p>
              </div>
            )}
          </div>
        </section>

        <section id="contact" className="py-20">
          <div className="container mx-auto px-4 max-w-3xl">
            <h2 className="text-3xl font-bold mb-8">Contact</h2>
            <p className="text-gray-400 mb-8">Interested in learning more about our work or potential collaborations?</p>
            
            <Link href="/contact" className="inline-block px-6 py-3 border border-white text-white font-medium transition-colors hover:bg-white hover:text-black">
              Get in touch
            </Link>
          </div>
        </section>
      </main>

      <footer className="py-6 text-center border-t border-gray-800">
        <p>&copy; 2025 Far Sleep Inc.</p>
      </footer>
    </div>
  )
}