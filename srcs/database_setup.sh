service mysql start

# phpmyadmin database 
echo "CREATE DATABASE ft_server;" | mysql -u root && \
echo "GRANT ALL ON ft_server.* TO 'root'@'localhost' WITH GRANT OPTION;" | mysql -u root && \
echo "FLUSH PRIVILEGES;" | mysql -u root && \
mysql < /var/www/localhost/phpmyadmin/sql/create_tables.sql && \
echo "GRANT SELECT, INSERT, UPDATE, DELETE ON phpmyadmin.* TO 'pma'@'localhost' IDENTIFIED BY 'password';" | mysql -u root

# wordpress database
echo "CREATE DATABASE wordpress DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;" | mysql -u root && \
echo "GRANT ALL ON wordpress.* TO 'wordpress_user'@'localhost' IDENTIFIED BY 'password';" | mysql -u root && \
echo "GRANT SELECT, INSERT, UPDATE, DELETE ON wordpress.* TO 'pma'@'localhost' IDENTIFIED BY 'password';" | mysql -u root && \
echo "FLUSH PRIVILEGES;" | mysql -u root
mysql < /tmp/wordpress.sql
