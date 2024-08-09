# WordpressProjectRoadmap

# Test of Project created in Wordpress with Roadmap scope

# WordPress CI/CD Deployment ROADMAP Project
This repository project process for a default WordPress project using CI/CD pipelines. The deployment process is automated using GitHub Actions, and includes building theme assets, deploying the application to a cloud server, best practices for Nginx, and automating database backups.

Table of Contents
Project Overview
CI/CD Pipeline Setup
Backup Automation
Optional Enhancements
Server Configuration
Submission Details
Evaluation Criteria
Build Theme Assets Install dependencies and build SCSS & JS assets. Deploy Application Use Rsync or Git to deploy the application to the cloud server. Backup Script A bash script is provided to automate the process of taking regular backups of the MySQL database. The script is customizable and can be run manually or scheduled using a cron job.

# Installation of Webpack:
First, ensure you have a fresh version of Node.js installed (preferably the Long Term Support (LTS) release).
Open your project directory in the terminal.
To install Webpack locally (recommended for most projects), run:
npm install --save-dev webpack
This command installs Webpack as a development dependency in your project.
Creating a Webpack Configuration:
Create a webpack.config.js file in your project root. This file will define how Webpack bundles your assets.
Configure your entry point (usually your main JavaScript file) and output settings (where the bundled files will be saved).
Running Webpack:
Add an npm script to your package.json file:
JSON

"scripts": {
  "build": "webpack --config webpack.config.js"
}

To build your assets, run:

npm run build

This will bundle your JavaScript files and create an output file (usually named bundle.js).

Using Webpack in Your Project:
Include the generated bundle.js in your HTML file:
HTML

<script src="dist/bundle.js"></script>

Install Loaders:
To handle SCSS files, install the necessary loaders:
npm install --save-dev style-loader css-loader sass-loader

# Configure Webpack for SCSS:
In your webpack.config.js, add a module rule for compiling SCSS:
JavaScript

module.exports = {
  // ...
  module: {
    rules: [
      {
        test: /\.scss$/,
        use: [
          'style-loader', // Inject styles into DOM
          'css-loader',   // Convert CSS into CommonJS
          'sass-loader'   // Compile Sass to CSS
        ]
      }
    ]
  }
};
AI-generated code. Review and use carefully. More info on FAQ.
Entry Points:
Specify your JavaScript entry points (e.g., main.js, app.js).
Webpack will bundle these files along with any imported SCSS files.
Run Webpack:
Add an npm script to your package.json:
JSON

"scripts": {
  "build": "webpack --config webpack.config.js"
}
AI-generated code. Review and use carefully. More info on FAQ.

To build your assets, run:
npm run build

Now, when you run the build script, Webpack will compile both your SCSS and JavaScript files into the specified output directory.

# Nginx Configuration

    Install Nginx:

    sudo apt update
    sudo apt install nginx

    Configure Server Blocks: Create a new server block configuration file for your domain:

    sudo nano /etc/nginx/sites-available/refaeltest.kinsta.cloud

    Add the following configuration:

    server {
        listen 80;
        server_name refaeltest.kinsta.cloud www.refaeltest.kinsta.cloud;

        root /home/refaeltest/public;
        index index.php index.html index.htm;

        location / {
            try_files $uri $uri/ /index.php?$args;
        }

        location ~ \.php$ {
            include snippets/fastcgi-php.conf;
            fastcgi_pass unix:/var/run/php/php7.4-fpm.sock;
        }

        location ~ /\.ht {
            deny all;
        }
    }

#    Enable the Server Block:

    sudo ln -s /etc/nginx/sites-available/refaeltest.kinsta.cloud /etc/nginx/sites-enabled/
    sudo nginx -t
    sudo systemctl reload nginx

# Certbot SSL Installer

    Install Certbot and Nginx Plugin:

    sudo apt update
    sudo apt install certbot python3-certbot-nginx

    Obtain SSL Certificate:

    sudo certbot --nginx -d refaeltest.kinsta.cloud -d www.refaeltest.kinsta.cloud


Server Configuration (Optional) Documentation is provided for configuring Nginx to host the WordPress application. This includes:

Setting up server blocks. Configuring virtual hosts. Handling SSL renewal and termination. Repository The GitHub repository containing the CI/CD pipeline configuration and scripts can be found here.

echo "Installation & Server completed successfully!"
