+++
date = "2016-09-23T12:30:01+00:00"
draft = false
title = "Créer un système de connexion \"Se souvenir de moi\""
slug = "creer-un-systeme-de-connexion-se-souvenir-de-moi"
tags = ["PHP","Tutorial","Tutoriaux"]
image = "https://www.babeuloula.fr/images/blog/head/keep-me-logged-in.jpg"
comments = true
share = true
author = "BaBeuloula"
description = "Réalisez facilement un formulaire de connexion avec l'option \"Se souvenir de moi\""
+++

Dans mon billet précédent, [**Crypter et décrypter une chaîne de caractères en PHP**](https://www.babeuloula.fr/blog/crypter-et-decrypter-une-chaine-de-caracteres-en-php.html), je vous expliquais comment crypter une chaine de caractère. Voici un cas concret de son utilisation

## Avant-propos

J'ai un site Internet où dessus mes utilisateurs peuvent s'inscrire afin de faire diverses actions. Et j'aimerai que lors de la connexion, mes utilisateurs, puissent cocher la case "Se souvenir de moi" afin de ne pas devoir en permanence se reconnecter.

## Base de données

Voici la structure de mes base de données où sont stockés les informations.

**Table des utilisateurs**

| id | username | password |
| -------- | -------- | -------- |
| 1     | dupont     | $1$C9Ujb263$6bxCPzmeEbXIZ1YsSR918.     |
| ...     | ...     | ...     |

Ici mes mots de passes sont cryptés via la fonction [**crypt**](http://php.net/manual/fr/function.crypt.php) de PHP.

**Table des cookies de connexion**

| id | user_id | cookie |
| -------- | -------- | -------- |
| ...     | ...     | ...     |

## Processus

Avant d'aller plus loin, voici comment va se dérouler le système :

1. L'utilisateur se log sur le site et coche la case se souvenir de moi
2. Je crée la session de l'utilisateur
3. Je crée un **cookie** (que j'appellerai `keep_log`) qui contiendra un tableau avec son IP et son identifiant mais le tout crypté
4. J'insert ce cookie dans ma base de données
5. L'utilisateur quitte le site et revient plus tard
6. Comme sa session n'existe plus je vais regarder son cookie `keep_log`
7. Est-ce qu'il existe dans ma BDD ?
	8. Non, je vais à l'étape 1
	9. Oui je continu
10. Je décrypte le cookie et je regarde si l'IP correspond à son IP actuelle
	11. Elle ne correspond pas ? => étape 1
	12. Si oui, je continu
13. Je regarde si le username du cookie correspond à l'id dans ma table des utilisateurs
	14. Aucune correspondance => étape 1
	15. Sinon, je récupère les données et les mets en session

## Code source

``` php
<?php

    use \Defuse\Crypto\Crypto;
    use \Defuse\Crypto\Key;


    // Faite ici votre vérification pour savoir si l'utilisateur existe en BDD


    // Etape 1 à 3
    session_start();

    $_SESSION['user'] = User::getSession(); // A remplacer par votre système de gestion des utilisateurs

    $cookie = array(
        'ip'       => $_SERVER['REMOTE_ADDR'],
        'username' => $_POST['username']
    );

    $key = Key::createNewRandomKey(); // Pensez bien à stocker cette clé à un endroit sûr

    $cookieCrypted = Crypto::encrypt(json_encode($cookie), $key);
    setcookie('keep_log', $cookieCrypted, time()+60*60*24*365);


    // Etape 4
    // Je considère que vous avez déjà une variable $pdo qui est connecté à votre BDD
    $prepare = $pdo->prepare("INSERT INTO cookie (user_id, cookie) VALUES (:user_id, :cookie)");
    $prepare->execute(array(
        ':user_id' => User::get('id'), // A remplacer par votre système de gestion des utilisateurs
        ':cookie'  => $cookieCrypted,
    ));
    $prepare->closeCursor();


    // Etape 6
    $cookieCrypted = $_COOKIE['keep_log'];


    // Etape 7
    $prepare = $pdo->prepare("SELECT user_id FROM cookie WHERE cookie = :cookie");
    $prepare->execute(array(
        ':cookie' => $cookieCrypted,
    ));
    $datas = $prepare->fetchAll(PDO::FETCH_OBJ);
    $prepare->closeCursor();

    if(count($datas) === 0) {
        return Router::redirectTo('login'); // Adaptez en fonction de votre système de gestion des routes
    }


    // Etape 8
    $cookie = Crypto::decrypt($cookieCrypted, $key);
    $cookie = json_decode($cookie);

    if($cookie->ip !== $_SERVER['REMOTE_ADDR']) {
        return Router::redirectTo('login'); // Adaptez en fonction de votre système de gestion des routes
    }


    // Etape 9
    $prepare = $pdo->prepare("SELECT id, username FROM user WHERE id = :id AND username = :username");
    $prepare->execute(array(
        ':id'       => $datas[0]->user_id,
        ':username' => $cookie->username,
    ));
    $datas = $prepare->fetchAll(PDO::FETCH_OBJ);
    $prepare->closeCursor();

    if(count($datas) === 0) {
        return Router::redirectTo('login'); // Adaptez en fonction de votre système de gestion des routes
    }
```

Et voilà, vous avez maintenant un système de connexion où l'utilisateur sera reconnu dès qu'il arrivera sur votre site.

Alors bien sûr, je vous laisse l'adapter pour y ajouter si besoin plus d'informations dans les cookies ou plus de vérifications mais les grandes lignes sont là.

Vous pouvez même stocker dans votre base de données de cookie une date de validité puis créer un cron qui supprimera les lignes inutiles.