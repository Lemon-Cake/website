+++
date = "2014-09-25T00:00:00+00:00"
draft = false
title = "Erreur 0x80004005 Windows"
slug = "erreur-0x80004005-windows"
tags = ["Information"]
image = "https://www.babeuloula.fr/images/blog/head/controle-wamo-pro-2-3.jpg"
comments = true
share = true
author = "BaBeuloula"
description = ""
+++

<p>Je me suis achet&eacute; r&eacute;cement une manette de jeux pour t&eacute;l&eacute;phone, la <strong>WAMO Pro 2</strong>, compatible <strong>Android</strong>, <strong>iPhone</strong>, <strong>tablette </strong>et <strong>PC</strong>. Mais &agrave; ma grande surprise, impossible de la connecter en <strong>Bluetooth </strong>&agrave; mon <strong>PC </strong>via un dongle achet&eacute; sur <strong>eBay </strong>&agrave; 1&euro;. Voici la marche &agrave; suivre pour l&#39;utiliser.</p>

<p><!--more-->Nous allons nous servir de <strong>regsvr32</strong>, qui est un utilitaire en <strong>ligne de commande</strong> qui permet de d&eacute;sinscrire les <strong>contr&ocirc;les ActiveX </strong>et des <strong>DLL </strong>dans<strong> la base de registre de Windows</strong>.</p>

<p>Vous allez pouvoir r&eacute;gler votre soucis en 5 petites &eacute;tapes :</p>

<ol>
	<li>Lancer la <strong>commande DOS</strong> en <strong>administrateur </strong>(<strong>Win+R</strong> et tapez <strong>cmd</strong>)</li>
	<li>Changez de dossier, tapez :<br />
	<span style="margin-left:25px;">Pour Windows 32bits : <strong>cd C:\Windows\System32</strong></span><br />
	<span style="margin-left:25px;">Pour Windows 64bits : <strong>cd C:\Windows\SysWow64</strong></span></li>
	<li>Tapez <strong>regsvr32 jscript.dll</strong> et faites <strong>Entrer</strong></li>
	<li>Tapez <strong>regsvr32 vbscript.dll</strong><span style="line-height: 20.7999992370605px;">&nbsp;et faites <strong>Entrer</strong></span></li>
	<li>Relancer la recherche <strong>Bluetooth</strong></li>
</ol>

<p>Cette technique s&#39;applique &agrave; l&#39;erreur <strong>0x80004005</strong>, qui n&#39;est pas forc&eacute;ment li&eacute; au <strong>Bluetooth </strong>mais &agrave; <strong>l&#39;installation de pilotes ou de logiciels</strong>.</p>
