+++
date = "2015-06-22T00:00:00+00:00"
draft = false
title = "Connaître la durée d'un script Shell"
slug = "connaitre-la-duree-d-un-script-shell"
tags = ["Linux","Serveur","Shell"]
image = "https://www.babeuloula.fr/images/blog/head/jquery.jpg"
comments = true
share = true
author = "BaBeuloula"
description = ""
+++

<p>La semaine derni&egrave;re je vous expliquais comment mettre en place un syst&egrave;me de sauvegarde sur votre machine mais je me dis qu&#39;il serai int&eacute;ressant de conna&icirc;tre la dur&eacute;e de la copie.</p>

<p><!--more-->Voici un petit bout de code pour en conna&icirc;tre la dur&eacute;e :</p>

<pre class="brush: shell " data-pbcklang="shell" data-pbcktabsize="4">
#!/bin/bash

## On r&eacute;cup&egrave;re le timestamp actuel au lancement du script
debut=$(date +%s)

###
# Faites votre traitement
###

## On r&eacute;cup&egrave;re le timestamp actuel &agrave; la fin du script
fin=$(date +%s)

## On calcule la dur&eacute;e d&#39;ex&eacute;cution
duree=$(( $fin - $debut ))

## On affiche le r&eacute;sultat
echo &quot;$duree secondes&quot;</pre>

<p>Rien de plus compliqu&eacute;</p>
