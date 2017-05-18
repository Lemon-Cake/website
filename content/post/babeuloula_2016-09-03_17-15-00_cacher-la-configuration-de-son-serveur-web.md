+++
date = "2016-09-03T17:15:00+00:00"
draft = false
title = "Cacher la configuration de son serveur web"
slug = "cacher-la-configuration-de-son-serveur-web"
tags = ["Linux","Navigateur","Serveur","Tutorial","Tutoriaux"]
image = "https://www.babeuloula.fr/images/blog/head/hide_server_conf_security.jpg"
comments = true
share = true
author = "BaBeuloula"
description = "Savoir comment et avec quoi sont fait les sites c'est bien, mais des fois on souhaite quand même cacher sa configuration"
+++

Savoir comment et avec quoi sont fait les sites c'est bien, mais des fois on souhaite quand même cacher sa configuration.

J'ai découvert depuis quelques temps une **extension** pour Google Chrome et Mozilla Firefox, nommée [Wapppalyzer](https://wappalyzer.com/). Elle permet de voir quel langage de programmation et quelles technologies sont utilisées sur un site web ou un serveur.

[![Extension Wapppalyzer](//www.babeuloula.fr/images/Wapppalyzer-babeuloula.png)](//www.babeuloula.fr/images/Wapppalyzer-babeuloula.png)

Le problème pour les développeurs c'est que grâce à cette petite extension gratuite, les pirates peuvent savoir comment est fait le site et donc utiliser des failles. Ainsi il est très facile de connaître la version d'un Wordpress ou d'un Joomla avec celle-ci.

Mais nous pouvons déjà bloquer certains informations pour ne pas qu'elles ne s'affichent à l'utilisateur de **Wapppalyzer**. Regardons ensemble comment faire en quelques lignes à modifier sur nos fichiers de configurations

## Apache2

Editez le fichier se trouvant dans `/etc/apache/conf-available/security.conf` et ajoutez (ou décommentez) les 2 lignes suivantes

``` conf
ServerSignature Off
ServerTokens Prod
```

Puis redémarrez votre service apache2

``` shell
sudo service apache2 restart
```

## PHP

### Mode apache2

Si vous avez configuré votre version de PHP en tant que module d'apache, éditez le fichier `/etc/php5/apache2/php.ini` et rajoutez (ou décommentez) la ligne suivante :

``` conf
expose_php = Off
```

### FPM

Si vous avez configuré votre version de PHP avec FPM, éditez le fichier `/etc/php5/fpm/php.ini` et rajoutez (ou décommentez) la ligne suivante :

``` conf
expose_php = Off
```

Puis redémarrez votre service apache2

``` shell
sudo service apache2 restart
```

Vous ne devriez maintenant plus voir les informations de votre serveur sur **Wapppalyzer**.


