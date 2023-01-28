#!/bin/bash/

echo ":::: Let me speak from my heart ...."
docker ps -q

echo ":::: Downloading latest WP from https://wordpress.org/"
wget https://wordpress.org/latest.zip

echo ":::: Unzip latest WP ::::"
unzip -o latest.zip
rm -rf html/
ls -la
mv -f wordpress/ html/

echo ":::: Delete temp-files ::::"
rm -rf latest.zip wordpress

cd html/
# Prepare wp-config.php
cp wp-config-sample.php wp-config.php
echo ":::: wp stage 1"

# Setup db in wp-config.php
sed -i "s/database_name_here/wp/g" wp-config.php
sed -i "s/username_here/root/g" wp-config.php
sed -i "s/password_here/expim/g" wp-config.php
sed -i "s/localhost/mysql:3306/g" wp-config.php
echo ":::: wp stage 2"

# Update permissions for wp-config.php
chmod 755 wp-config.php
echo ":::: wp stage 3"

# Start docker-compose up
echo ":::: Start docker-compose.yml ::::"
cd ../
sudo docker-compose up -d

echo ":::: Plz wait few seconds ::::"
sleep 15
echo ":::: Okey, go! ::::"
echo ":::: Exec in docker ::::"
docker exec -it expim-web bash -c "my_script/wpress.sh"

echo ":::: Looks good..."