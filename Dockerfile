FROM debian:buster

# to avoid prompts during installs
ENV DEBIAN_FRONTEND=noninteractive

# install nginx, mariadb, php and its extensions
RUN apt -y update && \
	apt -y upgrade && \
	apt -y install wget nginx mariadb-server \
	php php-fpm php-mysql php-curl php-gd php-intl php-mbstring php-soap php-xml php-xmlrpc php-zip

# create directory structure
COPY srcs/localhost /etc/nginx/sites-available
RUN mkdir -p /var/www/localhost/phpmyadmin /var/www/localhost/wordpress && \
	rm -Rf /etc/nginx/sites-enabled/* && \
	ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled && \
	chown -R www-data:www-data /var/www/* && chmod -R 755 /var/www/*

# phpmyadmin setup
RUN wget https://files.phpmyadmin.net/phpMyAdmin/4.9.5/phpMyAdmin-4.9.5-all-languages.tar.gz && \
	tar xvf phpMyAdmin-4.9.5-all-languages.tar.gz && \
	mv phpMyAdmin-4.9.5-all-languages/* /var/www/localhost/phpmyadmin && \
	mkdir -p /var/lib/phpmyadmin/tmp && \
	chown -R www-data:www-data /var/lib/phpmyadmin
COPY srcs/config.inc.php /var/www/localhost/phpmyadmin/config.inc.php

# database setup (permissions, phpmyadmin required tables/user)
COPY srcs/wordpress.sql srcs/database_setup.sh /tmp/
RUN sh /tmp/database_setup.sh

# ssl setup
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt \
	-subj "/C=FR/ST=Paris/L=City/O=ft_server inc./OU=Nothing/CN=localhost/emailAddress=admin@localhost.com" && \
	openssl dhparam -out /etc/nginx/dhparam.pem 1024
COPY srcs/self-signed.conf srcs/ssl-params.conf /etc/nginx/snippets/

# wordpress setup
COPY srcs/wordpress-5.4.tar.gz .
RUN tar xzvf wordpress-5.4.tar.gz
COPY srcs/wp-config.php wordpress/
RUN cp -a wordpress/. /var/www/localhost/wordpress

# http/s ports
EXPOSE 80 443

# start services
COPY srcs/run-services.sh srcs/set-autoindex.sh ./
CMD ["sh", "run-services.sh"]


# To build the image, run 'docker build --ulimit nofile=1024 -t mbourand/ft_server:1.0 .'
# To run the container, run 'docker run -p 80:80 -p 443:443 -d mbourand/ft_server:1.0'
# To run the container without autoindex, run 'docker run -p 80:80 -p 443:443 -d -e AUTOINDEX=off mbourand/ft_server:1.0'
