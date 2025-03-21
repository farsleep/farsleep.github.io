/** @type {import('next').NextConfig} */
const nextConfig = {
  output: 'export',
  // GitHub Pages uses a subdirectory for user sites
  // If your repo is username.github.io, you can remove this
  images: {
    unoptimized: true,
  },
}

module.exports = nextConfig
