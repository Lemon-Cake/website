+++
date = "2014-08-23T00:00:00+00:00"
draft = false
title = "Fusionner des images avec PHP (avec un canal alpha)"
slug = "fusionner-des-images-avec-php-avec-un-canal-alpha"
tags = ["PHP","Tutorial"]
image = "https://www.babeuloula.fr/images/blog/head/no-img-billet.jpg"
comments = true
share = true
author = "BaBeuloula"
description = ""
+++

<p>Il y a quelques temps j&#39;ai fais&nbsp;un site Internet pour un photographe et il voulait int&eacute;grer son logo sur chacune des photos lors de l&#39;upload.&nbsp;Avec un petit tour sur le doc PHP, la librairie GD permet de faire cela tr&egrave;s facilement gr&acirc;ce &agrave; <a href="http://php.net//manual/fr/function.imagecopy.php" target="_blank">imagecopy</a>.</p>

<p><!--more-->Pour cet exemple nous allons prendre une image JPG, mais le syst&egrave;me fonctionne aussi pour des PNG et des GIF (sans animations).</p>

<p>On r&eacute;cup&egrave;re l&#39;image upload&eacute;e ainsi que ses dimensions</p>

<pre class="brush: php " data-pbcklang="php" data-pbcktabsize="4">
$dest = imagecreatefromjpeg(&#39;image.jpg&#39;);
list($largeur_image, $hauteur_image) = getimagesize(&#39;image.jpg&#39;);</pre>

<p>On r&eacute;cup&egrave;re notre logo en PNG pour avoir de la transparence</p>

<pre class="brush: php " data-pbcklang="php" data-pbcktabsize="4">
$logo = imagecreatefrompng(&#39;logo.png&#39;);</pre>

<p>Notre logo fait 24px par&nbsp;24px et notre image upload&eacute;e fait 600px par 600px. Nous souhaitons placer notre logo dans le coin inf&eacute;rieur droit de notre image</p>

<pre class="brush: php " data-pbcklang="php" data-pbcktabsize="4">
$x = $largeur_image - 24;
$y = $hauteur_image - 24;</pre>

<p>On fusionne les images.&nbsp;Voici les param&egrave;tres dans l&#39;ordre :</p>

<ul>
	<li>Image de destination (finale)</li>
	<li>Image de la source (logo)</li>
	<li>Coordonn&eacute;e X de l&#39;image de destination (laissez 0 sinon un d&eacute;calage se produit)</li>
	<li>Coordonn&eacute;e Y de l&#39;image de destination (laissez 0 sinon un d&eacute;calage se produit)</li>
	<li>Coordonn&eacute;e X de l&#39;image source</li>
	<li>Coordonn&eacute;e Y de l&#39;image source</li>
	<li>Largeur de l&#39;image source</li>
	<li>Hauteur de l&#39;image source</li>
</ul>

<pre class="brush: php " data-pbcklang="php" data-pbcktabsize="4">
imagecopy($dest, $logo, 0, 0, $x, $y, 24, 24);</pre>

<p>Pour enregistrer l&#39;image finale</p>

<pre class="brush: php " data-pbcklang="php" data-pbcktabsize="4">
imagejpeg($dest, &#39;image.jpg&#39;, 100);</pre>

<p>Mais si vous souhaitez afficher directement l&#39;image &agrave; votre utilisateur</p>

<pre class="brush: php " data-pbcklang="php" data-pbcktabsize="4">
header(&quot;Content-type: image/jpeg&quot;);
imagejpeg($dest, null, 100);</pre>

<p>Et en parcourant un peu plus la doc j&#39;ai vu qu&#39;il existait une autre fonction pour fusionner des images <a href="http://php.net/manual/fr/function.imagecopymerge.php" target="_blank">imagecopymerge</a>&nbsp;qui permet quant &agrave; elle de g&eacute;rer le pourcentage d&#39;opacit&eacute; de l&#39;image source. Seul probl&egrave;me que j&#39;ai constat&eacute;, si votre image source a un canal alpha, son fond sera noir. Je ne sais pas pourquoi. M&ecirc;me en mettant le dernier param&egrave;tre &agrave; 100.</p>

<p>Donc pour le moment si vous avez des images &agrave; fusionner avec un canal alpha, la meilleure solution reste la premi&egrave;re.</p>
