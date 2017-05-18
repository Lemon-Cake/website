+++
date = "2014-03-20T00:00:00+00:00"
draft = false
title = "Extension Pyload pour Google Chrome"
slug = "extension-pyload-pour-google-chrome"
tags = ["AJAX","API","JavaScript","jQuery","Navigateur","Projet"]
image = "https://www.babeuloula.fr/images/blog/head/pyload-chrome.jpg"
comments = true
share = true
author = "BaBeuloula"
description = "Ajoutez vos liens facilement dans PyLoad directement dans Chrome"
+++

<p>Cela fait longtemps que je ne m&#39;&eacute;tais pas plong&eacute; dans un&nbsp;nouveau&nbsp;projet qui &agrave; coup s&ucirc;r me prendrai bien du temps. Je suis en train de d&eacute;velopper une extention Chrome pour g&eacute;rer facilement ses t&eacute;l&eacute;chargement Pyload.</p>
<!--more-->

<p><img alt="pyload" src="https://www.babeuloula.fr/images/pyload.png" style="width: 150px; height: 150px; float: right;" />Pour ceux qui ne connaissant pas, <a href="http://pyload.org/" target="_blank">Pyload</a> est un logiciel d&eacute;velopp&eacute; en Python qui permet de lancer automatiquement des t&eacute;l&eacute;chargements via une interface web.&nbsp;<span style="line-height: 1.6em;">Le soucis c&#39;est qu&#39;il faut &agrave; chaque fois aller sur le logiciel pour lancer ses downlads et du coup on ne peut pas les lancer directement via le navigateur. Le tout gr&acirc;ce &agrave; l&#39;API qui est relativement simple &agrave; utiliser m&ecirc;me si la documentation est tr&egrave;s mal faites. Vous faite des appels AJAX directement sur l&#39;IP de votre serveur Pyload, o&ugrave; m&eacute;thode est la <a href="http://docs.pyload.org/module/module.Api.Api.html#module.Api.Api" target="_blank">m&eacute;thode</a> d&eacute;crite sur leur site&nbsp;:</span></p>

<pre class="brush:plain;toolbar:false;" title="">
http://ip_pyload:port_pyload/api/method</pre>

<p><span style="line-height: 1.6em;">Alors vous allez me dire, mais pourquoi r&eacute;inventer la roue puis-ce qu&#39;il en existe d&eacute;j&agrave; qui font le boulot tr&egrave;s bien ? Et bien car j&#39;ai regard&eacute; l&#39;une des plus t&eacute;l&eacute;charg&eacute; et je me suis aper&ccedil;u en regardant les sources sur le Github qu&#39;a chaque fois qu&#39;il ajoute un t&eacute;l&eacute;chargement il passe d&#39;abord par son serveur. Je suis peut &ecirc;tre parano mais je n&#39;aime pas trop &ccedil;a. Du coup je me suis plong&eacute; dans les lignes de codes et franchement programmer une extension pour Google Chrome c&#39;est ultra simple. Cela reste du JavaScript de base, o&ugrave; l&#39;on peut facilement int&eacute;rargir avec les onglets, les menus contextels lors des&nbsp;clics droits ...</span></p>

<p><a class="zoombox" href="https://www.babeuloula.fr/images/pyload-ct1.png"><img alt="pyload ct1" src="https://www.babeuloula.fr/images/pyload-ct1.png" style="width: 250px; height: 113px; float: left;" /></a><a class="zoombox" href="https://www.babeuloula.fr/images/pyload-ct2.png"><img alt="pyload ct2" src="https://www.babeuloula.fr/images/pyload-ct2.png" style="width: 250px; height: 93px; float: right;" /></a>Pour le moment c&#39;est encore en d&eacute;veloppement et je n&#39;ai pas de date de sortie. L&#39;application propose d&#39;ajouter les liens un &agrave; un ou bien de les parser directement en s&eacute;lectionnant le texte (je fais la d&eacute;tection des balises a et l&#39;argument href). Ajouter ces liens &agrave; un package existant ou le cr&eacute;er.</p>

<p><span style="line-height: 1.6em;">G&eacute;rer les t&eacute;l&eacute;chargements via une popup &agrave; cot&eacute; de la barre d&#39;adresse.</span></p>

<p><a class="zoombox" href="https://www.babeuloula.fr/images/pyload-popup.png" style="line-height: 1.6em;"><img alt="pyload popup" src="https://www.babeuloula.fr/images/pyload-popup.png" style="width: 200px; height: 156px; float: right;" /></a></p>

<p>Et&nbsp;comme &agrave; mon habitude, tout le code source sera dispo sur mon Github une fois termin&eacute; et bien s&ucirc;r t&eacute;l&eacute;chargeable sur la plateforme du <a href="https://chrome.google.com/webstore/category/apps?hl=fr" target="_blank">Webstore de Google</a>.</p>

<p><strike>Une fois le d&eacute;veloppement fini je vous ferai un petit tuto. Je ne sais pas encore si je le ferai ici ou sur <a href="http://lemon-cake.fr/" target="_blank">Lemon Cake</a>, mais soyez-en s&ucirc;r, j&#39;en ferai un.</strike></p>

<p><u><strong>EDIT</strong></u></p>

<p>N&#39;ayant plus de temps de m&#39;occuper de l&#39;application, je mets le lien du github pour ceux qui souhaitent continuer l&#39;extension :&nbsp;<a href="https://github.com/babeuloula/pyLoad_Chrome" target="_blank">https://github.com/babeuloula/pyLoad_Chrome</a></p>
