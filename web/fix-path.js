const fs = require('fs');
const path = require('path');

const directory = 'out';

function processFile(filePath) {
  fs.readFile(filePath, 'utf8', (err, data) => {
    if (err) {
      console.error(`Error reading file ${filePath}:`, err);
      return;
    }

    // Replace all instances of /_next/ with _next/
    let result = data.replace(/\/_next\//g, '_next/');
    
    // Fix the background image path
    result = result.replace(/url\(["']?\/mission_background\.jpg["']?\)/g, 'url("mission_background.jpg")');
    
    // Fix contact page routing (change /contact to contact.html)
    result = result.replace(/href=["']\/contact["']/g, 'href="contact.html"');

    fs.writeFile(filePath, result, 'utf8', (err) => {
      if (err) {
        console.error(`Error writing file ${filePath}:`, err);
      } else {
        console.log(`Fixed paths in ${filePath}`);
      }
    });
  });
}

function walkDir(dir) {
  fs.readdir(dir, (err, files) => {
    if (err) {
      console.error(`Error reading directory ${dir}:`, err);
      return;
    }

    files.forEach(file => {
      const filePath = path.join(dir, file);
      
      fs.stat(filePath, (err, stats) => {
        if (err) {
          console.error(`Error getting stats for ${filePath}:`, err);
          return;
        }

        if (stats.isDirectory()) {
          walkDir(filePath);
        } else if (stats.isFile() && (filePath.endsWith('.html') || filePath.endsWith('.js'))) {
          processFile(filePath);
        }
      });
    });
  });
}

// Make sure the mission_background.jpg is in the right place
const sourceImagePath = path.join('public', 'mission_background.jpg');
const destImagePath = path.join('out', 'mission_background.jpg');

if (fs.existsSync(sourceImagePath)) {
  fs.copyFile(sourceImagePath, destImagePath, (err) => {
    if (err) {
      console.error('Error copying background image:', err);
    } else {
      console.log('Background image copied to output directory');
    }
  });
} else {
  console.warn('Warning: mission_background.jpg not found in public directory!');
}

walkDir(directory);
console.log('Processing complete. Check the HTML files in the "out" directory.');
