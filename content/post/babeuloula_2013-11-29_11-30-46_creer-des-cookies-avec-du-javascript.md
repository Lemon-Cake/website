+++
date = "2013-11-29T11:30:46+00:00"
draft = false
title = "Créer des cookies avec du JavaScript"
slug = "creer-des-cookies-avec-du-javascript"
tags = ["JavaScript","Ressources"]
image = "https://www.babeuloula.fr/images/blog/head/cookies.jpg"
comments = true
share = true
author = "BaBeuloula"
description = "Apprenez comment mettre en place des cookies en JavaScript à travers trois fonctions JavaScript"
+++

Un cookie en informatique est un ensemble de fichiers qui sont stockés sur votre ordinateur afin de charger plus facilement des informations. Ainsi grâce à eux, vous pouvez rester connecté à un site même après plusieurs jours sans y être venu. Et oui car la plupart du temps quand vous cocher la petite case "Se souvenir de moi", le script de connexion va créer des cookies pour vous reconnaître plus facilement. Le système de panier sur les sites de e-commerce fonctionnent sur le même principe.

Des fois il se peut que vous reveniez sur un site plusieurs jours après mais vous n'êtes pas reconnu, car les cookies pour des raisons de sécurités ont une date d'expiration qui est modifiable.

Et bien aujourd'hui je vous propose trois petites fonctions JavaScript qui vous aiderons à gérer des cookies sur un serveur n'ayant pas PHP (ce qui est fréquent chez certains hébergeur gratuit).
<div class="read-more"><!--more--></div>
<h2>Création des cookies</h2>
La création des cookies est très simple à mettre en place.
<ul>
	<li><strong>c_name</strong> : Le nom du cookie que vous souhaitez créer</li>
	<li><strong>value</strong> : Ce que vous souhaitez stocker dans ces cookies</li>
	<li><strong>exdays</strong> : Le nombre de jours avant l'expiration de votre cookie</li>
</ul>
[javascript]

function setCookie(c_name, value, exdays) {
    var date = new Date();
    date.setTime(date.getTime()+(exdays * 24 * 60 * 60 * 1000));
    var exdate = &quot;; expires=&quot;+date.toGMTString();

    document.cookie = c_name + &quot;=&quot; + value + exdate;
}

[/javascript]
<h2>Récupération du cookie</h2>
<ul>
	<li><strong>c_name</strong> : Nom du cookie à récupérer</li>
</ul>
[javascript]

function getCookie(c_name) {
    var c_value = document.cookie;
    var c_start = c_value.indexOf(&quot; &quot; + c_name + &quot;=&quot;);

    if (c_start == -1) {
        c_start = c_value.indexOf(c_name + &quot;=&quot;);
    }

    if (c_start == -1) {
        c_value = null;
    } else {
        c_start = c_value.indexOf(&quot;=&quot;, c_start) + 1;
        var c_end = c_value.indexOf(&quot;;&quot;, c_start);

        if (c_end == -1) {
            c_end = c_value.length;
        }

        c_value = unescape(c_value.substring(c_start,c_end));
    }

    return c_value;
}

[/javascript]
<h2>Suppression du cookie</h2>
<ul>
	<li><strong>c_name</strong> : Nom du cookie à supprimer</li>
</ul>
[javascript]
function delCookie(c_name) {
    setCookie(c_name, &quot;&quot;, -1);
}
[/javascript]
<h2>Mise en pratique</h2>
Je vais maintenant vous montrez comment se servir de ces petites fonctions.

Nous allons pour cela faire un système qui sauvegarde notre nom. Si un cookie avec notre nom existe il nous dira bonjour, sinon il nous demandera de le rentrer.

Démo : <a title="Cookie JavaScript" href="http://jsfiddle.net/babeuloula/NkAQ2/2/" target="_blank">http://jsfiddle.net/babeuloula/NkAQ2/2/</a>

Cliquez sur "Run" en haut dans la barre des menus pour lancer le script une deuxième fois.
<h2>Conclusion</h2>
Vous savez maintenant comment mettre en place des cookies en quelques lignes.

Cependant, les cookies ont un problème. Ils peuvent être interceptés par les pirates qui sont sur le même réseau que vous s'ils ne sont pas sécurisés. Par exemple Facebook, si dans la barre d'adresse, vous n'êtes pas en https, vous pouvez être sur que votre session est stocké en cookie non sécurisée et donc peut être réutilisé par un pirate pour utiliser votre compte sans que vous le sachiez.

C'est donc pour cela qu'en Wifi Public, n’acceptez jamais les cookies ou naviguez en "Navigation privé" qui ne stocke rien. Et quand vous faites des achats vérifiez bien que vous êtes en https et que le cadenas est bien fermés.
## Démo

2013-12-08 19:16:28
## Source

http://lemon-cake.fr/?p=166