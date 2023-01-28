#!/usr/bin/env sh

statusDateTime=$(date '+%d-%m-%Y %H:%M:%S')

echo "----------------------------------"
echo "$statusDateTime Load .env variables"
echo "----------------------------------"

set -a
. "$APACHE_DOCROOT/../.env"
set +a

if [ "$APP_ENV" != "prod" ] && [ "$APP_ENV" != "PROD" ]; then

echo "----------------------------------"
echo "$statusDateTime Load .env.dev variables"
echo "----------------------------------"

set -a
. "$APACHE_DOCROOT/../.env.dev"
set +a
fi

echo "APP_ENV: $APP_ENV"
echo "SHOP_LOCALE: $SHOP_LOCALE"
echo "SHOP_CURRENCY: $SHOP_CURRENCY"
echo "DATABASE_URL: $DATABASE_URL"