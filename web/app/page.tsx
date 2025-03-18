import Link from 'next/link'

export default function Home() {
  return (
    <div className="min-h-screen bg-black text-white flex flex-col font-helvetica">
      <header className="p-6 flex justify-between items-center">
        <div>
          <span className="font-bold text-2xl">Far Sleep Inc</span>
        </div>
        <nav>
          <ul className="flex space-x-6">
            <li><Link href="#mission" className="hover:text-gray-400 transition-colors">Mission</Link></li>
            <li><Link href="#technology" className="hover:text-gray-400 transition-colors">Technology</Link></li>
            <li><Link href="#milestones" className="hover:text-gray-400 transition-colors">Milestones</Link></li>
          </ul>
        </nav>
      </header>

      <main className="flex-grow">
        <section 
          className="h-screen flex flex-col justify-center items-center text-center px-4 relative"
          style={{
            backgroundImage: 'url("/mission_background.jpg")',
            backgroundSize: 'cover',
            backgroundPosition: 'center 70px',
            backgroundRepeat: 'no-repeat'
          }}
        >
          <div className="absolute inset-0 bg-black bg-opacity-60"></div>
          <div className="relative z-10">
            <h1 className="text-5xl md:text-7xl font-bold mb-6">Compress Human Sleep</h1>
            <p className="text-xl md:text-2xl mb-16">Creating time for humanity to do awesome things</p>
          </div>
        </section>

        <section className="py-20">
          <div className="container mx-auto px-4 max-w-3xl">
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
            <h2 className="text-3xl font-bold mb-12">Our Mission</h2>
            <ul className="space-y-8">
              <li className="text-xl">Compress sleep requirements</li>
              <li className="text-xl">Enable sleeping and waking at will</li>
              <li className="text-xl">Enhance physical and cognitive performance</li>
            </ul>
          </div>
        </section>

        <section id="technology" className="py-20">
          <div className="container mx-auto px-4 max-w-3xl">
            <h2 className="text-3xl font-bold mb-12">Technology</h2>
            <div className="space-y-12">
              <div>
                <h3 className="text-2xl font-light mb-4">Stimulants</h3>
                <p className="text-lg">Neuropeptide S receptor agonists</p>
              </div>
              <div>
                <h3 className="text-2xl font-light mb-4">Cybernetics</h3>
                <p className="text-lg">Integrated pharmacological + neuromodulatory control of sleep</p>
              </div>
            </div>
          </div>
        </section>

        <section id="milestones" className="py-20">
          <div className="container mx-auto px-4 max-w-3xl">
            <h2 className="text-3xl font-bold mb-12">Milestones</h2>
            <ul className="space-y-8">
              <li className="text-xl">Develop stimulants that enhance sleep quality</li>
              <li className="text-xl">Develop non-invasive cybernetics that enhance sleep quality</li>
            </ul>
          </div>
        </section>
      </main>

      <footer className="py-6 text-center">
        <p>&copy; 2025 Far Sleep Inc.</p>
      </footer>
    </div>
  )
}
