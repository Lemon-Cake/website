+++
date = "2015-04-14T00:00:00+00:00"
draft = false
title = "Renommer le dossier d'un compte utilisateur sous Windows 7"
slug = "renommer-le-dossier-d-un-compte-utilisateur-sous-windows-7"
tags = ["Tutorial","Windows"]
image = "https://www.babeuloula.fr/images/blog/head/windows-seven.jpg"
comments = true
share = true
author = "BaBeuloula"
description = ""
+++

<p>J&#39;ai eu le probl&egrave;me ce matin o&ugrave; une <strong>application refusait de se lancer</strong> car j&#39;ai des <strong>accents dans mon nom de session</strong>. Et oui je m&#39;appelle <strong>J&eacute;r&eacute;my</strong> et j&#39;ai &eacute;cris la session pareil. Si jamais vous avez le m&ecirc;me soucis, voici comment renommer le dossier d&#39;un compte utilisateur sous Windows 7, voici la solution</p>

<p><!--more-->Alors vous allez me dire : <em>Mais c&#39;est super simple, on peut le faire dans le panneau de configuration =&gt; Comptes d&#39;utilisateurs</em><br />
Certes, <strong>mais vous n&#39;allez que changer le nom de votre session</strong> mais pas votre dossier pr&eacute;sent dans C:Users</p>

<p>Du coup voici la manip &agrave; faire. Je pr&eacute;cise que si vous le faites bien, vous ne devrez pas avoir de probl&egrave;mes. <strong>Mais sachez que je d&eacute;cline toute responsabilit&eacute; si vous faites planter votre PC.</strong></p>

<p>Tout d&#39;abord, commencez par <strong>lancer la console Windows</strong> (ou CMD pour les intimes) en administrateur. Recherchez <strong>cmd</strong>&nbsp;dans le <strong>menu d&eacute;marrer</strong> de votre PC et faites <strong>Clic droit</strong> =&gt; <strong>D&eacute;marrer en tant qu&#39;administrateur</strong>, et tapez :</p>

<pre class="brush: shell " data-pbcklang="shell" data-pbcktabsize="4">
net users Administrateur /active:yes</pre>

<p>Cette fonction &agrave; pour but d&#39;<strong>activer le compte utilisateur Administrateur sur votre machine</strong> (normalement cach&eacute;).&nbsp;<span style="line-height: 20.7999992370605px;">Faites toute fois attention &agrave; bien le d&eacute;sactiver par la suite pour &eacute;viter que l&#39;on utilise votre PC en administrateur sans votre consentement.</span></p>

<p>Si tout se passe bien, la console devrait vous dire <strong>La commande s&#39;est termin&eacute;e correctement.</strong></p>

<p>Comme pour la <strong>CMD</strong>,&nbsp;<strong>lancez l&#39;outil de configuration syst&egrave;me de Windows</strong>, tapez <strong>msconfig</strong>&nbsp;dans le menu d&eacute;marrer et <strong>lancez-le en administrateur</strong>.<br />
Dans le premier onglet (<strong>G&eacute;n&eacute;ral</strong>), cochez la derni&egrave;re case (<strong>D&eacute;marrage s&eacute;lectif</strong>). Appliquez le tout, et red&eacute;marrez s&#39;il ne vous le demande pas.</p>

<p><em>Ce mode n&#39;est pas le mode sans &eacute;chec, mais un mode o&ugrave; Windows ne charge pas tous les services et qui du coup vous permettra de renommer votre dossier.</em></p>

<p>Une fois votre PC red&eacute;marr&eacute;, <strong>s&eacute;lectionnez la session Administrateur</strong>.</p>

<p>Ouvrez l&#39;explorateur Windows et rendez-vous dans <strong>C:Users</strong>&nbsp;et <strong>renommer votre dossier utilisateur</strong> par le nom que vous souhaitez.</p>

<p><span style="line-height: 20.7999992370605px;">Encore la m&ecirc;me manip que pour la <strong>CMD</strong> et <strong>REGEDIT</strong>,&nbsp;</span><strong style="line-height: 20.7999992370605px;">lancez l&#39;&eacute;diteur de registre Windows</strong><span style="line-height: 20.7999992370605px;">, tapez&nbsp;</span><strong style="line-height: 20.7999992370605px;">regedit</strong><span style="line-height: 20.7999992370605px;">&nbsp;dans le menu d&eacute;marrer et&nbsp;</span><strong style="line-height: 20.7999992370605px;">lancez-le en administrateur</strong><span style="line-height: 20.7999992370605px;">. Puis cherchez :</span></p>

<pre class="brush: shell " data-pbcklang="shell" data-pbcktabsize="4">
HKEY_LOCAL_MACHINE \\ SOFTWARE \\ Microsoft \\ Windows NT \\ CurrentVersion \\ ProfileList</pre>

<p>Dans le dossier <strong>ProfileList</strong>, ne supprimer rien du tout, on va juste &eacute;diter la cl&eacute; <strong>ProfileImagePath&nbsp;</strong>qui correspond &agrave; votre compte. Recherchez donc les sous dossiers, la cl&eacute; ayant comme donn&eacute;e <strong>C:UsersJ&eacute;r&eacute;my</strong>&nbsp;(dans mon cas).<br />
Une fois trouv&eacute;, faites <strong>Clic droit </strong>=&gt;<strong> Modifier</strong>&nbsp;et remplacez le nom du dossier par celui que vous &eacute;crit plus haut.</p>

<p>Vous pouvez fermer la session et d&eacute;marrer votre session habituelle. <strong>Et n&#39;oubliez pas de d&eacute;sactiver la session Administrateur avec la commande suivante :</strong></p>

<pre class="brush: shell " data-pbcklang="shell" data-pbcktabsize="4">
net users Administrateur /active:no</pre>

<p>C&#39;est termin&eacute;, vous pouvez maintenant relancer l&#39;application qui coin&ccedil;ait</p>
