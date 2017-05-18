+++
date = "2013-04-24T00:00:00+00:00"
draft = false
title = "Responsive Design et Media Queries"
slug = "responsive-design-et-media-queries"
tags = ["CSS","Navigateur"]
image = "https://www.babeuloula.fr/images/blog/head/no-img-billet.jpg"
comments = true
share = true
author = "BaBeuloula"
description = ""
+++

<p>Si vous n\'avez pas envie de faire un site mobile &agrave; part et devoir refaire un style CSS totalement autre ou bien utiliser jQuery Mobile, vous pouvez vous documenter sur le Responsive Design et les media queries.</p>
<!--more-->
<p>Alors vous allez me dire :</p>
<p style=\"padding-left: 30px;\"><strong><em> Mais qu\'est-ce que le resposive design et les media queries ?</em></strong></p>
<p>C\'est simple, se sont des nouvelles r&egrave;gles CSS sp&eacute;cialement destin&eacute; pour les media (&eacute;crans). Oui car vous devez le savoir si vous faire des pages qui doivent &ecirc;tre imprim&eacute;s, il existe aussi le type \"print\". Bref, cela vous permet de rendre un site disponible sur &eacute;cran de PC, sur un &eacute;cran mobile en quelques minutes. Vous pouvez avoir un exemple avec mon blog. Essayez de r&eacute;duire la taille de la fen&ecirc;tre de votre navigateur afin de voir ce que cela donne.</p>
<p>Vous avez vu ? Sans rien recharger, le site s\'est automatiquement adapt&eacute; &agrave; la largeur du navigateur. Alors pour cela il faut proc&eacute;d&eacute; comme ceci :</p>
<p>Mettre dans votre balise head le petit code suivant :</p>
<p><span class=\"webkit-html-tag\" style=\"font-family: monospace; font-size: medium; white-space: pre-wrap;\">&lt;META <span class=\"webkit-html-attribute-name\">NAME</span>=\"<span class=\"webkit-html-attribute-value\">VIEWPORT</span>\" <span class=\"webkit-html-attribute-name\">CONTENT</span>=\"<span class=\"webkit-html-attribute-value\">WIDTH=DEVICE-WIDTH, INITIAL-SCALE=1.0</span>\"&gt;</span></p>
<p>Il permet de forcer la largeur de l\'affichage &agrave; la largeur de l\'&eacute;cran du terminal. La deuxi&egrave;me propri&eacute;t&eacute; permet forcer l\'&eacute;chelle initiale &agrave; 1.0.</p>
<p>Bien s&ucirc;r, juste cela ne permet de faire un site responsive. Il faut aussi red&eacute;finir les propri&eacute;t&eacute;s CSS en fonction de la taille de l\'&eacute;cran. Le responsive est vraiment quelque chose d\'important qu\'il faut r&eacute;fl&eacute;chir en m&ecirc;me temps que la programmation de votre site. Si vous ne voulez pas passer beaucoup de temps et r&eacute;&eacute;crire toutes les r&egrave;gles CSS en fonction de toutes les tailles d\'&eacute;crans vous avez int&eacute;r&ecirc;t &agrave; le faire en pourcentage. Si comme moi vous ne l\'avez pas pens&eacute; avant, ce n\'est pas grave, vous passez juste plus de temps pour le terminer.</p>
<p>Pour le CSS, il faut jouer avec la propri&eacute;t&eacute; max-width et la clause @media (d\'o&ugrave; le nom media queries) :</p>
<pre class=\"brush: css ; toolbar: false; first-line: 1; class-name: \'my_personnal_code\' \">@media (max-width: 768px) {
     /* VOTRE CODE CSS */
}

@media (max-width: 640px) {
     ...
}

@media (max-width: 480px) {
     ...
}

@media (max-width: 340px) {
     ...
}</pre>
<p>Je vous ai mis les plus utlis&eacute;s, mais il en existe une multitude, d\'o&ugrave; l\'importance de mettre le bout de code que je vous ai donn&eacute; qui est &agrave; mettre dans le &lt;head&gt;.&nbsp;</p>
<p>&nbsp;</p>
<p>Pour finir, il faut tester son code, si vous n\'avez pas de terminaux pour tester je vous conseille l\'extension Firefox (<a href=\"https://addons.mozilla.org/fr/firefox/addon/web-developer/?src=search\" target=\"_blank\">https://addons.mozilla.org/fr/firefox/addon/web-developer/?src=search</a>) et Chrome (<a href=\"https://chrome.google.com/webstore/detail/web-developer/bfbameneiokkgbdmiekhjnmfkcnldhhm?hl=fr\" target=\"_blank\">https://chrome.google.com/webstore/detail/web-developer/bfbameneiokkgbdmiekhjnmfkcnldhhm?hl=fr</a>)&nbsp;Web Developer &nbsp;qui vous permettra de redimensionner facilement la taille du navigateur. Alors attention, je me suis aper&ccedil;u qu\'elle pose un petit probl&egrave;me, elle ne prend pas en compte la taille des ascenseurs.</p>
<p>Si vous n\'avez pas envie d\'installer l\'exension, vous avez ce site <a title=\"http://responsive.victorcoulon.fr/\" href=\"http://responsive.victorcoulon.fr/\" target=\"_blank\">http://responsive.victorcoulon.fr/</a>. Faite un drag&amp;drop du bouton qui est sur le site, vers le site &agrave; tester.</p>
<p><a class=\"zoombox zgallery1\" href=\"http://www.babeuloula.fr/fichiers/images/reponsive.png\"><img style=\"vertical-align: middle; display: block; margin-left: auto; margin-right: auto;\" src=\"http://www.babeuloula.fr/fichiers/images/reponsive.png\" alt=\"http://www.babeuloula.fr/blog/fichiers/images/reponsive.png\" width=\"500\" height=\"389\" /></a></p>
<p>Vous pouvez tester en direct les principaux &eacute;crans (tablette portait et paysage, t&eacute;l&eacute;phone portrait et paysage). Vous pouvez aussi voir ce que donne votre site avec un clavier virtuel afin de vous rendre compte si votre contenu passe bien.</p>
<p>Vous voil&agrave; maintenant avec un magnifique site mobile et compatible.</p>
<p>Si vous avez des questions n\'h&eacute;sitez pas &agrave; les poster en commentaire.</p>