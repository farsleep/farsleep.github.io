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
# Fix CSS and JavaScript paths - comprehensive approach for all variations
find . -name "*.html" -type f -exec sed -i '' 's/href=["'"'"']\/_next/href="https:\/\/farsleep.com\/_next/g' {} \;
find . -name "*.html" -type f -exec sed -i '' 's/src=["'"'"']\/_next/src="https:\/\/farsleep.com\/_next/g' {} \;
find . -name "*.html" -type f -exec sed -i '' 's/href=["'"'"']\.?\/_next/href="https:\/\/farsleep.com\/_next/g' {} \;
find . -name "*.html" -type f -exec sed -i '' 's/src=["'"'"']\.?\/_next/src="https:\/\/farsleep.com\/_next/g' {} \;
find . -name "*.html" -type f -exec sed -i '' 's/href=["'"'"']_next/href="https:\/\/farsleep.com\/_next/g' {} \;
find . -name "*.html" -type f -exec sed -i '' 's/src=["'"'"']_next/src="https:\/\/farsleep.com\/_next/g' {} \;

# Fix preload/prefetch links which have a different format
find . -name "*.html" -type f -exec sed -i '' 's/\(rel=["'"'"']preload["'"'"'].*href=["'"'"']\)\/_next/\1https:\/\/farsleep.com\/_next/g' {} \;
find . -name "*.html" -type f -exec sed -i '' 's/\(rel=["'"'"']prefetch["'"'"'].*href=["'"'"']\)\/_next/\1https:\/\/farsleep.com\/_next/g' {} \;

# Fix inline styles with _next references
find . -name "*.html" -type f -exec sed -i '' 's/\/_next/https:\/\/farsleep.com\/_next/g' {} \;

# Fix all image paths (jpg, png, svg, etc.) - comprehensive approach
# Fix URLs in HTML attributes
find . -name "*.html" -type f -exec sed -i '' 's/src=["'"'"']\/\([^"'"'"']*\.jpg\)["'"'"']/src="https:\/\/farsleep.com\/\1"/g' {} \;
find . -name "*.html" -type f -exec sed -i '' 's/src=["'"'"']\.\/\([^"'"'"']*\.jpg\)["'"'"']/src="https:\/\/farsleep.com\/\1"/g' {} \;
find . -name "*.html" -type f -exec sed -i '' 's/src=["'"'"']\([^"'"'"'\/][^"'"'"']*\.jpg\)["'"'"']/src="https:\/\/farsleep.com\/\1"/g' {} \;

find . -name "*.html" -type f -exec sed -i '' 's/src=["'"'"']\/\([^"'"'"']*\.png\)["'"'"']/src="https:\/\/farsleep.com\/\1"/g' {} \;
find . -name "*.html" -type f -exec sed -i '' 's/src=["'"'"']\.\/\([^"'"'"']*\.png\)["'"'"']/src="https:\/\/farsleep.com\/\1"/g' {} \;
find . -name "*.html" -type f -exec sed -i '' 's/src=["'"'"']\([^"'"'"'\/][^"'"'"']*\.png\)["'"'"']/src="https:\/\/farsleep.com\/\1"/g' {} \;

find . -name "*.html" -type f -exec sed -i '' 's/src=["'"'"']\/\([^"'"'"']*\.svg\)["'"'"']/src="https:\/\/farsleep.com\/\1"/g' {} \;
find . -name "*.html" -type f -exec sed -i '' 's/src=["'"'"']\.\/\([^"'"'"']*\.svg\)["'"'"']/src="https:\/\/farsleep.com\/\1"/g' {} \;
find . -name "*.html" -type f -exec sed -i '' 's/src=["'"'"']\([^"'"'"'\/][^"'"'"']*\.svg\)["'"'"']/src="https:\/\/farsleep.com\/\1"/g' {} \;

# Fix URLs in CSS background images - different formats
find . -name "*.html" -type f -exec sed -i '' 's/url(["'"'"']\/\([^"'"'"']*\.jpg\)["'"'"'])/url("https:\/\/farsleep.com\/\1")/g' {} \;
find . -name "*.html" -type f -exec sed -i '' 's/url(["'"'"']\.\/\([^"'"'"']*\.jpg\)["'"'"'])/url("https:\/\/farsleep.com\/\1")/g' {} \;
find . -name "*.html" -type f -exec sed -i '' 's/url(["'"'"']\([^"'"'"'\/][^"'"'"']*\.jpg\)["'"'"'])/url("https:\/\/farsleep.com\/\1")/g' {} \;
find . -name "*.html" -type f -exec sed -i '' 's/url(\/\([^)]*\.jpg\))/url(https:\/\/farsleep.com\/\1)/g' {} \;
find . -name "*.html" -type f -exec sed -i '' 's/url(\.\/\([^)]*\.jpg\))/url(https:\/\/farsleep.com\/\1)/g' {} \;
find . -name "*.html" -type f -exec sed -i '' 's/url(\([^\/][^)]*\.jpg\))/url(https:\/\/farsleep.com\/\1)/g' {} \;

# Handle specific mission_background.jpg case
find . -name "*.html" -type f -exec sed -i '' 's/url(["'"'"']mission_background.jpg["'"'"'])/url("https:\/\/farsleep.com\/mission_background.jpg")/g' {} \;
find . -name "*.html" -type f -exec sed -i '' 's/url(mission_background.jpg)/url(https:\/\/farsleep.com\/mission_background.jpg)/g' {} \;
find . -name "*.html" -type f -exec sed -i '' 's/background-image:url(['"'"'"]\/mission_background.jpg['"'"'"])/background-image:url("https:\/\/farsleep.com\/mission_background.jpg")/g' {} \;
find . -name "*.html" -type f -exec sed -i '' 's/background-image:url(['"'"'"]\.\/mission_background.jpg['"'"'"])/background-image:url("https:\/\/farsleep.com\/mission_background.jpg")/g' {} \;
find . -name "*.html" -type f -exec sed -i '' 's/background-image:url(['"'"'"]mission_background.jpg['"'"'"])/background-image:url("https:\/\/farsleep.com\/mission_background.jpg")/g' {} \;

# Fix the HTML-escaped quotes format in inline styles
find . -name "*.html" -type f -exec sed -i '' 's/background-image:url(&quot;\/mission_background.jpg&quot;)/background-image:url("https:\/\/farsleep.com\/mission_background.jpg")/g' {} \;
find . -name "*.html" -type f -exec sed -i '' 's/background-image:url(&quot;\.\/mission_background.jpg&quot;)/background-image:url("https:\/\/farsleep.com\/mission_background.jpg")/g' {} \;
find . -name "*.html" -type f -exec sed -i '' 's/background-image:url(&quot;mission_background.jpg&quot;)/background-image:url("https:\/\/farsleep.com\/mission_background.jpg")/g' {} \;

# Fix &quot; escaped quotes for other image formats too
find . -name "*.html" -type f -exec sed -i '' 's/url(&quot;\/\([^&]*\.jpg\)&quot;)/url("https:\/\/farsleep.com\/\1")/g' {} \;
find . -name "*.html" -type f -exec sed -i '' 's/url(&quot;\/\([^&]*\.png\)&quot;)/url("https:\/\/farsleep.com\/\1")/g' {} \;
find . -name "*.html" -type f -exec sed -i '' 's/url(&quot;\/\([^&]*\.svg\)&quot;)/url("https:\/\/farsleep.com\/\1")/g' {} \;

# Fix navigation links
find . -name "*.html" -type f -exec sed -i '' 's/href=["'"'"']\/contact["'"'"']/href="https:\/\/farsleep.com\/contact.html"/g' {} \;
find . -name "*.html" -type f -exec sed -i '' 's/href=["'"'"']\.\/contact.html["'"'"']/href="https:\/\/farsleep.com\/contact.html"/g' {} \;
find . -name "*.html" -type f -exec sed -i '' 's/href=["'"'"']contact.html["'"'"']/href="https:\/\/farsleep.com\/contact.html"/g' {} \;

# Fix any references to root path (must be after other specific replacements)
find . -name "*.html" -type f -exec sed -i '' 's/href=["'"'"']\/["'"'"']/href="https:\/\/farsleep.com\/"/g' {} \;
find . -name "*.html" -type f -exec sed -i '' 's/href=["'"'"']\/\([^"'"'"']*\)["'"'"']/href="https:\/\/farsleep.com\/\1"/g' {} \;

# Fix paths in JS files that might reference resources
find ./_next -name "*.js" -type f -exec sed -i '' 's/\"\/_next/\"https:\/\/farsleep.com\/_next/g' {} \;
find ./_next -name "*.js" -type f -exec sed -i '' 's/\"\.\/\_next/\"https:\/\/farsleep.com\/_next/g' {} \;
find ./_next -name "*.js" -type f -exec sed -i '' 's/p\+\"\\/_next/p\+\"https:\/\/farsleep.com\/_next/g' {} \;

# Fix image references in JS files
find ./_next -name "*.js" -type f -exec sed -i '' 's/\"\([^"]*\.jpg\)\"/\"https:\/\/farsleep.com\/\1\"/g' {} \;
find ./_next -name "*.js" -type f -exec sed -i '' 's/\"\([^"]*\.png\)\"/\"https:\/\/farsleep.com\/\1\"/g' {} \;
find ./_next -name "*.js" -type f -exec sed -i '' 's/\"\([^"]*\.svg\)\"/\"https:\/\/farsleep.com\/\1\"/g' {} \;

echo "Deployment preparation complete with absolute URLs for farsleep.com. Now you can commit and push to GitHub."