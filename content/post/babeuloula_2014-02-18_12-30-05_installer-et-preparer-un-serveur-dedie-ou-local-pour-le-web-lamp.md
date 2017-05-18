+++
date = "2014-02-18T12:30:05+00:00"
draft = false
title = "Installer et préparer un serveur dédié ou local pour le web (LAMP)"
slug = "installer-et-preparer-un-serveur-dedie-ou-local-pour-le-web-lamp"
tags = ["Serveur","Tutoriaux"]
image = "https://www.babeuloula.fr/images/blog/head/matrix.jpg"
comments = true
share = true
author = "BaBeuloula"
description = "Vous avez besoin d'un serveur Web (LAMP) pour pouvoir exécuter des scripts ou même pour votre site Internet, et vous ne savez pas comment faire ?"
+++

Vous avez besoin chez vous ou à distance d'avoir un serveur Web pour pouvoir exécuter des scripts ou même pour votre site Internet, et vous ne savez pas comment faire ? Vous voulez avoir la main sur tout et ne pas être bridé ?

Voici la marche à suivre pour installer un serveur LAMP (Linux Apache MySQL PHP) le tout en vidéos.

<div class="read-more"><!--more--></div>

Je vais essayer à travers ce tuto de vous expliquer pas à pas comment installer un serveur web. Par contre je conseil quand même d'avoir une petite connaissance des commandes Linux pour ne pas être perdu et en cas de pépins pouvoir résoudre les soucis.

Mais ne vous inquiétez pas si jamais vous avez des soucis lors du tuto, posez vos questions dans les commentaires et je vous répondrez (si j'ai la solution).

<h1>Prérequis</h1>

Pour suivre ce tuto vous allez avoir besoin des logiciels suivants :

<ul>
    <li>Un Linux, peu importe lequel, mais de préférence un sans interface graphique afin de gagner en puissance. Pour ce tuto je vais utiliser <a title="Ubuntu Server" href="http://www.ubuntu.com/download/server" target="_blank">Ubuntu Server</a> 12.04 64bits mais vous pouvez aussi prendre un <a title="Debian" href="https://www.debian.org/index.fr.html">Debian</a> ou <a title="CentOS" href="http://www.centos.org/" target="_blank">CentOS</a></li>
    <li><a title="PuTTY" href="http://the.earth.li/~sgtatham/putty/latest/x86/putty.exe" target="_blank">PuTTY</a> pour les utilisateurs Windows, pour les Mac et Linux le terminal fonctionne très bien</li>
    <li>Un ordinateur pouvant être utilisé comme serveur. Si vous prenez un dédié chez OVH ou autre, la distribution se fait lors de la commande du serveur</li>
    <li>De la patience, de la rigueur et de bons doigts car tout va se faire en lignes de commandes</li>
</ul>

Je vous passe les détails d'installation du Linux car si vous prenez un dédié la distribution sera installée automatiquement et si vous le faites à la main, ce n'est pas très dur. Gravez, installez et c'est fini. Sachant que si vous installez vous même le serveur, un utilisateur différent du <em>root</em> sera créé. Si vous passez par un hébergeur web, il y a de grandes chances que vous n'ayez que le <em>root</em>. Ce n'est pas grave en soit, mais pensez juste à mettre un mot de passe assez complexe.

Pour changer votre mot de passe tapez ceci sans spécifier le nom de l'utilisateur :

[shell]
passwd
[/shell]

Je vais utiliser pour ma part un Ubuntu Server 12.04 en machine virtuelle. Cela sera plus simple pour faire les vidéos. Je vous dé-conseil, même pour un serveur local de l'émuler, votre serveur va ramer fortement.

<h1>Connexion au serveur</h1>

La connexion au serveur va se faire via Secure Shell ou SSH qui est un protocole de connexion sécurisé, comme cela vous n'avez aucunes craintes.

<h2>Windows</h2>

Première chose à faire avec PuTTY c'est créer changer le système d'encodage de l'affichage pour éviter les artefacts :

<ul>
    <li>Window</li>
    <li>Translation</li>
    <li>Et sélectionnez dans le menu déroulant : UTF-8</li>
</ul>

Revenez dans l'onglet Session, et renseignez :

<ul>
    <li><em>Host Name</em> : nomUtilisateur@IP_du_serveur</li>
    <li><em>Port</em> : 22</li>
    <li><em>Connection type</em> : SSH</li>
</ul>

Donnez un nom à votre session, cliquez sur <em>Save</em>. Pour les prochaines connexions, vous aurez juste à cliquer sur le nom de votre session puis <em>Load</em>.

<p style="text-align: center;"><strong><em><a href="//babeuloula.fr/images/lemoncake/putty.png"><img class="alignnone size-medium wp-image-461" src="//babeuloula.fr/images/lemoncake/putty.png" alt="putty" width="300" height="288" /></a></em></strong></p>

Et pour vous connecter cliquez sur <em>Open</em>.

Une nouvelle fenêtre s'ouvre. PuTTY se connecte au serveur.

<h2>Linux et Mac</h2>

Ouvrez le terminal et tapez :

[shell]
ssh nomUtilisateur@IP_du_serveur
[/shell]

La connexion se fait, bien plus simple que pour les Windowsiens.

Maintenant que vous êtes connecté au serveur, rentez votre mot de passe. Je vous avertis tout de suite, lorsque vous allez taper votre mot de passe, il n'y aura pas d'indication sur les caractères tapés. Si vous faites une erreur, validez et recommencez dès qu'il vous redonnera la main.

<h1>Installation des modules principaux</h1>

Nous allons passer maintenant à la partie la plus longue.

Commençons par mettre à jour nos différents paquets et repositories (dépôt, c'est là où sont stocké la plupart des logiciels).

La première fois que vous allez rentrer la commande <em>sudo</em> vous allez devoir rentrer votre mot de passe.

[shell]
sudo apt-get update
sudo apt-get upgrade
[/shell]

Les paquets (ou logiciels) qui vont être installés sont :

<ul>
    <li>apache2 : Installera un serveur Apache, qui est le serveur HTTP qui est la base pour fonctionner</li>
    <li>php5 : Installera PHP5 avec sa dernière version</li>
    <li>libapache2-mod-php5 : Librairie qui permet de lier apache et php</li>
    <li>mysql-server : Installera MySQL pour les bases de données</li>
    <li>php5-mysql : Librairie qui fait le lien entre PHP5 et MySQL</li>
</ul>

Nous allons lancer l'installation de tous les paquets d'un coup comme cela les dépendances s'installerons en même temps et donc correctement. Mais vous pouvez les installer les unes après les autres, normalement les dépendances doivent s’installer en même temps mais par sécurités ...

[shell]
sudo apt-get install apache2 php5 mysql-server libapache2-mod-php5 php5-mysql
[/shell]

Apache et PHP ne nécessitent pas de paramétrage, par contre MySQL vous demandera d'être très attentif pour ne pas devoir tout refaire du début.

Si c'est pour un serveur local, qui ne sera jamais visible de l’extérieur, je vous conseille de mettre <em>root</em> en utilisateur et <em>root</em> en mot de passe. Ne laissez pas le champ vide sinon cela va créer des erreurs.

<iframe src="//www.youtube-nocookie.com/embed/G-BmjIHCvxw?rel=0" width="420" height="315" frameborder="0" allowfullscreen="allowfullscreen"></iframe>

Une fois tous les paquets installés, essayez de taper dans votre navigateur : http://ip_du_serveur/

Si tout a fonctionné correctement vous devriez avoir le beau message : "It works!".

<h1>Installation de PHPMyAdmin</h1>

Afin de gérer plus facilement nos bases de données je vous propose d'installer PHPMyAdmin

[shell]
sudo apt-get install phpmyadmin
[/shell]

Il va vous demander de sélectionner le serveur web à reconfigurer. Vous avez le choix entre <em>apache2</em> et <em>lighttpd</em>. Comme nous avons installé <em>apache2</em>, nous allons donc reconfigurer <em>apache2</em>. Pour se sélectionner vous devez appuyer sur la touche <em>Espace</em>, puis <em>Tabulation</em> pour aller sur le bouton <em>OK</em>.

Pour fonctionner PHPMyAdmin a besoin d'une base de données. Il va vous demander si vous souhaitez faire cette installation manuellement (difficile), ou si vous souhaitez que <em>dbconfig-common</em> s'en charge pour vous (recommandé). N'étant pas un expert là-dedans, je préfère vous recommander la deuxième solution.

Indiquez le mot de passe créé lors de l'installation de LAMP, chez moi <em>root</em>.

Indiquez un mot de passe pour l'utilisateur PHPMyAdmin, je vous conseille de mettre le même. Celui si servira à créer les utilisateurs si vous êtes plusieurs à utiliser ce serveur et que vous ne voulez pas que vos utilisateurs aient accès aux bases de données des autres.

<iframe src="//www.youtube-nocookie.com/embed/ZneQ8B46nCw?rel=0" width="420" height="315" frameborder="0" allowfullscreen="allowfullscreen"></iframe>

Une fois l'installation terminée, tapez dans votre navigateur : http://ip_du_serveur/phpmyadmin/

Connectez-vous avec le login et mot de passe que vous avez saisie lors de l'installation de MySQL.

Si vous perdez le mot de passe de cet utilisateur faites la commande ci-dessous et modifier le mot de passe. Vous pouvez aussi modifier le nom de l'utilisateur :

[shell]
sudo nano /etc/dbconfig-common/phpmyadmin.conf
sudo reboot
[/shell]

<h1 style="text-align: left;">Vérification des modules web installés</h1>

Pour vérifier facilement les modules web installés, nous allons créer un  fichier php, que vous mettrez à la racine de votre serveur web.

Pour cela nous allons d'abord nous placer dans le dossier du serveur puis grâce à <em>nano</em>, l'éditeur de texte en ligne commande nous allons créer le fichier

[shell]
cd /var/www/sudo nano phpinfo.php
[/shell]

Ecrivez dans le fichier :

[php]
&lt;?php phpinfo(); ?&gt;
[/php]

Pour sauvegarder faites CTRL+O pour écrire le fichier sur le serveur, puis CTRL+X pour fermer <em>nano</em>.

Allez maintenant  avec votre navigateur : http://ip_du_serveur/phpinfo.php et vérifier que tout est bien installé, y compris PDO qui est le système de connexion aux bases de données sécurisé.

<h1>Installation d'un serveur mail</h1>

Si vous utilisez votre serveur pour héberger un site ou plusieurs, vous avez sans doute envie d'avoir des adresses emails <em>moi@monsite.fr</em> ? Nous allons créer l'adresse email suivante : lemon-cake@tuto-lamp.fr ainsi qu'un alias lemoncake@tuto-lamp.fr

Cette partie n'est très pas complexe d'autant que sur la plupart des serveurs web que vous achèterez chez un tiers,  ceci sera préinstallé. Mais il est bon de la connaitre au cas où ...

Pour se faire nous allons utiliser <em>Postfix</em>, qui est un serveur d'envoi (SMTP) libre. Son avantage est qu'il est plus sécurisé que <em>Sendmail </em>et supporte l'IPv6.

[shell]
sudo apt-get install postfix
[/shell]

Sélectionnez "Pas de configuration". Nous ferons la configuration plus tard.

Nous allons maintenant installer un serveur IMAP qui lui est le serveur d'envoi :

[shell]
sudo apt-get install dovecot-imapd
[/shell]

<iframe src="//www.youtube-nocookie.com/embed/dKIin0eBTqg?rel=0" width="420" height="315" frameborder="0" allowfullscreen="allowfullscreen"></iframe>

<h1>Paramétrage de Postfix</h1>

Le paramétrage est assez simple.

[shell]
sudo dpkg-reconfigure postfix
[/shell]

Il va vous demander la configuration que vous souhaitez :

<ul>
    <li>Type de serveur : Site Internet</li>
    <li>Nom du courrier : tuto-lamp.fr</li>
    <li>Destinataire des courriers de root (c'est à dire l'admin du serveur) : admin</li>
    <li>Autres destinations : par défaut</li>
    <li>Mises à jour synchronisées : non</li>
    <li>Réseaux internes : par défaut</li>
    <li>Taille max BAL : 0</li>
    <li>Caractère d'extention : *</li>
    <li>Protocoles : tous</li>
</ul>

Par défaut, Postfix va utiliser le format de stockage Mailbox qui va créer des répertoires correspondant aux boites mails dans /home/. Or, nous ne souhaitons pas utiliser ceci, nous allons donc lui dire d'utiliser Maildir

[shell]
sudo nano /etc/postfix/main.cf
[/shell]

Tout en bas du fichier ajoutez la ligne :

[shell]
home_mailbox = Maildir/
[/shell]

Pour appliquer les changements il faut redémarrer le service Postfix

[shell]
sudo service postfix restart
[/shell]

<iframe src="//www.youtube-nocookie.com/embed/TxrB86jOUl8?rel=0" width="420" height="315" frameborder="0" allowfullscreen="allowfullscreen"></iframe>

<h1>Paramétrage du serveur IMAP</h1>

Par défaut lors de l'installation de Dovecot, IMAP + SSL et comme juste avant nous avons configuré Postfix avec Maildir, il faut lui indiquer de l'utiliser

[shell]
sudo nano /etc/dovecot/conf.d/10-mail.conf
[/shell]

Et commentez/décommentez avec <em>#</em> (suivant les cas) la ligne suivante :

[shell]
mail_location = maildir:~/Maildir
[/shell]

Et on relance le service pour appliquer les changements :

[shell]
sudo service dovecot restart
[/shell]

<iframe src="//www.youtube-nocookie.com/embed/W-5TCvuTvYs?rel=0" width="420" height="315" frameborder="0" allowfullscreen="allowfullscreen"></iframe>

<h1>Création de la boite emails</h1>

Lors de la configuration de Postfix, nous avions juste créé la boite mail de l'admin. Maintenant si nous voulons avoir notre propre adresse email il faut la créer.

Tout d'abord il faut créer le compte utilisateur :

[shell]
sudo useradd -m lemon-cake
sudo passwd lemon-cake
[/shell]

Et comme des fois les gens ne savent pas écrire des adresses emails, je vous conseille de créer un alias. C'est une autre adresse email qui sera redirigé vers la bonne. Ainsi si la personne envoi un mail à <em>lemoncake@tuto-lamp.fr</em>, l'mail ira directement à <em>lemon-cake@tuto-lamp.fr</em>.

[shell]
sudo nano /etc/aliases
[/shell]

Ajoutez en bas du fichier :

[shell]
lemoncake: lemon-cake
[/shell]

La syntaxe est toujours <em>utilisateurARediriger: utilisateurPrincipal</em>

Il faut maintenant valider cet alias et recharger Postfix

[shell]
sudo newaliases
sudo service postfix reload
[/shell]

<iframe src="//www.youtube-nocookie.com/embed/POzuqkS-IZI?rel=0" width="420" height="315" frameborder="0" allowfullscreen="allowfullscreen"></iframe>

<h1>Conclusion</h1>

Voilà la configuration de votre serveur est terminé. Vous pouvez maintenant vous connecter avec FileZilla et les identifiants de connexion PuTTY, en SFTP sur le port 22. Mettez les fichiers dans /var/www/

Si vous avez des soucis de droits d'accès à ce dossier faites :

[shell]
sudo chown NOM_UTILISATEUR /var/www/
[/shell]

Pour ce qui est des adresses emails, vous avez juste paramétrer :

<ul>
    <li>SMTP : smtp.tuto-lamp.fr</li>
    <li>IMAP : imap.tuto-lamp.fr</li>
</ul>

Si vous avez besoin de plus d'options ou si vous ne voulez pas à chaque fois passez en ligne de commande pour créer des adresses emails, je vous conseil <a title="iRedMail" href="http://www.iredmail.org/" target="_blank">iRedMail</a> qui est un autre serveur mail
## Démo

2016-08-30 19:46:40
## Source

http://lemon-cake.fr/?p=447