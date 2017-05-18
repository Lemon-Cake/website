+++
date = "2014-03-07T00:00:00+00:00"
draft = false
title = "Créer un système de notification en JavaScript"
slug = "creer-un-systeme-de-notification-en-javascript"
tags = ["HTML","JavaScript"]
image = "https://www.babeuloula.fr/images/blog/head/capture-d-ecran-2014-03-07-11.19.jpg"
comments = true
share = true
author = "BaBeuloula"
description = ""
+++

<p>Peut &ecirc;tre que pour un de vos projets web vous avez l&#39;intention de faire un syst&egrave;me de notifications mais le favicon restait statique ?&nbsp;<span style="line-height: 1.6em;">Et bien maintenant vous pourrez le modifier en quelques lignes de JavaScript.</span></p>
<!--more-->

<p>Avec le plugin <a href="http://lab.ejci.net/favico.js/" target="_blank">favico.js</a> vous pourrez cr&eacute;er autant de notifications que vous souhaitez.</p>

<p>Ce plugin, fonctionne assez facilement (vous pourrez cr&eacute;er le m&ecirc;me syst&egrave;me si vous le souhaitez), il cr&eacute;e juste une nouvelle image qu&#39;il encode en base64 afin de l&#39;ajouter directement au sein de votre page en replacent je favicon d&eacute;j&agrave; pr&eacute;sent.</p>

<p>Vous pouvez cr&eacute;er divers types d&#39;animations :</p>

<ul>
	<li>slide</li>
	<li>fade</li>
	<li>pop</li>
	<li>popFade</li>
	<li>sans animation</li>
</ul>

<p>Vous pouvez aussi changer sa position, sont style (rond, carr&eacute;), sa couleur de fond ...</p>

<p>Vous pouvez aussi mettre une vid&eacute;o, ou m&ecirc;me la webcam&nbsp;de votre utilisateur.</p>

## Source

<p>Voici quelques exemples d&#39;animations.</p>

<p>Slide :</p>

<pre class="brush:jscript;" title="">
var favicon=new Favico({
    animation:&#39;slide&#39;
});
favicon.badge(1);</pre>

<p>Fade :</p>

<pre class="brush:jscript;" title="">
var favicon=new Favico({
    animation:&#39;fade&#39;
});
favicon.badge(2);</pre>

<p>Pop :</p>

<pre class="brush:jscript;" title="">
var favicon=new Favico({
    animation:&#39;pop&#39;
});
favicon.badge(3);</pre>
