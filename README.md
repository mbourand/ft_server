# ft_server
Projet réalisé dans le cadre du cursus de l'école 42.

Ce dépôt contient les fichiers nécessaires pour faire fonctionner un serveur web sous nginx avec phpmyadmin et wordpress
utilisant le protocole SSL.

Pour faire fonctionner le projet, vous aurez besoin d'installer [docker](https://www.docker.com/get-started) pour votre OS

### Commandes

- Pour construire l'image :
```docker build -t mbourand/ft_server:1.0 .```

- Pour démarrer le container :
```docker run -p 80:80 -p 443:443 -d mbourand/ft_server:1.0```

- Pour démarrer le container sans index :
```docker run -p 80:80 -p 443:443 -d -e AUTOINDEX=off mbourand/ft_server:1.0```

## Screenshots

- Index d'nginx

<img src="https://i.imgur.com/wF1i1CE.png" width="764">

- Index de Phpmyadmin

<img src="https://i.imgur.com/2zX7fXl.png" width="764">

- Tableau de bord de Wordpress

<img src="https://i.imgur.com/PObFYUR.png" width="764">
