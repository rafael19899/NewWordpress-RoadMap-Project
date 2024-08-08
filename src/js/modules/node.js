const fs = require('fs');
const path = './src/js/modules';

fs.readdir(path, (err, files) => {
  if (err) {
    return console.log('Unable to scan directory: ' + err);
  } 
  files.forEach(file => {
    console.log(file);
  });
});
