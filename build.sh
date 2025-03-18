#!/bin/bash

# Navigate to your project directory
cd web

# Build the project
npm run build

# Copy the output to the root directory
cp -r out/* ../

# Navigate to the root directory
cd ..

# Replace all resource paths with absolute paths using farsleep.com domain
# Fix CSS and JavaScript paths
find . -name "*.html" -type f -exec sed -i '' 's/\(href=\|src=\)["'"'"']\/\?_next/\1"https:\/\/farsleep.com\/_next/g' {} \;
find . -name "*.html" -type f -exec sed -i '' 's/\(href=\|src=\)["'"'"']\.\/_next/\1"https:\/\/farsleep.com\/_next/g' {} \;
find . -name "*.html" -type f -exec sed -i '' 's/\(href=\|src=\)["'"'"']_next/\1"https:\/\/farsleep.com\/_next/g' {} \;

# Fix background image paths
find . -name "*.html" -type f -exec sed -i '' 's/url(["'"'"']\/mission_background.jpg["'"'"'])/url("https:\/\/farsleep.com\/mission_background.jpg")/g' {} \;
find . -name "*.html" -type f -exec sed -i '' 's/url(["'"'"']\.\/mission_background.jpg["'"'"'])/url("https:\/\/farsleep.com\/mission_background.jpg")/g' {} \;
find . -name "*.html" -type f -exec sed -i '' 's/url(["'"'"']mission_background.jpg["'"'"'])/url("https:\/\/farsleep.com\/mission_background.jpg")/g' {} \;

# Fix navigation links
find . -name "*.html" -type f -exec sed -i '' 's/href=["'"'"']\/contact["'"'"']/href="https:\/\/farsleep.com\/contact.html"/g' {} \;
find . -name "*.html" -type f -exec sed -i '' 's/href=["'"'"']\.\/contact.html["'"'"']/href="https:\/\/farsleep.com\/contact.html"/g' {} \;
find . -name "*.html" -type f -exec sed -i '' 's/href=["'"'"']contact.html["'"'"']/href="https:\/\/farsleep.com\/contact.html"/g' {} \;

# Fix any references to root path
find . -name "*.html" -type f -exec sed -i '' 's/href=["'"'"']\\/href="https:\/\/farsleep.com\//g' {} \;
find . -name "*.html" -type f -exec sed -i '' 's/href=["'"'"']\/["'"'"']/href="https:\/\/farsleep.com\/"/g' {} \;

# Fix paths in JS files that might reference resources
find ./_next -name "*.js" -type f -exec sed -i '' 's/\"\/_next/\"https:\/\/farsleep.com\/_next/g' {} \;
find ./_next -name "*.js" -type f -exec sed -i '' 's/\"\.\/\_next/\"https:\/\/farsleep.com\/_next/g' {} \;

echo "Deployment preparation complete with absolute URLs for farsleep.com. Now you can commit and push to GitHub."
