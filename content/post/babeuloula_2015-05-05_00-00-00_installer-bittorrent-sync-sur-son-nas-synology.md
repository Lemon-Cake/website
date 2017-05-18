+++
date = "2015-05-05T00:00:00+00:00"
draft = false
title = "Installer BitTorrent Sync sur son NAS Synology"
slug = "installer-bittorrent-sync-sur-son-nas-synology"
tags = ["NAS","Serveur","Synology","Tutorial"]
image = "https://www.babeuloula.fr/images/blog/head/bittorrent-sync.jpg"
comments = true
share = true
author = "BaBeuloula"
description = "Installer un dropbox like sur son NAS Synology"
+++

<p>Si comme moi vous cherchez un moyen de <strong>synchroniser facilement</strong> des dossiers entre un <strong>poste distant</strong> (ou non) et votre <strong>NAS Synology</strong>&nbsp;et bien voici comment installer <a href="https://www.getsync.com/" target="_blank"><strong>BitTorrent Sync</strong></a> sur votre NAS Synology.</p>

<p><!--more--><strong>BitTorrent Sync</strong> est un logiciel de synchronisation gratuit (il existe aussi une version payante avec plus de fonctionnalit&eacute;s) qui permet de synchroniser plusieurs dossiers entre plusieurs postes.</p>

<p>Les gros points forts de <strong>BTSync</strong>&nbsp;est que si vous souhaitez faire de la syncro entre des postes qui sont en local, le logiciel ne passera pas par Internet et du coup vous allez aller tr&egrave;s vite (en fonction de la vitesse de votre r&eacute;seau local).<br />
De plus, si vous avez des gros fichiers, <strong>BTSync</strong> ne va mettre &agrave; jour que les parties du fichier&nbsp;qui ont &eacute;t&eacute; modifi&eacute;es plut&ocirc;t que de tout recopier et du coup perdre du temps.</p>

<p>Je vous laisse regarder la vid&eacute;o de pr&eacute;sentation si vous voulez en savoir plus :</p>

<p><iframe allowfullscreen="" frameborder="0" src="https://www.youtube.com/embed/-T_uV2giecI" style="width:100%;height:auto;min-width:320px;min-height:180px;max-width:1000px;max-height:563"></iframe></p>

<p>Connectez-vous &agrave; votre NAS et allez dans le<strong> gestionnaire de paquets</strong>, puis <strong>Param&egrave;tres</strong></p>

<p style="text-align:center;"><a href="https://www.babeuloula.fr/images/Screen_Shot_2015-02-25_at_9_32_40_AM.png"><img alt="BTSync Synology" src="https://www.babeuloula.fr/images/Screen_Shot_2015-02-25_at_9_32_40_AM.png" style="width: 320px; height: 212px;" /></a></p>

<p>Dans l&#39;onglet <strong>G&eacute;n&eacute;ral</strong>, cochez la case pour <strong>autoriser les sources ext&eacute;rieurs</strong></p>

<p style="text-align:center;"><a href="https://www.babeuloula.fr/images/Screen_Shot_2015-02-25_at_9_35_11_AM.png"><img alt="BTSync Synology" src="https://www.babeuloula.fr/images/Screen_Shot_2015-02-25_at_9_35_11_AM.png" style="width: 320px; height: 211px;" /></a></p>

<p>Fermez les <strong>param&egrave;tres</strong>, puis cliquez sur <strong>Installation manuelle</strong> et allez chercher le <strong>fichier *.spk</strong></p>

<p style="text-align:center;"><a href="https://www.babeuloula.fr/images/Syno_1.png"><img alt="BTSync Synology" src="https://www.babeuloula.fr/images/Syno_1.png" style="width: 320px; height: 211px;" /></a></p>

<p>Pour t&eacute;l&eacute;charger la&nbsp;version sp&eacute;cifique &agrave; votre NAS, rendez-vous sur cette page :&nbsp;<a href="http://help.getsync.com/customer/portal/articles/1888507-synology" target="_blank">http://help.getsync.com/customer/portal/articles/1888507-synology</a></p>

<p>Une fois l&#39;installation termin&eacute;e, <strong>ne d&eacute;marrez&nbsp;pas tout de suite BYSync</strong>&nbsp;et connectez-vous &agrave; votre NAS en SSH avec l&#39;utilisateur <strong>root</strong>&nbsp;(le mot de passe est le m&ecirc;me que pour <strong>admin</strong>) et tapez :&nbsp;</p>

<pre class="brush: shell " data-pbcklang="shell" data-pbcktabsize="4">
synogroup --add sc-btsync btsync
synogroup --descset sc-btsync &quot;SynoCommunity&#39;s BitTorrent Sync group&quot;</pre>

<p>Vous pouvez maintenant utilisez BTSync pour synchroniser vos fichiers.&nbsp;<span style="line-height: 1.6em;">Pour ce qui est de la configuration de BTSync, la cr&eacute;ation des dossiers etc ... je vous laisse regarder la doc qui l&#39;explique sans doute mieux que moi.</span></p>
