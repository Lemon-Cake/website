+++
date = "2016-10-06T12:00:21+00:00"
draft = false
title = "Installer CozyCloud en parallèle d'apache sur un serveur Linux"
slug = "installer-cozycloud-en-parallele-d-apache-sur-un-serveur-linux"
tags = ["Linux","Serveur","Tutorial","Tutoriaux"]
image = "https://www.babeuloula.fr/images/blog/head/installer-cozycloud-en-parallele-d-apache-sur-un-serveur-linux.jpg"
comments = true
share = true
author = "BaBeuloula"
description = "Comment installer facilement Cozy Cloud en parallèle d'une installation Apache"
+++

[**Cozy Cloud**](https://cozy.io/fr/) est un serveur de données personnelles où vous pouvez installer plusieurs applications, comme par exemple :
- Un webmail
- Un agenda
- Un système de todo list ...

Il est même possible, via l'[application](https://play.google.com/store/apps/details?id=io.cozy.files_client&hl=fr) smartphone et tablette, de faire comme avec Dropbox, d'envoyer directement ses photos sur votre serveur.

## A propos

[![Accueil Cozy](//www.babeuloula.fr/images/cozy-cloud/Home.png)](//www.babeuloula.fr/images/cozy-cloud/Home.png)

> Cozy est une plateforme open source et auto-hébergée de gestion des données personnelles. Elle transforme le serveur personnel en quelque chose de nouveau. La suite d'application de base de Cozy permet à l'utilisateur d'héberger, partager et synchroniser des fichiers et des images, mais aussi de garder un œil sur ses rendez-vous et contacts, et de gérer plusieurs comptes emails. Des applications tierces disponibles via un marché applicatif dédié peuvent être utilisées pour étendre les fonctionnalités par défaut de Cozy, incluant des applications pour lire des flux RSS, gérer des tâches, héberger un blog, etc.

> Ce qui rend Cozy unique, c'est sa capacité à agréger les données personnelles des utilisateurs depuis diverses sources, grâce aux connecteurs. Par exemple, Cozy peut extraire et traiter des données bancaires grâce à ses connecteurs dédiés pour aider l'utilisateur à gérer ses finances.

> La simplicité et la facilité d'utilisation sont au coeur de la conception de Cozy. L'interface simple et épurée des applications les rend très faciles à utiliser, et n'importe quel utilisateur peut les prendre en main en un rien de temps. La maintenance de Cozy est également très simple, et l'interface d'administration permet de mettre à jour aisément la plateforme et les applications.

Source : [https://cozy.io/fr/press/](https://cozy.io/fr/press/)

## Installation

L'installation que je propose se fait sur un serveur vierge. Donc à vous de modifier les commandes si vous avez déjà certaines des librairies.

### Prérequis

- Un serveur sous Linux *(j'ai testé sous Ubuntu 16.04 cela ne fonctionne pas encore mais sous Ubuntu 14.04 c'est parfait)*
- Une connexion SSH au serveur
- Connaître un minimum la gestion d'un serveur

### Installation des librairies nécessaires

``` shell
apt-get update
apt-get dist-upgrade -y
apt-get install -y apt-transport-https
```

On ajoute le dépôt de **Cozy** à notre système

``` shell
curl -s https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add -
echo 'deb https://deb.nodesource.com/node_4.x trusty main' > /etc/apt/sources.list.d/nodesource.list
curl -s https://ubuntu.cozycloud.cc/cozy.gpg.key | apt-key add -
echo 'deb https://ubuntu.cozycloud.cc/debian trusty cozy' > /etc/apt/sources.list.d/cozy.list
apt-get update
```

Les dépendances **Cozy**. Lors de l'installation, il vous proposera d'installer un certificat SSL. Je vous conseille d'utiliser **[Let's Encrypt](https://letsencrypt.org/)** qui vous permet de générer des certificats SSL gratuitement mais tout aussi sécurisés.

``` shell
apt-get install -y couchdb supervisor postfix apache2
apt-get install -y cozy-depends cozy-apt-key cozy-apt-list
apt-get clean

apt-get install --install-recommends cozy
```

Par défaut **Cozy** utilise NGinx à la place d'apache, on doit donc le supprimer car il rentre en conflit avec apache qui lui aussi utilise le port 80.

``` shell
apt-get remove nginx
apt-get purge nginx
```

### Activation des mods pour apache

Par défaut le **SSL** et le **proxy** ne sont pas activés dans apache, on va donc les activer.

``` shell
a2enmod ssl
a2enmod proxy
a2enmod proxy_http
```

### Création du VirualHost

Maintenant que tout est activé, il faut créer notre VirtualHost pour apache

``` shell
nano /etc/apache2/sites-available/cozy.conf
```

``` apache
<VirtualHost *:80>
        ServerName      mon-serveur.com
        ServerAdmin     webmaster@mon-serveur.com
 
        # Redirection de toutes les connections HTTP vers HTTPS
        RewriteEngine   On
        RewriteCond     %{HTTPS} !=on
        RewriteRule     ^(.*)$ https://%{SERVER_NAME}$1 [L,R=301]
</VirtualHost>

<IfModule mod_ssl.c>
 <VirtualHost *:443>
        ServerName      mon-serveur.com
        ServerAdmin     webmaster@mon-serveur.com

        # On active le chiffrement (HTTPS)
        SSLEngine               On
        SSLCertificateFile      /etc/cozy/server.crt
        SSLCertificateKeyFile   /etc/cozy/server.key

        # Redirection des requêtes vers l'application Cozy Cloud
        ProxyPass               / http://127.0.0.1:9104/ retry=0 Keepalive=On timeout=1600
        ProxyPassReverse        / http://127.0.0.1:9104/
        setenv proxy-initial-not-pooled 1

        ErrorLog                /var/log/apache2/cozy-error.log

 </VirtualHost>
</IfModule>
```

Les lignes **ProxyPass** et **ProxyPassReverse** permettent de dire à apache que lorsque l'on va sur ce nom domaine, il doit faire pointer ce qui est en local sur notre machine vers le nom de domaine.

Ainsi, lorsque je vais sur `mon-serveur.com`, apache lance la page `http://127.0.0.1:9104/`. C'est comme si nous avions fait un tunnel SSH mais là il est permanant.

Maintenant que le fichier de configuration est créer il faut l'activer dans apache

``` shell
a2ensite cozy.conf

service apache2 restart
```

## Fin

Voilà ! Votre serveur **Cozy** est installé correctement.

## Problèmes éventuels

Si jamais vous avez des soucis avec l'utilisation de certaines applications qui refusent la connexion, regarder ce topic sur le forum officel de **Cozy** : [https://forum.cozy.io/t/resolu-comment-faire-fonctionner-un-certificat-avec-cozy-et-plusieurs-sites-sur-apache/3276/12](https://forum.cozy.io/t/resolu-comment-faire-fonctionner-un-certificat-avec-cozy-et-plusieurs-sites-sur-apache/3276/12)
## Démo

Voici quelques images de Cozy

[![Calendrier Cozy](//www.babeuloula.fr/images/cozy-cloud/Calendar.png)](//www.babeuloula.fr/images/cozy-cloud/Calendar.png)

[![Gestionnaire de contacts Cozy](//www.babeuloula.fr/images/cozy-cloud/Contact.png)](//www.babeuloula.fr/images/cozy-cloud/Contact.png)

[![Webmail Cozy](//www.babeuloula.fr/images/cozy-cloud/Emails.png)](//www.babeuloula.fr/images/cozy-cloud/Emails.png)