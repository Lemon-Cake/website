+++
date = "2014-09-25T00:00:00+00:00"
draft = false
title = "Créer une fonction JavaScript avec un callback"
slug = "creer-une-fonction-javascript-avec-un-callback"
tags = ["JavaScript","jQuery"]
image = "https://www.babeuloula.fr/images/blog/head/jquery.jpg"
comments = true
share = true
author = "BaBeuloula"
description = ""
+++

<p>Lorsque vous faites de la programmation en <strong>JavaScript</strong>, vous &eacute;xecutez sans doute des fonctions et des fois vous avez besoin d&#39;une fonction se termine pour appeler une nouvelle fonction. Donc vous avez besoin d&#39;un <strong>callback</strong>. Voici comment cr&eacute;er un <strong>callback </strong>en <strong>JavaScript</strong>.</p>

<p><!--more-->J&#39;utilise souvent <strong>jQuery </strong>et le syst&egrave;me de <strong>fadeOut</strong>, <strong>fadeIn </strong>pour faire appara&icirc;tre du contenu et l&#39;avantage de ces fonctions, est qu&#39;elle disposent d&#39;un <strong>callback</strong>, qui vous permet par exemple de retirer la div du <strong>DOM </strong>une fois votre <strong>fadeOut </strong>termin&eacute;.</p>

<p>Voici une fonction tr&egrave;s simple qui permet de calculer une somme.</p>

<pre class="brush: javascript " data-pbcklang="javascript" data-pbcktabsize="4">
function calculer(nb1, nb2, callback) {
    var sum = parseFloat(nb1) + parseFloat(nb2)

    // Je regarde si callback est diff&eacute;rent
    if(callback !== undefined) {
        callback(sum);
    }
}

// Je lance mon calcule
calculer(2, 3, function(sum) {
    alert(sum);
    // Mon alert ne va se d&eacute;clencher qu&#39;une fois le calcule termin&eacute;
});</pre>

<p>Bon l&agrave;, je suis d&#39;accord avec vous,&nbsp;le <strong>callback </strong>ne sert pas &agrave; grand chose car le syst&egrave;me traite l&#39;information directement.&nbsp;Si vous voulez voir en details le syst&egrave;me, essayez de mettre un <strong>setTimeout de 1000ms avant le callback</strong></p>

<p>Mais par exemple si vous avez une fonction qui doit<strong> t&eacute;l&eacute;charger un fichier &agrave; partir d&#39;un serveur distant</strong>, vous pourrez alors mettre un loader et d&egrave;s que vous aurez eu votre callback dire &agrave; l&#39;utilisateur que son t&eacute;l&eacute;chargement est termin&eacute;.</p>
