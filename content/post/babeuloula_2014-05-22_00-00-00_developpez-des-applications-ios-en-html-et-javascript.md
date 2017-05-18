+++
date = "2014-05-22T00:00:00+00:00"
draft = false
title = "Développez des applications iOS en HTML et JavaScript"
slug = "developpez-des-applications-ios-en-html-et-javascript"
tags = ["CSS","CSS3","Framework","HTML","HTML5","iOS","JavaScript"]
image = "https://www.babeuloula.fr/images/blog/head/framework7.jpg"
comments = true
share = true
author = "BaBeuloula"
description = "Découvrez le framework Framework7 pour développer des applications HTML au design iOS"
+++

<p>Avec l&#39;arriv&eacute; d&#39;i<strong>OS 7</strong>, les d&eacute;veloppeurs de chez <strong>Apple </strong>ont fait du beau travail et ont r&eacute;ussis &agrave; donner un coup de jeune &agrave; l&#39;interface de leurs t&eacute;l&eacute;phones. Et bien gr&acirc;ce &agrave; <a href="http://www.idangero.us/framework7" target="_blank">Framework7</a>, vous pouvez maintenant faire pareil et en quelques lignes de codes.</p>
<!--more-->

<p><a href="http://www.idangero.us/framework7/#.U321ufl_sc4" target="_blank">Framework7</a>&nbsp;est enti&egrave;rement d&eacute;velopp&eacute; en <strong>HTML </strong>et <strong>JavaScript</strong>.&nbsp;Il reprend l&#39;int&eacute;gralit&eacute;&nbsp;des interfaces utilisateurs du design d&#39;iOS 7, les fonctionnalit&eacute;s, tel que le <em>Swipe Back</em>, <em>Pull To Refresh</em>, <em>Swipe to Delete</em> et bien d&#39;autres.</p>

<p>Il int&egrave;gre aussi des fonctionnalit&eacute;s assez int&eacute;ressantes. Comme le fait de charger toutes les pages en <strong>XHR </strong>(Ajax) et avoir un <strong>syst&egrave;me de cache</strong> pouvant &ecirc;tre modifi&eacute; (par d&eacute;faut 10 minutes), et il charge aussi la page&nbsp;pr&eacute;c&eacute;dente. C&#39;est &agrave; dire que si vous &ecirc;tes sur la page <strong>C</strong> d&#39;un site, il va charger en m&eacute;moire la page <strong>B </strong>automatiquement afin de vous faire gagner du temps lors de l&#39;utilisation.</p>

<p>Au niveau de la syntaxe de programmation JavaScript, il n&#39;utilise <strong>aucune biblioth&egrave;que tierce</strong> (comme jQuery, MooTools ...). Ils ont fait leur propre sauce. Mais rassurez-vous, ils le disent eux-m&ecirc;mes, elle est bas&eacute; sur <strong>jQuery</strong> avec la plupart des fonctions comme<em> .html()</em>, <em>.append()</em>. La seule chose &agrave; savoir c&#39;est qu&#39;il faut faire :</p>

<pre class="brush: javascript " data-pbcklang="javascript" data-pbcktabsize="4">
$$(&quot;#test&quot;).html(&#39;Voil&agrave; mon texte&#39;);</pre>

<p>A la place de :</p>

<pre class="brush: javascript " data-pbcklang="javascript" data-pbcktabsize="4">
$(&quot;#test&quot;).html(&#39;Voil&agrave; mon texte&#39;);</pre>

<p>Donc vous voyez, rien de bien m&eacute;chant si vous connaissez assez bien jQuery.</p>

<p>Le seul probl&egrave;me que j&#39;ai pu rencontrer, est qu&#39;il ne prend pas en compte le bouton de retour ou page pr&eacute;c&eacute;dente. Comme tout est fait en Ajax, pour lui c&#39;est une seule et m&ecirc;me page.</p>

<p>Vous pouvez avoir un aper&ccedil;u &agrave; cette adresse :&nbsp;<a href="http://www.idangero.us/framework7/examples/" target="_blank">http://www.idangero.us/framework7/examples/</a><br />
<span style="line-height: 1.6em;">Et des applications de d&eacute;mo :&nbsp;</span><a href="http://www.idangero.us/framework7/apps/" style="line-height: 1.6em;" target="_blank">http://www.idangero.us/framework7/apps/</a></p>

<p>Pour ma part, je me suis amus&eacute; avec PhoneGap, qui permet de transformer une application Web en application mobile (iOS, Android, WP ...). Vous pouvez t&eacute;l&eacute;charger l&#39;application <a href="http://www.idangero.us/framework7/apps/todo7/" target="_blank">ToDo7</a> &agrave; cette adresse :&nbsp;<a href="http://www.babeuloula.fr/fichiers/divers/ToDo7.apk" target="_blank">http://www.babeuloula.fr/fichiers/divers/ToDo7.apk</a></p>

## Démo

<iframe src="http://www.idangero.us/framework7/kitchen-sink/" frameborder="0" scrolling="no" style="width: 320px;height: 550px"></iframe>