# WordpressProjectRoadmap
Test of Project created in Wordpress with Roadmap scope

WordPress CI/CD Deployment ROADMAP Project
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

Nginx Configuration

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

    Enable the Server Block:

    sudo ln -s /etc/nginx/sites-available/refaeltest.kinsta.cloud /etc/nginx/sites-enabled/
    sudo nginx -t
    sudo systemctl reload nginx

Certbot SSL Installer

    Install Certbot and Nginx Plugin:

    sudo apt update
    sudo apt install certbot python3-certbot-nginx

    Obtain SSL Certificate:

    sudo certbot --nginx -d refaeltest.kinsta.cloud -d www.refaeltest.kinsta.cloud


Server Configuration (Optional) Documentation is provided for configuring Nginx to host the WordPress application. This includes:

Setting up server blocks. Configuring virtual hosts. Handling SSL renewal and termination. Repository The GitHub repository containing the CI/CD pipeline configuration and scripts can be found here.

cache-dependency-path: 'Wordpressproject/package-lock.json'
