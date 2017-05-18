+++
date = "2017-03-23T17:00:07+00:00"
draft = false
title = "Installer Apache HTTP/2 sur un serveur web Ubuntu 14.04"
slug = "installer-apache-http-2-sur-un-serveur-web-ubuntu-14-04"
tags = ["Linux","Serveur","Tutorial","Tutoriaux","Ubuntu"]
image = "https://www.babeuloula.fr/images/blog/head/installer-apache-http-2-sur-un-serveur-web-ubuntu-14-04.jpg"
comments = true
share = true
author = "BaBeuloula"
description = "Depuis sa mise en place en 1997, le protocole HTTP n'avait pas (ou peu) évolué. Mais en 2014, il a subit une grosse mise à jour et passe à sa version 2 (HTTP/2)"
+++

Depuis sa mise en place en 1997, le protocole **HTTP** n'avait pas (ou peu) évolué. Mais en 2014, il a subit une grosse mise à jour et passe à sa version 2 (**HTTP/2**).

Pour ce tuto, je pars du principe que vous avez déjà votre serveur d'installer avec **HTTP/1.1**.

Par contre, il faut absolument que vous ayez un certificat SSL sur votre site pour que cela fonctionne. Le strandard ne l'impose pas mais les navigateurs récents, eux, l'imposent. Le plus simple reste de mettre en place [Let's Encrypt](https://www.letsencrypt.org/).

## Installation du repository
Pour commencer, on va ajouter le dépôt à notre serveur. Oui, il faut l'ajouter car sous **Ubuntu 14.04**, **HTTP/2** n'est pas encore un paquet stable et officiel.

``` shell
apt-get install python-software-properties
add-apt-repository -y ppa:ondrej/apache2
apt-key update
apt-get update
```

## Installation du module
Maintenant que le repository est ajouté il faut installer le module à notre serveur.

La commande suivante, va faire la mise à jour du paquet, et uniquement ce paquet.
``` shell
apt-get --only-upgrade install apache2
```

## Activation du module
Tout est installé, parfait. Il faut néanmoins activer le module dans apache pour qu'il soit fonctionnel.
``` shell
a2enmod http2
```

Mais pour qu'apache sache qu'il doit utiliser **HTTP/2**, il faut lui spécifier dans sa configuration
``` shell
nano /etc/apache2/apache2.conf

# Ajoutez la ligne en fin de fichier
Protocols h2 http/1.1
```

## Redémarrage d'apache
Tout est OK, il faut maintenant relancer le service apache pour que tout soit pris en compte.
``` shell
service apache2 restart
```

Votre serveur supporte maintenant **HTTP/2**. Vous pouvez tester votre configuration ici : [https://tools.keycdn.com/http2-test](https://tools.keycdn.com/http2-test)
## Source

[Wikipédia - Hypertext Transfer Protocol/2](https://fr.wikipedia.org/wiki/Hypertext_Transfer_Protocol/2)

[Korben.info - Installer et activer HTTP2 sur Apache2](https://korben.info/installter-activer-http2-apache2.html)

[Dad Computer Club - Apache HTTP/2 Web Server Setup on Ubuntu 14.04](https://www.dadcomputerclub.com/ubuntu-14-04-3-apache-http-2-web-server-setup/)