+++
date = "2016-12-19T12:30:00+00:00"
draft = false
title = "Comment fonctionne la compression Gzip"
slug = "comment-fonctionne-la-compression-gzip"
tags = ["Information","Linux","Windows"]
image = "https://www.babeuloula.fr/images/blog/head/fonctionnement-compression-gzip.jpg"
comments = true
share = true
author = "BaBeuloula"
description = "Vous avez tous déjà compressé des fichiers, soit pour gagner de la place soit pour un envoi. Mais savez-vous vraiment comment elle fonctionne ?"
+++

Vous avez tous déjà compressé des fichiers, soit pour gagner de la place soit pour un envoi. Mais savez-vous vraiment comment elle fonctionne ?

Lors de la **KiwiParty** de 2012 organisé par [**Alsacréations**](http://www.alsacreations.fr/), une agence web basée à Strasbourg, [**Frédéric Kayser**](http://frdx.free.fr/) est intervenu avec une conférence sur [**Images : état de l'art et aspects méconnus**](http://www.dailymotion.com/video/xwo9vo_images-etat-de-l-art-et-aspects-meconnus-kiwiparty-2012_tech) qui parlait de la compression des images. 

Et un peu plus tard, après cette conférence, il est revenu plus en détails sur le fonctionnement de la compression **Gzip**. Afin de mieux visualiser la compression d'un texte ou d'un fichier png, il a développé des petits logiciels permettant de visuliser le taux de compression :

* [**gzthermal**](http://encode.ru/threads/1889-gzthermal-pseudo-thermal-view-of-Gzip-Deflate-compression-efficiency) pour les fichier gzip
* [**pngthermal**](http://encode.ru/threads/1725-pngthermal-pseudo-thermal-view-of-PNG-compression-efficiency) pour les fichiers png

Ce qui nous donne des images comme cela :

[![gzthermal](//www.babeuloula.fr/images/compression-gzip/gzthermal.png)](//www.babeuloula.fr/images/compression-gzip/gzthermal.png)

[![pngthermal](//www.babeuloula.fr/images/compression-gzip/pngthermal.png)](//www.babeuloula.fr/images/compression-gzip/pngthermal.png)

Mais bon vous comprendrez sans doute mieux avec la vidéo suivante :

<iframe frameborder="0" style="margin: 0 auto;" width="480" height="270" class="img-responsive" src="//www.dailymotion.com/embed/video/x1umwga" allowfullscreen></iframe>