+++
date = "2014-04-04T00:00:00+00:00"
draft = false
title = "Commandes utiles PostFix"
slug = "commandes-utiles-postfix"
tags = ["Serveur"]
image = "https://www.babeuloula.fr/images/blog/head/internet.jpg"
comments = true
share = true
author = "BaBeuloula"
description = ""
+++

<p>Petit billet tr&egrave;s court juste pour vous donner quelques lignes de commandes pour <a href="http://www.postfix.org/" target="_blank">PostFix</a>.</p>
<!--more-->

<p>PostFix, pour ceux qui ne savent pas, est un agent de transfert de mails sous Linux.</p>

<p>Ayant eu un gros souci&nbsp;sur le serveur (plus de 78000 mails en attente), j&#39;ai d&ucirc; mettre les mains dans le cambouis pour pouvoir stopper le relais spam dont notre serveur &eacute;tait victime.</p>

<pre class="brush:plain;" title="Connaitre la queue des mails en attente">
postqueue -p</pre>

<pre class="brush:plain;" title="Vider la queue des mails en attente">
postsuper -d ALL</pre>
