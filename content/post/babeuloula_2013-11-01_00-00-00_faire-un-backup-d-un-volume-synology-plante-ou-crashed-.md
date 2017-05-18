+++
date = "2013-11-01T00:00:00+00:00"
draft = false
title = "Faire un backup d'un volume Synology planté ou crashed"
slug = "faire-un-backup-d-un-volume-synology-plante-ou-crashed-"
tags = ["Serveur"]
image = "https://www.babeuloula.fr/images/blog/head/nas.jpg"
comments = true
share = true
author = "BaBeuloula"
description = ""
+++

<p>Un de mes lecteurs me faisait remarquer qu&#39;apr&egrave;s plus de 2 mois je n&#39;avais toujours pas fait un retour sur Git syr les NAS Synology. Et bien je voulais en faire un ce weekend comme j&#39;avais 3 jours de libre et bien s&ucirc;r en me connectant ce matin a mon NAS j&#39;ai eu la bonne surprise de d&eacute;couvrir que mon disque dur de donn&eacute;es (Volume 1) venait de planter lamentablement. Je peux encore m&#39;en servir mais du coup je dois faire un backup, supprimer le volume, le recr&eacute;er et bien s&ucirc;r effectuer un test SMART pour corriger les erreurs car il ne pouvait pas &ecirc;tre fait avant.&nbsp;</p>
<!--more-->

<p>Apr&egrave;s plusieurs recherche je me suis aper&ccedil;u que je ne suis pas le seul dans ce cas. Donc je vous propose un petit tuto assez simple &nbsp;pour r&eacute;cup&eacute;rer vos donn&eacute;es si vous en avez :</p>

<ol>
	<li>Tout d&#39;abord, il vous faut activer le mode terminal dans votre NAS (Menu --&gt; Panneau de config --&gt; Terminal --&gt; Cochez les deux cases</li>
	<li>Ouvrer un terminal de ligne de commande. Pour Linux et MAC ouvrez simplement Terminal et pour Windows, je vous invite &agrave; t&eacute;l&eacute;charger <a href="http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html" target="_blank" title="http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html">PuTTY</a></li>
	<li>Pour vous connecter taper : <em>ssh root:mdp_session_admin@ip_du_nas</em> et pour Windows rentrez la m&ecirc;me chose sous PuTTY mais sans <em>ssh</em></li>
	<li>Une fois connect&eacute;, faites :&nbsp;<em>cd /</em><em>volume1/</em>&nbsp;puis <em>dir.</em> Si<em>&nbsp;</em>vous voyez les fichiers c&#39;est good, sinon bah formatez directe votre volume.</li>
	<li>Pour les autres vous pouvez commencer la sauvegarde de votre volume. Mettez donc un disque dur USB ou si comme moi vous avez un autre volume dans le NAS qui est fonctionnel tapez (<span style="color: #ff0000;">Le dossier &nbsp;sauvegarde doit &ecirc;tre cr&eacute;er avant de lancer la commande et respectez bien la casse de la commande</span>) : <em>cp -R /volume1/ /volume2/Sauvegarde/</em></li>
	<li>Laissez faire tant que le terminal ne vous rend pas la main</li>
</ol>

<p>Voil&agrave; vos donn&eacute;es sont sauvegard&eacute;s. J&#39;entends d&eacute;j&agrave; les personnes qui n&#39;ont pas lu les autres articles me dire &quot;Mais pourquoi tu n&#39;as pas &eacute;cris au support de Synology qui eux auraient p&ucirc; te le remonter.&quot;, et bien car j&#39;ai un XPEnology, et donc pas de vrai num&eacute;ro de s&eacute;rie et donc je n&#39;ai pas achet&eacute; de NAS, je l&#39;ai fabriqu&eacute;. C&#39;est comme si vous appeliez une hotline d&#39;un jeu alors que vous avez un jeu crack&eacute;.</p>

<p>Bref, je dois maintenant tout r&eacute;installer, je vous laisse ...</p>

<p>&nbsp;</p>
