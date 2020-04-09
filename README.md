# WIP ft_server

Projet réalisé dans le cadre du cursus de l'école 42.

## Contenu
Ce dépôt contient les fichiers nécessaires pour lancer un serveur local dans un container Docker.
Les processus installés dans le container sont nginx, phpMyAdmin et wordpress.
Le protocole SSL est utilisé.

## Utilisation
- Installer Docker
- Ouvrir un terminal
- Lancer cette commande pour créer l'image ```docker build -t mbourand/ft_server:1.0```
- Lancer cette commande pour lancer le container ```docker run -p 80:80 -p 443:443 -d mbourand/ft_server:1.0```

## Objectifs du sujet
Ce sujet à pour but de vous faire découvir découvrir l’administration système en vous
sensibilisant a l’importance de l’utilisation de scripts pour automatiser vos taches. Pour ce
faire, nous allons vous faire découvrir la technologie "Docker" afin de vous faire installer
un server web complet, qui sera capable de faire tourner plusieurs services, tel qu’un
Wordpress, Phpmyadmin, ainsi qu’une base de donnée.
