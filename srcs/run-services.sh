bash set-autoindex.sh
service php7.3-fpm start
service mysql start
nginx -g "daemon off;"
