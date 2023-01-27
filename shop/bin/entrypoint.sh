#!/usr/bin/env sh

statusDateTime=$(date '+%d-%m-%Y %H:%M:%S')

echo "----------------------------------"
echo "$statusDateTime Run composer install"
echo "----------------------------------"

composer install --no-scripts


echo "----------------------------------"
echo "$statusDateTime Ensure correct file owner"
echo "----------------------------------"

sudo chown www-data:www-data /var/www/html -R


echo "----------------------------------"
echo "$statusDateTime Install new system"
echo "----------------------------------"

bin/console system:install --basic-setup --shop-name='Test Shop' --shop-locale='pl-PL'  --shop-currency='PLN' --force --create-database


echo "----------------------------------"
echo "$statusDateTime Build Storefront"
echo "----------------------------------"

./bin/build-storefront.sh


echo "----------------------------------"
echo "$statusDateTime Shop set up completed"
echo "----------------------------------"