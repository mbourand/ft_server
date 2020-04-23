FROM debian:buster

# to avoid prompts during installs
ENV DEBIAN_FRONTEND=noninteractive

RUN apt -y update && apt -y upgrade

# install nginx, mariadb, php and its extensions
RUN apt -y install wget
RUN apt -y install nginx
RUN apt -y install mariadb-server
RUN apt -y install php php-fpm php-mysql php-curl php-gd php-intl php-mbstring php-soap php-xml php-xmlrpc php-zip
RUN apt -y install curl

# create directory structure
RUN mkdir -p /var/www/localhost/phpmyadmin /var/www/localhost/wordpress
COPY srcs/localhost /etc/nginx/sites-available
RUN rm -Rf /etc/nginx/sites-enabled/* && \
	ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled
RUN chown -R www-data:www-data /var/www/* && chmod -R 755 /var/www/*

# phpmyadmin setup
RUN wget https://files.phpmyadmin.net/phpMyAdmin/4.9.5/phpMyAdmin-4.9.5-all-languages.tar.gz && \
	tar xvf phpMyAdmin-4.9.5-all-languages.tar.gz && \
	mv phpMyAdmin-4.9.5-all-languages/* /var/www/localhost/phpmyadmin && \
	mkdir -p /var/lib/phpmyadmin/tmp && \
	chown -R www-data:www-data /var/lib/phpmyadmin
COPY srcs/config.inc.php /var/www/localhost/phpmyadmin/config.inc.php

# database setup (permissions, phpmyadmin required tables/user)
COPY srcs/wordpress.sql /tmp
COPY srcs/database_setup.sh /tmp
RUN sh /tmp/database_setup.sh

# ssl setup
 RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt \
	-subj "/C=FR/ST=Paris/L=City/O=ft_server inc./OU=Nothing/CN=localhost/emailAddress=admin@localhost.com" && \
	openssl dhparam -out /etc/nginx/dhparam.pem 1024
COPY srcs/self-signed.conf /etc/nginx/snippets/self-signed.conf
COPY srcs/ssl-params.conf /etc/nginx/snippets/ssl-params.conf

# wordpress setup
COPY srcs/wordpress-5.4.tar.gz .
RUN tar xzvf wordpress-5.4.tar.gz
COPY srcs/wp-config.php wordpress/
RUN cp -a wordpress/. /var/www/localhost/wordpress

# http/s ports
EXPOSE 80 443

# start services
COPY srcs/run-services.sh /tmp
CMD ["sh", "/tmp/run-services.sh"]
