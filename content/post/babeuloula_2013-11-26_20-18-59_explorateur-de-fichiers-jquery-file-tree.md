+++
date = "2013-11-26T20:18:59+00:00"
draft = false
title = "Explorateur de fichiers jQuery File Tree"
slug = "explorateur-de-fichiers-jquery-file-tree"
tags = ["Articles","jQuery"]
image = "https://www.babeuloula.fr/images/blog/head/jquery-file-tree.jpg"
comments = true
share = true
author = "BaBeuloula"
description = "Mettez en place facilement un explorateur de fichiers jQuery pour votre site Internet"
+++

<a title="jQuery File Tree" href="http://www.abeautifulsite.net/blog/2008/03/jquery-file-tree/" target="_blank">jQuery File Tree</a> est un plugin jQuery fonctionnant en AJAX qui permet d'explorer facilement un dossier. Ainsi en quelques lignes de codes vous pourrez parcourir un dossier pour votre front ou back office. 
<div class="read-more"><!--more--></div>
Vous avez une démo à cette adresse : <a href="http://labs.abeautifulsite.net/archived/jquery-fileTree/demo/">http://labs.abeautifulsite.net/archived/jquery-fileTree/demo/</a>

Les dossiers peuvent être ouverts plusieurs à la fois ou non, avec un effet de rebond lors de l'ouverture ... Les choix sont vastes.

Vous pourrez l'utiliser sur différents serveurs car son créateur à l'a programmé en PHP, ASP, ASP.NET, JPS et Lasso.
<h2>Compatibilité</h2>
Niveau compatibilités voici le minimum requis :
<ul>
	<li>jQuery 1.2.6</li>
	<li>Internet Explorer 6</li>
	<li>Firefox 2</li>
	<li>Safari 3</li>
	<li>Google Chome</li>
	<li>Opera 9</li>
</ul>
<h2>Utilisation</h2>
Super simple à mettre en place

JavaScript :

[javascript]
$(document).ready( function() {
    $('#explorateur').fileTree({
        root: '../son/dossier/'
    }, function(file) {
        alert(file); //Donne le lien du fichier (relatif)
    });
});
[/javascript]

HTML :

[html]
&lt;div id=&quot;explorateur&quot;&gt;&lt;/div&gt;
[/html]

Et voici la documentation : <a href="http://www.abeautifulsite.net/blog/2008/03/jquery-file-tree/#configuring">http://www.abeautifulsite.net/blog/2008/03/jquery-file-tree/#configuring</a>
<h2>Téléchargement</h2>
Vous pouvez télécharger la dernière version ici : <a href="http://labs.abeautifulsite.net/archived/jquery-fileTree/">http://labs.abeautifulsite.net/archived/jquery-fileTree/</a>
## Démo

2013-12-08 19:17:24
## Source

http://lemon-cake.fr/?p=55