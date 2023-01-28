#!/bin/bash/

echo ":::: Let me speak from my heart ...."
docker ps -q

echo ":::: Downloading latest wp from https://wordpress.org/"
wget https://wordpress.org/latest.zip

echo ":::: Unzip latest WP ::::"
unzip -o latest.zip
rm -rf html/
mv -f wordpress/ html/

echo ":::: Delete tempfiles ::::"
rm -rf latest.zip wordpress

cd html/
# Prepare wp-config.php
cp wp-config-sample.php wp-config.php
echo ":::: stage 1"

# Setup db in wp-config.php
sed -i "s/database_name_here/expim/g" /wp-config.php
sed -i "s/username_here/expim/g" /wp-config.php
sed -i "s/password_here/expimpw/g" /wp-config.php
sed -i "s/localhost/mysql:3306/g" /wp-config.php
echo ":::: stage 2"

# Update permissions for wp-config.php
chmod 755 /wp-config.php
echo ":::: stage 3"

# Start docker-compose up
echo ":::: Start docker-compose.yml ::::"
cd ../
sudo docker-compose up


#sleep 10
#docker exec expim-web /var/www/script/wpress.sh