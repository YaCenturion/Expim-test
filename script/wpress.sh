#!/bin/bash

#apt-get update
#apt-get upgrade -y

chown -R www-data:www-data /var/www/html

# Download & install WP-cli
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv -f wp-cli.phar /usr/local/bin/wp
echo ":::: wp stage 4"

# Waiting for mysql container
sleep 10
#echo "RUN!!!!"

# Automated install WP
## wp core version --allow-root --extra
wp core install --allow-root --url=localhost --title=Expim_WordPress --admin_user=admin --admin_password=expim --admin_email=admin@expim.co.il
echo "====================== >>>> <<<< ======================="
echo "Well, automating installation WP for Expim successfully."