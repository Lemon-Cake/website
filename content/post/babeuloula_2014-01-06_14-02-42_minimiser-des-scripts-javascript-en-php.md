+++
date = "2014-01-06T14:02:42+00:00"
draft = false
title = "Minimiser des scripts Javascript en PHP"
slug = "minimiser-des-scripts-javascript-en-php"
tags = ["JavaScript","jQuery","PHP","Ressources","Tutoriaux"]
image = "https://www.babeuloula.fr/images/blog/head/minify.jpg"
comments = true
share = true
author = "BaBeuloula"
description = "Voici comment grâce à la classe PHP JSMin, comment minimiser en quelques lignes des scripts JavaScript."
+++

Je viens de trouver une petite classe PHP qui vous permettra de gagner du temps de chargement sur vos gros scripts Javascript.

Vous avez déjà vu que lorsque vous télécharger par exemple la bibliothèque JavaScript jQuery vous avez une version *.min.js et une autre ? Et bien c'est que celle ci a été minimisé. Et bien je vais vous montrer comment minimiser vous même vos scripts JavaScript.

<div class="read-more"><!--more--></div>

<h2>Prérequis</h2>

Il vous faudra juste télécharger la classe à cette adresse : <a href="https://github.com/rgrove/jsmin-php">https://github.com/rgrove/jsmin-php</a>

Puis l'inclure dans les pages où vous chargez vos scripts JS.

<h2>Utilisation</h2>

Je vais vous montrer 2 utilisations.

<h3>PHP</h3>

La première est si vous avez tous vos scripts dans des dossiers et que vous n’exécutez aucun scripts directement dans vos pages :

[php]
require_once('jsmin.php');

// On collecte tous les fichiers avec une extension *.js
$files = glob(&quot;js/*.js&quot;);

// On prépare la variable qui va contenir le Javascript
$js = &quot;&quot;;

// On parcours les fichiers *.js
foreach($files as $file) {
    // On récupère le contenu des fichiers *.js, on les minify et on les stocks dans la variable $js
    $js .= JSMin::minify(file_get_contents($file));
}

// Et pour finir, on enregistre le tout dans un nouveau fichier JS.
file_put_contents(&quot;js/combined.js&quot;, $js);
[/php]

Vous pouvez aussi utiliser un tableau pour stocker le dossier et le nom de vos fichiers JS

[php]
$files = array('dossier1/file1.js', 'dossier2/file2.js', 'dossier3/file3.js');
file_get_contents($file);
[/php]

Grâce à ceci, vous n'aurez qu'a charger un seul fichier JS et plus toutes une grosse liste.

<h3>Javascript</h3>

La deuxième est si vous utilisez du JS dans vos pages :

[php]
&lt;?php
    // Crée une mémoire tampon pour stocker tout ce qui va suivre
    ob_start();
?&gt;
&lt;script&gt;
    /*
     * Coller ici votre code JavaScript
     */
&lt;/script&gt;
&lt;?php echo JSMin::minify(ob_get_clean()); ?&gt;
[/php]

Maintenant vous avez un script JS qui est compressé.

Facile non ?
## Démo

2016-08-30 19:44:34
## Source

http://lemon-cake.fr/?p=269