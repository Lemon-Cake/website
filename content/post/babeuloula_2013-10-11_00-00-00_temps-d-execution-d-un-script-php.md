+++
date = "2013-10-11T00:00:00+00:00"
draft = false
title = "Temps d’exécution d'un script PHP"
slug = "temps-d-execution-d-un-script-php"
tags = ["PHP"]
image = "https://www.babeuloula.fr/images/blog/head/php.jpg"
comments = true
share = true
author = "BaBeuloula"
description = ""
+++

<p>Vous avez sans doute remarqu&eacute; que lorsque vous faites une recherche sur Google ou sur certains forums, il est &eacute;crit : &quot;Script ex&eacute;cut&eacute; en x secondes&quot;. Et bien voici un code tr&egrave;s simple qui vous permettera de voir le temps que votre script met pour s&#39;ex&eacute;cuter sans devoir rester &agrave; cot&eacute; avec un chronom&egrave;tre.</p>
<!--more-->
## Source

<pre class="brush: php; toolbar: false; first-line: 1; class-name: 'my_personnal_code' ">
// fonction qui retourne le timestamp UNIX en microsecondes
$depart = microtime(true);

/**
 *
 * Traitement
 * Mettez ici tous vos scripts
 *
 **/

$fin = microtime(true);
$temps = $fin - $debut;

//Afficher le temps d&#39;ex&eacute;cution
$temps_de_chargement = number_format($temps, 3); //si vous souhaitez plus pr&eacute;cision changer 3 par un nombre plus grand

echo &quot;D&eacute;but du script: &quot;.date(&quot;H:i:s&quot;, $debut);
echo &quot;Fin du script: &quot;.date(&quot;H:i:s&quot;, $fin);
echo &quot;Script ex&eacute;cut&eacute; en &quot; . $temps_de_chargement . &quot; sec&quot;;</pre>
