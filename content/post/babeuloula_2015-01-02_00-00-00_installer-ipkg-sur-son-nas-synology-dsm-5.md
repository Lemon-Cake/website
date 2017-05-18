+++
date = "2015-01-02T00:00:00+00:00"
draft = false
title = "Installer IPKG sur son NAS Synology DSM 5"
slug = "installer-ipkg-sur-son-nas-synology-dsm-5"
tags = ["Linux","NAS","Serveur","Synology","Tutorial"]
image = "https://www.babeuloula.fr/images/blog/head/ipkg_synology.jpg"
comments = true
share = true
author = "BaBeuloula"
description = ""
+++

<p>Sur les NAS Synology il n&#39;est pas possible d&#39;installer des paquets sans passer par le gestionnaire. Ce qui ne permet de pas d&#39;installer ce que l&#39;on veut. Par exemple pour &eacute;diter un fichier en ligne commande il faut utilser <em>vi</em>, perso je pr&eacute;f&egrave;re utiliser <em>nano</em> comme sous Linux. Voici comment installer <strong>IPKG</strong> sur son <strong>NAS Synology DSM 5</strong>.</p>

<p><!--more--><strong>IPKG </strong>(Isty Package Management System), est un gestionnaire de paquets utilis&eacute; sous les distributions <strong>Linux</strong>. Si vous souhaitez utiliser des commandes comme <em>nano</em>, <em>make</em>, <em>patch</em> ... vous devez installer <strong>IPKG</strong>. Voici le tuto pour l&#39;installer :</p>

<p>Commencez par vous connecter en <strong>SSH</strong> &agrave; votre <strong>NAS</strong> avec l&#39;utilisateur <em>root</em>&nbsp;(le mot de passe est le m&ecirc;me que <em>admin</em>).</p>

<pre class="brush: shell " data-pbcklang="shell" data-pbcktabsize="4">
cd /volume1/@tmp

wget http://ipkg.nslu2-linux.org/feeds/optware/syno-i686/cross/unstable/syno-i686-bootstrap_1.2-7_i686.xsh

chmod +x syno-i686-bootstrap_1.2-7_i686.xsh

sh syno-i686-bootstrap_1.2-7_i686.xsh

rm syno-i686-bootstrap_1.2-7_i686.xsh

ipkg update

ipkg upgrade</pre>

<p>Voil&agrave;, <strong>IPKG</strong>&nbsp;est install&eacute; sur votre NAS. Sauf que que depuis la version 4 du <strong>DSM</strong>&nbsp;il faut modifier des fichiers pour que cela fonctionne m&ecirc;me apr&egrave;s chaque red&eacute;marrage.</p>

<pre class="brush: shell " data-pbcklang="shell" data-pbcktabsize="4">
vi /etc/rc.local</pre>

<p>Passez en mode&nbsp;<em>&eacute;dition</em>&nbsp;avec la touche <em>i</em>. Ajoutez cette ligne juste apr&egrave;s <em>#!/bin/sh</em> :</p>

<pre class="brush: shell " data-pbcklang="shell" data-pbcktabsize="4">
mount -o bind /volume1/@optware /opt</pre>

<p>Ce qui donne :</p>

<pre class="brush: shell " data-pbcklang="shell" data-pbcktabsize="4">
#!/bin/sh
mount -o bind /volume1/@optware /opt
# Optware setup[/left]
[ -x /etc/rc.optware ] &amp;&amp; /etc/rc.optware start
exit 0</pre>

<p>Pour sortir du mode&nbsp;<em>&eacute;dition</em>&nbsp;appuyez sur&nbsp;<em>&eacute;chap</em>&nbsp;puis enregistrez en tappant&nbsp;<em>:wq</em></p>

<pre class="brush: shell " data-pbcklang="shell" data-pbcktabsize="4">
vi /root/.profile</pre>

<p>Ajoutez&nbsp;<em>/opt/bin:/opt/sbin</em>&nbsp;juste apr&egrave;s <em>PATH=</em>, ce qui donne :</p>

<pre class="brush: shell " data-pbcklang="shell" data-pbcktabsize="4">
PATH=/opt/bin:/opt/sbin/sbin:/bin:/usr/sbin:/usr/bin:/usr/syno/sbin:/usr/syno/bin:/usr/local/sbin:/usr/local/bin</pre>

<p>Il ne vous reste plus qu&#39;a red&eacute;marrer votre <strong>NAS</strong>&nbsp;et &agrave; vous reconnecter en <strong>SSH</strong> pour installer vos nouveaux paquets, par exemple :</p>

<pre class="brush: shell " data-pbcklang="shell" data-pbcktabsize="4">
// Affiche la liste des paquets d&eacute;j&agrave; install&eacute;s
ipkg list

// L&#39;&eacute;diteur de texte de Linux
ipkg install nano

// Permet de t&eacute;l&eacute;charger des fichiers en HTTPS
ipkg install wget-ssl

// Pour supprimer un paquet (*** = nom du paquet)
ipkg remove ***</pre>
