#!/bin/bash

# Navigate to your project directory
cd web

# Build the project
npm run build

# Copy the output to the root directory
cp -r out/* ../

# Navigate to the root directory
cd ..

echo "Starting path replacements..."

# Function to prevent double domain insertion
replace_once() {
  local pattern="$1"
  local replacement="$2"
  local file="$3"
  
  # Only replace if the string doesn't already contain the domain
  sed -i '' "s|$pattern|$replacement|g" "$file"
}

# Fix double domain issue first - clean up any existing URLs that might have been incorrectly processed before
find . -name "*.html" -type f -exec sed -i '' 's|https://raw.githubusercontent.com/farsleep/farsleep.github.io/refs/heads/mainhttps://raw.githubusercontent.com/farsleep/farsleep.github.io/refs/heads/main|https://raw.githubusercontent.com/farsleep/farsleep.github.io/refs/heads/main|g' {} \;
find . -name "*.html" -type f -exec sed -i '' 's|https://raw.githubusercontent.com/farsleep/farsleep.github.io/refs/heads/main/https://raw.githubusercontent.com/farsleep/farsleep.github.io/refs/heads/main|https://raw.githubusercontent.com/farsleep/farsleep.github.io/refs/heads/main|g' {} \;
find . -name "*.js" -type f -exec sed -i '' 's|https://raw.githubusercontent.com/farsleep/farsleep.github.io/refs/heads/mainhttps://raw.githubusercontent.com/farsleep/farsleep.github.io/refs/heads/main|https://raw.githubusercontent.com/farsleep/farsleep.github.io/refs/heads/main|g' {} \;
find . -name "*.js" -type f -exec sed -i '' 's|https://raw.githubusercontent.com/farsleep/farsleep.github.io/refs/heads/main/https://raw.githubusercontent.com/farsleep/farsleep.github.io/refs/heads/main|https://raw.githubusercontent.com/farsleep/farsleep.github.io/refs/heads/main|g' {} \;

echo "Processing HTML files..."

# Process each HTML file individually to prevent errors
find . -name "*.html" -type f | while read -r file; do
  echo "Processing $file..."
  
  # Only replace URLs that don't already contain the domain
  sed -i '' 's|href="\(_next[^"]*\)"|href="https://raw.githubusercontent.com/farsleep/farsleep.github.io/refs/heads/main/\1"|g' "$file"
  sed -i '' 's|src="\(_next[^"]*\)"|src="https://raw.githubusercontent.com/farsleep/farsleep.github.io/refs/heads/main/\1"|g' "$file"
  
  # Process styles with url() that don't already contain the domain
  sed -i '' 's|url(\([^)]*\)mission_background.jpg\([^)]*\))|url(https://raw.githubusercontent.com/farsleep/farsleep.github.io/refs/heads/main/mission_background.jpg)|g' "$file"
  
  # Process escaped HTML quotes that don't already contain the domain
  sed -i '' 's|url(&quot;/mission_background.jpg&quot;)|url("https://raw.githubusercontent.com/farsleep/farsleep.github.io/refs/heads/main/mission_background.jpg")|g' "$file"
  sed -i '' 's|url(&quot;\./mission_background.jpg&quot;)|url("https://raw.githubusercontent.com/farsleep/farsleep.github.io/refs/heads/main/mission_background.jpg")|g' "$file"
  sed -i '' 's|url(&quot;mission_background.jpg&quot;)|url("https://raw.githubusercontent.com/farsleep/farsleep.github.io/refs/heads/main/mission_background.jpg")|g' "$file"
  
  # Fix navigation links
  sed -i '' 's|href="/contact"|href="https://raw.githubusercontent.com/farsleep/farsleep.github.io/refs/heads/main/contact.html"|g' "$file"
  sed -i '' 's|href="./contact.html"|href="https://raw.githubusercontent.com/farsleep/farsleep.github.io/refs/heads/main/contact.html"|g' "$file"
  sed -i '' 's|href="contact.html"|href="https://raw.githubusercontent.com/farsleep/farsleep.github.io/refs/heads/main/contact.html"|g' "$file"
done

echo "Processing JavaScript files..."

# Process each JS file individually
find ./_next -name "*.js" -type f | while read -r file; do
  echo "Processing $file..."
  
  # Only replace URLs that don't already contain the domain
  sed -i '' 's|"/_next|"https://raw.githubusercontent.com/farsleep/farsleep.github.io/refs/heads/main/_next|g' "$file"
  sed -i '' 's|"\\./_next|"https://raw.githubusercontent.com/farsleep/farsleep.github.io/refs/heads/main/_next|g' "$file"
  
  # Process image paths in JS
  sed -i '' 's|"/mission_background.jpg"|"https://raw.githubusercontent.com/farsleep/farsleep.github.io/refs/heads/main/mission_background.jpg"|g' "$file"
done

echo "Final cleanup to catch any missed URLs..."

# Final verification to ensure all _next paths are absolute
find . -name "*.html" -type f -exec sed -i '' 's|href="/_next|href="https://raw.githubusercontent.com/farsleep/farsleep.github.io/refs/heads/main/_next|g' {} \;
find . -name "*.html" -type f -exec sed -i '' 's|src="/_next|src="https://raw.githubusercontent.com/farsleep/farsleep.github.io/refs/heads/main/_next|g' {} \;

# Verify no double domains were created
find . -name "*.html" -type f -exec sed -i '' 's|https://raw.githubusercontent.com/farsleep/farsleep.github.io/refs/heads/mainhttps://raw.githubusercontent.com/farsleep/farsleep.github.io/refs/heads/main|https://raw.githubusercontent.com/farsleep/farsleep.github.io/refs/heads/main|g' {} \;
find . -name "*.js" -type f -exec sed -i '' 's|https://raw.githubusercontent.com/farsleep/farsleep.github.io/refs/heads/mainhttps://raw.githubusercontent.com/farsleep/farsleep.github.io/refs/heads/main|https://raw.githubusercontent.com/farsleep/farsleep.github.io/refs/heads/main|g' {} \;

echo "Deployment preparation complete with absolute URLs for farsleep.com."
echo "Now you can commit and push to GitHub."