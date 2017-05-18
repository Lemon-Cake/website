+++
date = "2014-09-30T00:00:00+00:00"
draft = false
title = "La CNIL et ses cookies, aussi simple d'une tarte au citron"
slug = "la-cnil-et-ses-cookies-aussi-simple-d-une-tarte-au-citron"
tags = ["Information","JavaScript","Tutorial"]
image = "https://www.babeuloula.fr/images/blog/head/tarteaucitron.jpg"
comments = true
share = true
author = "BaBeuloula"
description = ""
+++

<p>La <strong>CNIL </strong>(<strong>Commission Nationale de l&#39;Informatique et des Libert&eacute;s</strong>), a&nbsp;fait passer une directive europ&eacute;enne appel&eacute;e &quot;<strong>paquet t&eacute;l&eacute;com</strong>&quot;, qui dit que d&egrave;s qu&#39;un utilisateur arrive sur votre site vous devez l&#39;informer que votre site utilise des cookies. Voici une solution tr&egrave;s simple pour notifier l&#39;utilisation &agrave; vos utilisateurs.</p>

<p><!--more-->Si vous utilisez un syst&egrave;me de tracking comme <strong>Google Analytics</strong>, un syst&egrave;me de publicit&eacute;, de r&eacute;seau social et j&#39;en passe, vous devez obligatoirement dire &agrave; votre utilisateur et surtout lui laisser le droit de ne pas les accepter. Sinon, et bien si la <strong>CNIL </strong>tombe sur votre site, vous pouvez &ecirc;tre <strong>verbalis&eacute; de 300 000&euro;</strong>, de quoi faire r&eacute;fl&eacute;chir.</p>

<p>Alors bien s&ucirc;r, tous les cookies ne sont doivent pas &ecirc;tre bloqu&eacute;s. Ceux qui permettent le bon fonctionnement de votre site ne doivent pas &ecirc;tre bloqu&eacute;s. Si vous utiliser un syst&egrave;me de session, de param&egrave;tres d&#39;affichage ou autre qui ne concerne que le fonctionnement de votre site vous pouvez le laisser.</p>

<p>Une fois que vous avez notifi&eacute; &agrave; votre utilisateur que vous utilisez les cookies, que sa r&eacute;ponse soit positif ou n&eacute;gatif quant &agrave; l&#39;acceptation des cookies, vous devez cr&eacute;er un cookie contenant son choix et ce pendant <strong>13 mois maximum</strong>.</p>

<p>Pour ceux qui souhaitent&nbsp;plus d&#39;informations, je vous invite &agrave; lire l&#39;article de la <strong>CNIL </strong>:&nbsp;<a href="http://www.cnil.fr/vos-obligations/sites-web-cookies-et-autres-traceurs/que-dit-la-loi/" target="_blank">http://www.cnil.fr/vos-obligations/sites-web-cookies-et-autres-traceurs/que-dit-la-loi/</a></p>

<p>Vous pourrez trouver &agrave; cette adresse d&#39;autres explications :&nbsp;<a href="http://www.webrankinfo.com/dossiers/webmastering/loi-cookies" target="_blank">http://www.webrankinfo.com/dossiers/webmastering/loi-cookies</a></p>

<p>C&#39;est d&#39;ailleurs via ce dernier site que j&#39;ai pu trouver un syst&egrave;me assez simple pour notifier l&#39;utilisation des cookies &agrave; votre utilisateur.</p>

<p>Le petit plugin JavaScript se nomme <a href="https://github.com/AmauriC/tarteaucitron.js" target="_blank">tarteaucitron.js</a>, et s&#39;utilise tr&egrave;s facilement en seulement 4 &eacute;tapes totalement d&eacute;taill&eacute;s et fran&ccedil;ais ! Et&nbsp;comme cela ne sert &agrave; rien de paraphraser, je vous laisser aller regarder sur le site du d&eacute;veloppeur comment tout cela fonctionne :&nbsp;<a href="https://opt-out.ferank.eu/fr/" target="_blank">https://opt-out.ferank.eu/fr/</a></p>

<p>Et pour ceux qui comme moi utilisent <strong>Piwik </strong>&agrave; la place de <strong>Google Analytics</strong>, voici un petit tuto propos&eacute; par la <strong>CNIL </strong>:&nbsp;<a href="http://www.cnil.fr/fileadmin/documents/approfondir/dossier/internet/Configuration_piwik.pdf" target="_blank">http://www.cnil.fr/fileadmin/documents/approfondir/dossier/internet/Configuration_piwik.pdf</a></p>
