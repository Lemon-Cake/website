+++
date = "2014-01-28T13:00:28+00:00"
draft = false
title = "Connexion à PDO MySQL"
slug = "connexion-pdo-mysql"
tags = ["Base de données","PHP","Ressources"]
image = "https://www.babeuloula.fr/images/blog/head/pdo.jpg"
comments = true
share = true
author = "BaBeuloula"
description = "PDO ou PHP Data Objects est une classe PHP permettant de se connecter à une base de donnée"
+++

PDO ou PHP Data Objects est une classe PHP permettant de se connecter à une base de donnée. Pour utiliser PDO il faut la version 5.1.0 de PHP. Afin de voir si cette extension est installée sur votre serveur, utiliser la fonction phpinfo() et recherchez la ligne PDO Driver.
<div class="read-more"><!--more--></div>

La déclaration de connexion à PDO se fait de la manière suivante :

[php]
$db = new PDO('mysql:host=' . $dbhost . ';dbname=' . $dbname, $dbuser, $dbpass);
$db-&gt;setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
$db-&gt;exec('SET NAMES utf8');
[/php]

Et à chaque fois que vous voulez exécuter une requête dans vos pages vous devez copier ceci puis faire :

[php]
$db-&gt;prepare(&quot;VOTRE REQUETE&quot;);
$db-&gt;execute();
// Traitement
$db-&gt;closeCursor();
[/php]

Sans oublier le fait que si il y à une erreur, vous devez récupérer le message et surtout gérer les exceptions générées en cas d'erreurs. Du coup afin de faciliter le tout j'ai créer une petite classe PHP qui extend de PDO et qui permet de se connecter plus facilement :

[php]
&lt;?php

    if ($_SERVER['SERVER_ADDR'] == &quot;127.0.0.1&quot;) {
        define(&quot;DB_HOST&quot;, &quot;localhost&quot;);
        define(&quot;DB_NAME&quot;, &quot;babeuloula&quot;);
        define(&quot;DB_USER&quot;, &quot;root&quot;);
        define(&quot;DB_PASS&quot;, &quot;&quot;);
    } else {
        define(&quot;DB_HOST&quot;, &quot;&quot;);
        define(&quot;DB_NAME&quot;, &quot;&quot;);
        define(&quot;DB_USER&quot;, &quot;&quot;);
        define(&quot;DB_PASS&quot;, &quot;&quot;);
    }

    class database extends PDO {

        private $dbhost = DB_HOST;
        private $dbname = DB_NAME;
        private $dbuser = DB_USER;
        private $dbpass = DB_PASS;
        private $erreur = &quot;&quot;;
        private $conn;
        private $db;

        public function __construct() {
            if (!$this-&gt;conn) {
                try {
                    $this-&gt;db = new PDO('mysql:host=' . $this-&gt;dbhost . ';dbname=' . $this-&gt;dbname, $this-&gt;dbuser, $this-&gt;dbpass);
                    $this-&gt;db-&gt;setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                    $this-&gt;db-&gt;exec('SET NAMES utf8');
                    $this-&gt;conn = true;
                    return $this-&gt;conn;
                } catch (PDOException $e) {
                    $this-&gt;erreur = $e-&gt;getMessage();
                    $this-&gt;conn = false;
                    return $this-&gt;conn;
                }
            } else {
                return $this-&gt;conn = true;
            }
        }

        public function getDataBase() {
            return $this-&gt;db;
        }

        public function getErreur() {
            return $this-&gt;erreur;
        }

    }

?&gt;
[/php]

J'encadre directement la connexion et en cas d'erreurs, je l'affiche. Je regarde aussi si la connexion est toujours ouverte ou non.

Vous pensez sans doute qu'il n'y à pas trop d'intérêt mais devoir à chaque fois recopier les codes d'accès dans toutes les pages de connexions à la base, devoir les changer lors du passage en production tout cela est fastidieux.

Voici comment l'utiliser :

[php]
&lt;?php
    
    require_once 'database.class.php';
    
    $config = new database();

    if($config) {
        $db = $config-&gt;getDataBase();

        $requete = $db-&gt;prepare(&quot;REQUETE&quot;);
        if($requete-&gt;execute()) {
            // Traitement
        } else {
            $config-&gt;getErreur();
        }

        $requete-&gt;closeCursor();
    } else {
        $config-&gt;getErreur();
    }

?&gt;
[/php]

N'hésitez pas à me dire ce que vous en pensez, et si vous avez des améliorations à proposer. Elle est dispo sur mon GitHub au cas où : <a title="https://github.com/babeuloula/database-PDO" href="https://github.com/babeuloula/database-PDO" target="_blank">https://github.com/babeuloula/database-PDO</a>
## Démo

2014-02-06 20:31:36
## Source

http://lemon-cake.fr/?p=396