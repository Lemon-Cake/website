+++
date = "2015-06-19T00:00:00+00:00"
draft = false
title = "Synchroniser des fichiers entre un Linux Server et un NAS Synology avec rsync"
slug = "synchroniser-des-fichiers-entre-un-linux-server-et-un-nas-synology-avec-rsyn"
tags = ["Linux","NAS","Serveur","Shell","Synology","Tutorial"]
image = "https://www.babeuloula.fr/images/blog/head/rsync.jpg"
comments = true
share = true
author = "BaBeuloula"
description = "Comment éviter la copie manuelle de fichiers pour faire vos sauvegardes ?"
+++

<p>La sauvegarde de fichier avant un crash est toujours crucial&nbsp;et souvent assez compliqu&eacute; &agrave; mettre en place quand on ne s&#39;y connait pas beaucoup en ligne de commandes.</p>

<p><!--more-->J&#39;ai justement &eacute;t&eacute; confront&eacute; &agrave; ce probl&egrave;me, je devais sauvegarder&nbsp;mes diff&eacute;rents fichiers entre 2 entit&eacute;s : mon <strong>serveur Linux</strong> (o&ugrave; sont stock&eacute;s mes fichiers de travail) et mon <strong>NAS Synology</strong> o&ugrave; je souhaite placer ma sauvegarde.</p>

<p>Je me suis pench&eacute; sur <strong>BTsync</strong>, comme je l&#39;expliquais dans mon pr&eacute;c&eacute;dent billet, mais je me suis aper&ccedil;u qu&#39;il consomme <strong>beaucoup de ressources</strong> et qu&#39;en plus&nbsp;il a du mal &agrave; tout copier quand on commence &agrave; avoir beaucoup de fichiers. Pour vous donner une id&eacute;e, j&#39;ai <strong>plus de 750Go de fichiers et plus de 900 000 fichiers</strong>. Ce qui peut para&icirc;tre beaucoup mais sur 10 ans de travail ce n&#39;est pas &eacute;norme.</p>

<p>Bref, me voil&agrave; en qu&ecirc;te d&#39;un autre outil pour sauvegarder. J&#39;ai regard&eacute; <strong>Cloud Station de Synology</strong>, mais l&#39;outil&nbsp;n&#39;est pas dispo pour les&nbsp;serveurs, <strong>uniquement pour les versions desktop</strong>.</p>

<p>J&#39;ai test&eacute; <strong>Owncloud</strong>, mais le syst&egrave;me n&#39;est pas comme je le souhaiterai car je souhaite &agrave; tout prix que si je supprime un fichier de mon Linux, il reste pr&eacute;sent sur mon NAS. Et oui, une fausse manipulation est si vite arriv&eacute;e, et je ne souhaite pas tout perdre.</p>

<p>J&#39;ai donc regard&eacute; comment fonctionnait ces syst&egrave;mes. Ils fonctionnent tous les deux avec le syst&egrave;me de Linux <a href="https://rsync.samba.org/" target="_blank">rsync</a>&nbsp;(<strong>r</strong>emote <strong>s</strong>ynchronization)&nbsp;qui permet une sauvegarde incr&eacute;mentielle &agrave; distance par SSH. Le fonctionnement est plut&ocirc;t simple :</p>

<pre class="brush: shell " data-pbcklang="shell" data-pbcktabsize="4">
rsync source/ login@serveur:/destination/</pre>

<p>Ceci est bien beau mais je ne souhaite pas le lancer &agrave; la main &agrave; chaque fois pour faire la synchro. Car en plus &agrave; chaque fois je suis oblig&eacute; de rentrer mon mot de passe &agrave; la main pour que la sauvegarde se lance.</p>

<p>Du coup, pour &eacute;viter ceci, je vous conseille d&#39;utiliser <strong>sshpass</strong> qui permet de passer votre mot de passe SSH directement en ligne de commande :</p>

<pre class="brush: shell " data-pbcklang="shell" data-pbcktabsize="4">
sudo apt-get update
sudo apt-get install sshpass

sshpass -p &quot;votre_password&quot; rsync source/ login@serveur:/destination/</pre>

<p>Alors oui pour le moment je suis encore oblig&eacute; de le rentrer &agrave; la main, mais patience ...</p>

<p>Afin de ne pas&nbsp;le lancer en ligne de commande &agrave; chaque fois, on va cr&eacute;er un fichier que l&#39;on va appeler&nbsp;<strong>backup.sh</strong>&nbsp;et que l&#39;on placera dans notre dossier /home/&nbsp;qui nous permettra de le lancer plus tard via une t&acirc;che <strong>CRON</strong>.</p>

<pre class="brush: shell " data-pbcklang="shell" data-pbcktabsize="4">
#!/bin/bash

## Permet de formater le texte afficher pour qu&#39;il soit en UTF-8
export LANG=&quot;fr_FR.UTF-8&quot;

sshpass -p &quot;votre_password&quot; rsync source/ login@serveur:/destination/</pre>

<p>Maintenant que nous avons notre fichier, passons&nbsp;en <strong>root </strong>pour l&#39;ajouter aux t&acirc;ches <strong>CRON </strong>de <strong>root </strong>pour &ecirc;tre s&ucirc;r d&#39;avoir tous les droits.</p>

<pre class="brush: shell " data-pbcklang="shell" data-pbcktabsize="4">
sudo su

## Permet de voir le contenu du crontab de root
crontab -l

## Permet de modifier les taches CRON de root
crontab -e

## Je souhaite que mon cron se lance tous les matins &agrave; 7h30 en m&ecirc;me temps que je me l&egrave;ve
## Pour vous aider, faites un tour sur ce site : http://www.openjs.com/scripts/jslibrary/demos/crontab.php

## Copiez ce code tout en bas du fichier
30     7       *       *       *       sh /home/babeuloula/backup.sh

## Faites CTRL + O pour &eacute;crire le fichier, puis CTRL + X pour quitter</pre>

<p>Et voil&agrave;, maintenant votre sauvegarde se lancera automatiquement tous les jours &agrave; 7h30 et copiera vos fichiers sur votre NAS.</p>

<p>Si jamais vous avez des soucis lorsque vous essayez d&#39;utiliser rsync avec votre NAS, regardez sur votre NAS dans :<br />
<strong>Sauvegarde et r&eacute;plication</strong> =&gt; <strong>Services de sauvegarde</strong> =&gt; Cochez <strong>Activer le service de sauvegarde r&eacute;seau</strong></p>

<p>Je vous mets dans l&#39;onglet source, un petit fichier *.sh un peu plus &eacute;volu&eacute; qui vous permettra d&#39;avoir un syst&egrave;me de log des actions et aussi avec quelques param&egrave;tres pour optimiser la sauvegarde</p>

<p>Bonne sauvegarde &agrave; tous !</p>

## Source

<p><strong>rsync_backup.sh</strong></p>

<pre class="brush: shell " data-pbcklang="shell" data-pbcktabsize="4">
#!/bin/bash

export LANG=&quot;fr_FR.UTF-8&quot;

## On fait une synchro incr&eacute;mentable, il ne supprime aucun fichiers, m&ecirc;me s&#39;ils ne sont plus pr&eacute;sent sur le RAID
	## -v : mode verbose, affiche ce qu&#39;il fait
	## -r : permet de la recursivit&eacute; des dossiers
    ## -u : saute les fichiers plus r&eacute;cents chez le destinataire
    
## tee : permet de lire ce qui est &eacute;crit et l&#39;enregistre dans un fichier
    ## -a : permet d&#39;&eacute;crire dans une nouvelle ligne

echo &quot;-----------------------------------&quot;|tee -a /home/babeuloula/rsync_backup.log
echo &quot;Lancement de la scynchro le $(date)&quot;|tee -a /home/babeuloula/rsync_backup.log
echo &quot; &quot;|tee -a /home/babeuloula/rsync_backup.log
sshpass -p &quot;password&quot; rsync -v -r -u --exclude-from=/home/babeuloula/rsync_exclude_files.txt source/ login@:/destination/|tee -a /home/babeuloula/rsync_backup.log
echo &quot;-----------------------------------&quot;|tee -a /home/babeuloula/rsync_backup.log
echo &quot; &quot;|tee -a /home/babeuloula/rsync_backup.log</pre>

<p><strong>rsync_exclude_files.txt</strong>&nbsp;(liste de fichiers &agrave; ignorer lors de la copie)</p>

<pre class="brush: plain " data-pbcklang="text" data-pbcktabsize="4">
.DS_Store
.Spotlight-V100
.Trashes
~*
.~lock.*
*~
ehthumbs.db
desktop.ini
Thumbs.db
*.part
*.crdownload
._*</pre>

<p>&nbsp;</p>
