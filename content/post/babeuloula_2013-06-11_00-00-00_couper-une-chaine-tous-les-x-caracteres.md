+++
date = "2013-06-11T00:00:00+00:00"
draft = false
title = "Couper une chaîne tous les X caractères"
slug = "couper-une-chaine-tous-les-x-caracteres"
tags = ["Java","JavaScript","PHP"]
image = "https://www.babeuloula.fr/images/blog/head/no-img-billet.jpg"
comments = true
share = true
author = "BaBeuloula"
description = ""
+++

<p>Voici un petit code simple que j\'ai d&ucirc; mettre en place pour afficher un texte dynamiquement pour une application Android.</p>
<!--more-->
<p>Je devais couper une String tous les 30 caract&egrave;res mais en faisant attention de ne pas couper en plein milieu d\'un mot. Comme je suis un type sympa voici le code qui j\'en suis s&ucirc;r pourra servir. Le voici en JAVA, JavaScript et PHP.</p>
<p>Je vous explique vite fait le code mais je pense que vous le compredrez facilement.</p>
<p>Je coupe ma String d&egrave;s que je trouve un espace. Puis je parcours mon tableau en affectant la taille de la String en cours &agrave; ma variable taille. En m&ecirc;me temps j\'&eacute;cris le contenu de la case du tableau en cours dans ma variable titre en prenant soin de rajouter l\'espace que j\'avais supprim&eacute;. Et si lorsque je parcours mon tableau ma taille est sup&eacute;rieur &agrave; 30 je rajoute un retour chariot et je r&eacute;initialise ma taille &agrave; 0. Et c\'est reparti pour un tour.</p>
## Source

<p><span style=\"text-decoration: underline;\"><strong>JAVA :</strong></span></p>
<pre class=\"brush: java; toolbar: false; first-line: 1; class-name: \'my_personnal_code\' \">int taille = 0;
String[] texte = nom.split(\" \");
String titre = \"\";
for(int i = 0; i &lt; texte.length; i++) {
	taille = taille + texte[i].length();
	titre += texte[i] + \" \";
	
	if(taille &gt; 30) { //remplacer par le nombre de carat&egrave;res
		titre += \"n\";
		taille = 0;
	}
}</pre>
<p><strong><span style=\"text-decoration: underline;\">JavaScript :</span></strong></p>
<pre class=\"brush: javascript; toolbar: false; first-line: 1; class-name: \'my_personnal_code\' \">var taille = 0;
var texte = nom.split(\" \");
var titre = \"\";
for(var i = 0; i &lt; texte.length; i++) {
	taille = taille + texte[i].length();
	titre += texte[i] + \" \";
	
	if(taille &gt; 20) {
		titre += \"\\n\";
		taille = 0;
	}
}</pre>
<p><strong><span style=\"text-decoration: underline;\">PHP :</span></strong></p>
<pre class=\"brush: php; toolbar: false; first-line: 1; class-name: \'my_personnal_code\' \">$taille = 0;
$texte = explode(\" \", $nom);
$titre = \"\";
for($i = 0; $i &lt; count($texte); $i++) {
	$taille = $taille . strlen($texte[$i]);
	$titre .= $texte[$i] . \" \";
	
	if($taille &gt; 20) {
		$titre .= \"<br>\";
		$taille = 0;
	}
}</pre>