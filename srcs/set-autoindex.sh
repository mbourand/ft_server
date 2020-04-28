if [ "$AUTOINDEX" == "off" ]
then
	sed -i 's/autoindex on/autoindex off/g' /etc/nginx/sites-available/localhost
elif [ "$AUTOINDEX" == "on" ]
then
	sed -i 's/autoindex off/autoindex on/g' /etc/nginx/sites-available/localhost
fi
