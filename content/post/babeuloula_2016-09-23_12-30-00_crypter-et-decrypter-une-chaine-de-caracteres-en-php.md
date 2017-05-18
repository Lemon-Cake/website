+++
date = "2016-09-23T12:30:00+00:00"
draft = false
title = "Crypter et décrypter une chaîne de caractères en PHP"
slug = "crypter-et-decrypter-une-chaine-de-caracteres-en-php"
tags = ["PHP","Sécurité","Tutorial","Tutoriaux"]
image = "https://www.babeuloula.fr/images/blog/head/encryption-authentification.jpg"
comments = true
share = true
author = "BaBeuloula"
description = "Dans certains programmes PHP il peut être intéressant de vouloir stocker une chaîne de caractère crypté et pouvoir la décrypter quand bon vous semble"
+++

Dans certains programmes il peut être intéressant de vouloir stocker une chaîne de caractère crypté et pouvoir la décrypter quand bon vous semble. Voici comment faire en PHP pour passer d'une chaîne de caractère compréhensible à quelque chose d'incompréhensible.

## Avant-propos
Avant toute chose, il est préférable de bien distinguer la différence entre cryptage (double sens) et authentification (sens unique). 

### Différence entre le cryptage et l'authentification

**Le cryptage** permet de modifier un message, afin qu'il ne peut être décrypté que si l'on obtient la bonne clé. Exactement comme la machine  [**Enigma**](https://fr.wikipedia.org/wiki/Enigma_(machine)) qui était utilisé pendant la seconde guerre mondiale.

En cryptographie, il existe la **cryptographie symétrique** où une même clé de chiffrement est utilisée à la fois pour chiffrer et déchiffrer un message. A l'inverse il existe la **cryptographie asymétrique**, où il faut utiliser un couple de clé publique et clé privée.

Dans le deuxième cas, prenons par exemple une discussion entre 2 personnes, *Mr A* et *Mr B*. *Mr A* génère un couple de clés, puis *Mr A* envoi sa clé publique à *Mr B*. Quand *Mr B* voudra envoyer un message à *Mr A*, il devra utiliser la clé publique de *Mr A* pour crypter le message. Une fois le message reçu par *Mr A*, il pourra utiliser sa clé privée pour décoder le message et **uniquement grâce à celle-ci**. Sans cette clé, personne ne pourra voir le message de *Mr B*. D'où les termes de **clé privée** et **clé publique**.

**L'authentification** quant à elle, est le principe de rendre un message indéchiffrable via un système de hashage comme le **md5**, **sha1**, **sha512** ...

Pour résumer **l'encryption assure la confidentialité** et **l'authentification fournit l'intégrité**.

## Cryptage symétrique

Comme expliqué plus haut, nous allons utiliser une seule et même clé pour chiffrer et déchiffrer notre message.

Commençons par installer le paquet `defuse/php-encryption` via composer :

``` shell
composer require defuse/php-encryption
```

Voici comment en quelques lignes je vais pouvoir crypter la phrase suivante `Master of puppets I'm pulling your strings, twisting your mind and smashing your dreams.`

``` php
<?php
    
	use \Defuse\Crypto\Crypto;
    use \Defuse\Crypto\Key;

    require "vendor/autoload.php";

    // On génère une clé aléatoire pour le cryptage
    $key = Key::createNewRandomKey();

    $message = 'Master of puppets I\'m pulling your strings, twisting your mind and smashing your dreams.';

	$cryptText = Crypto::encrypt($message, $key);
```

Et voici le contenu de la variable *$cryptText* : `def50200320358969bec524d8605c4099a7c6474fcb311029bec162c41a3aa881584b3f32a3d8d5585faf153f155c1170956d945b95548ec5be7b67d5009bb856e22ad532c5c2460f4f54aacf9b52010b16d8e2ca3bfe95d867e26ec2423b74d6e04deb6d91739b36fc4ca66befddc061d9fe2c87dd1e879ff00b0d604dbe4285c18bfe0756b542bf9c4f4b38b970031f6def067da05bbb84be45a832af20ebade7de1f7bc7ca0f52f2a8c5a`.

Bien-sûr il faut penser à stocker la clé aléatoire pour crypter/décrypter les futurs données. Mais attention, la clé générée par la librairie n'est pas une chaine de caractère. Il faut donc la convertir pour la sauvegarder correctement : 

``` php
// Récupération de la clé aléatoire en chaîne de caractère pour le stockage
$key->saveToAsciiSafeString();
```

Ce qui me donne une clé comme ceci `def000006f289f278c817e85ca4fa1731fe08d16d0b621356e8f90b89a25a18bb3ce0265ff8fe0473b152cedd832fd85fa4148e8d03df7072e218ccb015a1e0a4eaeba97`

Si je souhaite la réutiliser pour décrypter mon message :

``` php
$asciKey = "def000006f289f278c817e85ca4fa1731fe08d16d0b621356e8f90b89a25a18bb3ce0265ff8fe0473b152cedd832fd85fa4148e8d03df7072e218ccb015a1e0a4eaeba97"
$key = Key::loadFromAsciiSafeString($asciKey);
```

Et je peux maintenant décrypter mon message : 

``` php
$plainText = Crypto::decrypt($ciphertext, $key);
```

## Cryptage asymétrique

Pour utiliser le **Cryptage asymétrique**, il faut que l'extension **openssl** soit activé dans votre *php.ini*.

Si vous avez lu la première partie, vous savez qu'il nous faut un couple de clés pour utiliser ce type de cryptage. Nous allons donc les générer :

``` shell
openssl genrsa -out private.key 1024
openssl rsa -in private.key -out public.key -pubout -outform PEM
```

Si vous êtes sous Windows, vous avez dû vous rendre compte que la commande `openssl` ne fonctionne pas. Pas de panique, rendez-vous à l'adresse suivante pour télécharger les fichiers binaires : [https://wiki.openssl.org/index.php/Binaries](https://wiki.openssl.org/index.php/Binaries)

L'utilisation est très simple, toutes les fonctions dont vous avez besoin sont disponible nativement dans PHP (à condition d'avoir activé l'extension *openssl*) :

``` php
<?php 

$publicKey  = file_get_contents('public.key');
$privateKey = file_get_contents('private.key');

$message = 'Master of puppets I\'m pulling your strings, twisting your mind and smashing your dreams.';

// On crypte avec la clé publique
openssl_public_encrypt($message, $crypted, $publicKey);

// On décrypte avec la clé privée
openssl_private_decrypt($crypted, $decrypted, $privateKey);
```

Vous trouverez la liste complète de fonctions **OpenSSL** pour **PHP** ici : [http://php.net/manual/fr/ref.openssl.php](http://php.net/manual/fr/ref.openssl.php)

Les variables `$crypted` et `$decrypted` sont des références. Voici ce que dit la documentation PHP dessus :

> En PHP, les références sont un moyen d'accéder au contenu d'une même variable en utilisant plusieurs noms. Les références ne sont pas comme des pointeurs en C : vous ne pouvez pas effectuer d'opération arithmétique de pointeurs sur celles-ci, ce ne sont pas des adresses mémoires, etc. Vous pouvez consulter Ce que les références ne sont pas pour plus d'informations. En fait, les références sont des alias dans la table des symboles. Notez qu'en PHP, le nom d'une variable et son contenu sont deux notions distinctes, ce qui fait que l'on peut donner plusieurs noms au même contenu. On peut faire l'analogie avec les fichiers sous Unix, et leurs noms : les noms des variables sont les entrées dans un répertoire, tandis que le contenu de la variable est le fichier en lui-même. Les références en PHP peuvent alors être considérées comme semblables aux liens sous Unix.

Et voici la documentation : [http://php.net/manual/fr/language.references.php](http://php.net/manual/fr/language.references.php)

## Conclusion

Sous savez maintenant comment crypter des données facilement en PHP.

Mais toutefois attention, **il ne faut jamais utiliser le cryptage pour des mots de passe.** Si vous souhaitez protéger des mots de passe il est préférable d'utiliser des systèmes d'authentification.

Vous en avez plusieurs comme le **md5** ou le **sha1**. Je les déconseille car ils donnent à chaque fois la même chose, et on peut facilement retrouver le message grâce à des dictionnaires ou de sites comme [hashtoolkit](http://hashtoolkit.com/) qui ont une base de données de plus de 6 milliards de hashes décryptés.

Utilisez plutôt les fonctions [**password_hash**](http://php.net/manual/fr/function.password-hash.php) ou **[crypt](http://php.net/manual/fr/function.crypt.php)** et pour les vérifier, vous pouvez utiliser [**password_verify**](http://php.net/manual/fr/function.password-verify.php) ou [**hash_equals**](http://php.net/manual/fr/function.hash-equals.php). 

### EDIT

Pour ceux qui seraient intéressés, j'ai fais un nouvel article concernant le **cryptage et décryptage d'une chaine de caractères en Node JS**. A lire [ici](https://www.babeuloula.fr/blog/crypter-et-decrypter-une-chaine-de-caracteres-avec-node-js.html)
## Démo

## Cas concret

Je vous laisse vous rendez sur mon autre billet qui vous explique comment faire : [Créer un système de connexion "Se souvenir de moi"](//www.babeuloula.fr/blog/creer-un-systeme-de-connexion-se-souvenir-de-moi.html)
## Source

Si vous souhaitez en savoir plus sur la différence entre **le cryptage** et **l'authentification** : [Using Encryption and Authentication Correctly (for PHP developers)](https://paragonie.com/blog/2015/05/using-encryption-and-authentication-correctly)