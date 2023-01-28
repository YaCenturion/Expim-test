#!/bin/bash

# Update the system
apt-get update
#sudo apt-get upgrade -y

chown -R www-data:www-data /var/www/html

# # # # Prepare wp-config.php
# # # cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
# # # echo ":::: stage 1"

# # # # Setup db in wp-config.php
# # # sed -i "s/database_name_here/expimwp/g" /var/www/html/wp-config.php
# # # sed -i "s/username_here/expim/g" /var/www/html/wp-config.php
# # # sed -i "s/password_here/wpexpimpw/g" /var/www/html/wp-config.php
# # # sed -i "s/localhost/mysql:3306/g" /var/www/html/wp-config.php
# # # echo ":::: stage 2"

# # # # Update permissions for wp-config.php
# # # chmod 755 /var/www/html/wp-config.php
# # # echo ":::: stage 3"

# Download WP-cli
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp
echo ":::: stage 4"

# Automated install WP
### wp core install --allow-root --url=http://localhost/ --title=Expim_WordPress --admin_user=admin --admin_password=qwerty --admin_email=admin@expim.co.il
#echo ":::: stage 5"
#echo "Well done!!!!!!"