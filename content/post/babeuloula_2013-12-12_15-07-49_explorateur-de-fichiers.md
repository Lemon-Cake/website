+++
date = "2013-12-12T15:07:49+00:00"
draft = false
title = "Explorateur de fichiers"
slug = "explorateur-de-fichiers"
tags = ["JavaScript","jQuery","PHP","Tutoriaux"]
image = "https://www.babeuloula.fr/images/blog/head/tuto-file-tree.jpg"
comments = true
share = true
author = "BaBeuloula"
description = "Apprenez à mettre en place facilement un explorateur de fichiers en PHP et JavaScript (jQuery)"
+++

Il y a quelques jours je vous parlais d'un petit plugin sympa pour parcourir un dossier et ses sous-dossiers. Le système est très pratique mais je me suis aperçu qu'il comportait une grosse faille de sécurité. En effet, il suffisait de faire une petite injection JavaScript via la console du navigateur et vous aviez accès aux dossiers que vous n'auriez jamais pu voir.

Je me suis alors dis que plutôt que de m'amuser à sécuriser le tout, j'ai recréer un système identique mais cette fois beaucoup plus sécurisé. Et du coup cela fera un tuto pour vous montrer comment parcourir un dossier un PHP.
<div class="read-more"><!--more--></div>
<h1>Prérequis</h1>
Pour réaliser cet explorateur de fichiers vous devrez avoir :
<ul>
	<li>Un serveur web avec PHP 5 ou supérieur</li>
	<li>La bibliothèque JavaScript <a title="jQuery" href="http://www.jquery.com/" target="_blank">jQuery</a></li>
	<li>Et savoir lire (mais bon si vous êtes ici c'est sans doute pas pour les images)</li>
</ul>
<h1>Scan des dossiers</h1>
Pour trouver le contenu d'un dossier en PHP, il y a plusieurs solutions. La plus simple est la fonction <a title="scandir()" href="http://www.php.net/manual/fr/function.scandir.php" target="_blank">scandir()</a> mais demande d'avoir PHP5 sur son serveur. Cette fonction s'utilise de la façon suivante :

[php]

// On passe en paramètre le dossier à scanner
// On récupère le contenu du dossier dans un tableau
$files = scandir('./repertoire/');

[/php]
<h1>Création de la fonction de scan</h1>
Nous allons passer maintenant à la création de la fonction qui va scanner automatiquement les dossiers et ses sous dossiers.

[php]
function scan($dir) {
    // On regarde déjà si le dossier existe
    if(is_dir($dir)) {
        // On le scan et on récupère dans un tableau le nom des fichiers et des dossiers
        $files = scandir($dir);

        // On supprime . et .. qui sont respectivement le dossier courant et le dossier précédent
        unset($files[0], $files[1]);

        // On tri le tableau de façon intéligente (à la façon humaine)
        // http://www.php.net/function.natcasesort
        natcasesort($files);

        // On commence par afficher les dossiers
        foreach($files as $f) {
            // S'il y a un dossier
            if(is_dir($dir.$f)) {
                // On affiche alors les données
                echo '&lt;li class=&quot;folder&quot;&gt;'.$f.'&lt;/li&gt;';
                echo '&lt;ul class=&quot;tree&quot;&gt;';

                // Et du coup comme c'est un dossier, un le rescan
                scan($dir.$f.&quot;/&quot;);

                echo '&lt;/ul&gt;';
            }
        }

        // Puis on affiche les fichiers
        foreach($files as $f) {
            // S'il y a un fichier
            if(is_file($dir.$f)) {
                echo '&lt;li class=&quot;file&quot; rel=&quot;'.$dir.$f.'&quot;&gt;'.$f.'&lt;/li&gt;';
            }
        }
    }
}
[/php]
<h1>La mise en forme</h1>
[css]
* {
    font-family : 'Arial', sans-serif;
    font-size : 12px;
}

ul {
    list-style : none;
    margin : 0px;
    padding : 0px;
    padding-left : 25px;
}

li {
    padding-left : 20px;
    line-height : 18px;
    cursor : pointer;
}

li.folder {
    background : url(&quot;folder.png&quot;) no-repeat left center;
}

li.file {
    background : url(&quot;file.png&quot;) no-repeat left center;
}
[/css]
<h1>Ajoutons un peu d'animation</h1>
Pour avoir un peu d'animation on va rajouter quelques lignes de JavaScript

[javascript]
jQuery(function($){
    // On commence par cacher tous les sous dossiers
    $(&quot;ul.tree&quot;).hide();

    // Lors du click du un dossier
    $(&quot;li.folder&quot;).click(function () {
        // Si le dossier n'est pas ouvert on l'ouvre, sinon, on le ferme
        $(this).next(&quot;ul&quot;).toggle(&quot;fast&quot;);
    });

    // Lors du click sur un fichier
    $(&quot;li.file&quot;).click(function () {
        // On lance le téléchargement du fichier
        document.location = &quot;dl.php?f=&quot;+$(this).attr(&quot;rel&quot;);
    });
});
[/javascript]
<h1>Téléchargement des fichiers</h1>
Voici un petit script PHP pour télécharger le fichier qu'on lui passera en paramètre

[php]
// La fonction end(), permet de récupérer le dernier objet d'un tableau
// http://cz1.php.net/function.end

$file = explode(&quot;/&quot;, $_GET['f']);

header('Content-Description: File Transfer');
header('Content-Type: application/octet-stream');
header('Content-Disposition: attachment; filename=' . basename(end($file)));
header('Content-Transfer-Encoding: binary');
header('Expires: 0');
header('Cache-Control: must-revalidate');
header('Pragma: public');
header('Content-Length: ' . filesize($_GET['f']));
ob_clean();
flush();

readfile($_GET['f']);
exit;
[/php]
<h1>Conclusion</h1>
Sa mise en place est relativement simple :

[php]
&lt;?php
    scan(&quot;./repertoire/&quot;);
?&gt;[/php]

Vous pouvez voir une petite démo :

<iframe src="http://depot.babeuloula.fr/PHP_jQuery_FileTree/" height="160" width="400"></iframe>
## Démo

2014-04-05 14:25:01
## Source

http://lemon-cake.fr/?p=246