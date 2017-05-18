+++
date = "2014-04-16T00:00:00+00:00"
draft = false
title = "Générer des mots de passe aléatoire"
slug = "generer-des-mots-de-passe-aleatoire"
tags = ["JavaScript","PHP"]
image = "https://www.babeuloula.fr/images/blog/head/password.jpg"
comments = true
share = true
author = "BaBeuloula"
description = ""
+++

<p>Sur mes sites Internet, quand un utilisateur se cr&eacute; un compte, ou s&#39;il perd son mot de passe, je dois lui en renvoyer un. Mais comme ne je suis pas non plus idiot, je le g&eacute;n&egrave;re automatiquement en PHP ou JavaScript, en fonction du contexte. Voici comment les g&eacute;n&eacute;rer</p>
<!--more-->

<p>La g&eacute;n&eacute;ration des mots de passes est une chose tr&egrave;s simple, mais plut&ocirc;t que de s&#39;emb&eacute;ter &agrave; programmer le truc, voici 2 fonctions pour le faire.</p>

<pre class="brush: javascript " data-pbcklang="javascript" data-pbcktabsize="4" title="JavaScript">
Math.random().toString(36).slice(-8);</pre>

<pre class="brush: php " data-pbcklang="php" data-pbcktabsize="4" title="PHP">
function passwd($chrs = 8) {
    $list = &quot;0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz&quot;;
    mt_srand((double)microtime()*1000000);
    $newstring = &quot;&quot;;

    while(strlen($newstring) &lt; $chrs) {
        $newstring .= $list[mt_rand(0, strlen($list)-1)];
    }

    return $newstring;
}</pre>
