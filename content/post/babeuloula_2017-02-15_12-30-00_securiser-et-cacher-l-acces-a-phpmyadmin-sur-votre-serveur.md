+++
date = "2017-02-15T12:30:00+00:00"
draft = false
title = "Sécuriser et cacher l'accès à phpMyAdmin sur votre serveur"
slug = "securiser-et-cacher-l-acces-a-phpmyadmin-sur-votre-serveur"
tags = ["Base de données","Linux","PHP","Sécurité","Serveur","SQL","Tutorial","Tutoriaux"]
image = "https://www.babeuloula.fr/images/blog/head/securiser-et-cacher-l-acces-a-phpMyAdmin-sur-votre-serveur.jpg"
comments = true
share = true
author = "BaBeuloula"
description = "Lors de l'installation d'un serveur web, il est important de sécuriser un minium et cacher l'accès à phpMyAdmin"
+++

Après l'installation de votre serveur web sous Linux, vous allez sans doute vouloir gérer vos bases de données via phpMyAdmin. Mais par défaut, après son installation il est important de sécuriser un minium et cacher l'accès à phpMyAdmin.

Commençons par supprimer le dossier **setup** qui permet la configuration de base 

``` bash
rm -rf /usr/share/phpmyadmin/setup
```

Puis, afin d'éviter que l'accès à **phpMyAdmin** soit dispo sur l'ensemble de vos **VirtualHost**, il faut supprimer l'alias qui dans le fichier `/etc/phpmyadmin/apache.conf` :

``` plaintext
#Alias /phpmyadmin /usr/share/phpmyadmin
```

Et afin pour terminé, rajouter un lien symbolique un seul **VirtualHost** ou directement derrière l'adresse IP de votre serveur :

``` bash
ln -s /usr/share/phpmyadmin/ /var/www/phpmyadmin
```

Ce que je viens de vous montrer ne permet de pas de sécuriser **phpMyAdmin** de A à Z mais au moins il sera un peu plus sécurisé.

Sinon, vous pouvez aussi télécharger [**Adminer**](https://www.adminer.org/). Il vous permet de gérer vos bases de données mais sans installation, juste avec un seul fichier à placer où vous voulez et avec le nom que vous voulez.