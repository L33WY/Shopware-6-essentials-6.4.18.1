FROM dockware/essentials:latest

COPY ./shop/* /var/www/html/

WORKDIR /var/www/html

RUN composer install --no-scripts

RUN sudo chown www-data:www-data /var/www/html -R