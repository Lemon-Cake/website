+++
date = "2015-01-05T00:00:00+00:00"
draft = false
title = "Installer un serveur Terraria sous Linux ou sur un NAS Synology"
slug = "installer-un-serveur-terraria-sous-linux-ou-sur-un-nas-synology"
tags = ["Jeux","Linux","NAS","Synology","Tutorial"]
image = "https://www.babeuloula.fr/images/blog/head/serveur_terraria.jpg"
comments = true
share = true
author = "BaBeuloula"
description = "Comment créer son propre serveur Terraria sur un NAS Synology pour jouer en amis"
+++

<p>Je viens de me mettre &agrave; un&nbsp;petit jeu ind&eacute;pendant, <a href="http://www.terraria.org/" target="_blank">Terraria</a>. Pour ceux qui ne connaissant pas, c&#39;est un genre de Minecraft mais en 2D. En gros vous avez un personnag et vous devez utiliser votre environnement pour construite des habitations, trouver des ressources pour faire des armes, armures ... Le jeu est soit PvE, soit PvP. Et voulant y jouer avec mes amis &agrave; moindre frais, j&#39;ai cr&eacute;&eacute; mon propre serveur.</p>

<p><!--more-->Pour cr&eacute;er votre serveur vous allez avoir besoin soit d&#39;un ordinateur sous Linux (peut importe la version, m&ecirc;me sans interface) ou d&#39;un NAS Synology pour continuer ce tuto. Sur Windows vous allez voir c&#39;est un fichier *.exe que vous allez pouvoir &eacute;xecuter directement &agrave; la main.</p>

<p>Tout d&#39;abord on va installer <a href="http://www.mono-project.com/" target="_blank">Mono</a>. Mono est une plate-forme qui permet d&#39;&eacute;xecuter des applications Windows sous Linux.</p>

<p><strong>Linux :</strong></p>

<pre class="brush: shell " data-pbcklang="shell" data-pbcktabsize="4">
sudo add-apt-repository ppa:inizan-yannick/mono
sudo apt-get install mono-runtime</pre>

<p><strong>NAS Synology :</strong></p>

<ol>
	<li>Rendez vous dans le <em>centre de paquets</em></li>
	<li><em>Param&egrave;tres</em>, onglets <em>B&ecirc;ta</em>, et cochez : <em>Oui, je veux voir les versions b&ecirc;ta !</em></li>
	<li>Recherchez&nbsp;<em>Mono</em>&nbsp;et installez-le</li>
</ol>

<p>Pour utiliser Terraria sur un serveur nous allons avoir besoin de <a href="https://github.com/NyxStudios/TShock" target="_blank">TShock</a>. TShock est un serveur pour Terraria &eacute;crit en <strong>C#</strong> et bas&eacute; sur l&#39;API serveur de <strong>Terraria</strong>.</p>

<p>Pour l&#39;installer, on va devoir nous connecter en SSH &agrave; notre serveur. Je suppose que vous savez vous connecter &agrave; votre serveur en SSH sinon une petite recherche Google devrait suffir. Pour ceux qui ont un <strong>NAS Synology</strong>, vous devez vous connecter avec l&#39;utilisateur <strong>root</strong>&nbsp;et avec le mot de passe de l&#39;<strong>admin</strong>.</p>

<pre class="brush: shell " data-pbcklang="shell" data-pbcktabsize="4">
# Adaptez le dossier &agrave; vos besoin
cd /volume1/homes/admin/

# Pour les NAS Synology, je vous renvoi &agrave; mon tuto Installer IPKG sur son NAS Synology DSM 5 (http://www.babeuloula.fr/blog/billet/52/installer-ipkg-sur-son-nas-synology-dsm-5/)
# A la fin de ce tuto, j&#39;explique comment installer wget-ssl
wget https://github.com/NyxStudios/TShock/releases/download/v4.2300/TShock.4.2.3.0702.zip

unzip -d Terraria TShock.4.2.3.0702.zip
rm TShock.4.2.3.0702.zip

cd Terraria/
mono TerrariaServer.exe</pre>

<p>Le serveur se lance, je vous laisse configurer votre serveur comme vous le souhaitez.</p>

<p>Je vous mets dans la source du billet, le contenu d&#39;un fichier texte qui permet de lancer directement le serveur avec toutes les configurations. Ce qui vous permettera lancer le serveur correctement au lancement de votre serveur.</p>

<p>Et si vous souhaitez fermer la console sans que le serveur ne se ferme vous pouvez installer <strong>screen</strong> :</p>

<pre class="brush: shell " data-pbcklang="shell" data-pbcktabsize="4">
# NAS Synology
ipkg install screen

# Linux
sudo apt-get install screen</pre>

<p>Et lancez le avec :</p>

<pre class="brush: shell " data-pbcklang="shell" data-pbcktabsize="4">
screen mono TerrariaServer.exe</pre>

## Source

<p>Pour lancer le serveur en ligne de commande</p>

<pre class="brush: shell " data-pbcklang="shell" data-pbcktabsize="4">
mono TerrariaServer.exe -config serverconfig.txt</pre>

<p>Contenu du fichier serverconfig.txt</p>

<pre class="brush: conf " data-pbcklang="text" data-pbcktabsize="4">
#the following is a list of available command line parameters:

#-config &lt;config file&gt;				        Specifies the configuration file to use.
#-port &lt;port number&gt;				        Specifies the port to listen on.
#-players &lt;number&gt; / -maxplayers &lt;number&gt;	Sets the max number of players
#-pass &lt;password&gt; / -password &lt;password&gt;	Sets the server password
#-world &lt;world file&gt;				        Load a world and automatically start the server.
#-autocreate &lt;#&gt;				            Creates a world if none is found in the path specified by -world. World size is specified by: 1(small), 2(medium), and 3(large).
#-banlist &lt;path&gt;				            Specifies the location of the banlist. Defaults to &quot;banlist.txt&quot; in the working directory.
#-worldname &lt;world name&gt;			        Sets the name of the world when using -autocreate.
#-secure					                Adds addition cheat protection to the server.
#-noupnp					                Disables automatic port forwarding

#Set&#39;s the max number of players allowed on a server.  Value must be between 1 and 255
#maxplayers=8

#Load a world and automatically start the server.
#world=/volume1/homes/admin/Terraria/Terraria/Worlds/world1.wld

#Set the port number
#port=7777

#Set the server password
#password=p@55w0rd

#Set the message of the day
#motd=Please don&rsquo;t cut the purple trees!

#Sets the folder where world files will be stored
#worldpath=/volume1/homes/admin/Terraria/Terraria/Worlds/

#Creates a new world if none is found. World size is specified by: 1(small), 2(medium), and 3(large).
#autocreate=3

#Sets the name of the world when using autocreate
#worldname=World

#The location of the banlist. Defaults to &quot;banlist.txt&quot; in the working directory.
#banlist=banlist.txt

#Adds addition cheat protection.
#secure=1

#Sets the server language 1:English, 2:German, 3:Italian, 4:French, 5:Spanish
#lang=1

#Automatically forward ports with uPNP
#upnp=1

#Reduces enemy skipping but increases bandwidth usage. The lower the number the less skipping will happen, but more data is sent. 0 is off.
#npcstream=60

#Default system priority 0:Realtime, 1:High, 2:AboveNormal, 3:Normal, 4:BelowNormal, 5:Idle
priority=1</pre>
