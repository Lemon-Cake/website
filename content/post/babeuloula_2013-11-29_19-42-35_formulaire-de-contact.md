+++
date = "2013-11-29T19:42:35+00:00"
draft = false
title = "Formulaire de contact"
slug = "formulaire-de-contact"
tags = ["PHP","Tutoriaux"]
image = "https://www.babeuloula.fr/images/blog/head/1389539_67119338.jpg"
comments = true
share = true
author = "BaBeuloula"
description = "Créer un formulaire de contact en PHP"
+++

Afin que les visiteurs de votre site puissent vous contacter, le mieux serai de mettre en place un formulaire de contact.

Dans ce tutoriel nous allons créer le formulaire en HTML et faire l'envoi du mail en PHP.

<div class="read-more"><!--more--></div>

<h2>Création de la partie HTML</h2>

Pour envoyer des informations en HTML, il faut passer un formulaire avec les balises <strong>form</strong>. Après il faut remplir les attributs :

<ol>
    <li><strong>action</strong> : la page où le script sera exécuté</li>
    <li><strong>method</strong> : <strong>post</strong> fait partir les données en caché ou <strong>get </strong>les fait partir dans l'URL. Faites donc un test vous comprendrez mieux</li>
</ol>

Après les attributs, il faut passer aux champs. Les champs se font avec des <strong>input</strong> avec différents attribut type :

<ul>
    <li><strong>text</strong> : un champs classique, par exemple le nom de la personne</li>
    <li><strong>checkbox</strong> : affiche des cases à cocher (choix multiple)</li>
    <li><strong>hidden</strong> : ne s'affiche pas mais permet de faire passer des données sans que l'utilisateur ne le sache</li>
    <li><strong>password</strong> : comme son nom l'indique, pour les mots de passe. Cache les lettres par des étoiles</li>
    <li><strong>radio</strong> : affiche des cases à cocher (choix unique)</li>
    <li><strong>submit</strong> : affiche un bouton pour soumettre le formulaire</li>
</ul>

Et pour chaque input, il faut penser à mettre l'attribut "name" qui nous permettra de récupérer les données sur notre page PHP. Cette attribut doit être absolument différent les uns des autres pour ne pas créer d'erreurs.

[html]

&lt;form action=&quot;send.php&quot; method=&quot;post&quot;&gt;
	&lt;label for=&quot;nom&quot;&gt;Votre Nom :&lt;/label&gt;
	&lt;input class=&quot;contact_text&quot; type=&quot;text&quot; name=&quot;nom&quot;&gt;

	&lt;label for=&quot;email&quot;&gt;Votre E-mail :&lt;/label&gt;
	&lt;input class=&quot;contact_text&quot; type=&quot;text&quot; name=&quot;email&quot;&gt;

	&lt;label for=&quot;message&quot;&gt;Votre Message :&lt;/label&gt;
	&lt;textarea class=&quot;contact_textarea&quot; name=&quot;message&quot; rows=&quot;7&quot; cols=&quot;10&quot;&gt;&lt;/textarea&gt;

	&lt;input class=&quot;contact_submit&quot; type=&quot;submit&quot; value=&quot;Envoyer&quot;&gt;
&lt;/form&gt;

[/html]

<h2>Création de la partie PHP</h2>

Dans notre fichier PHP nous allons devoir faire plusieurs tests afin de vérifier si tous les champs sont correctement remplis.

[php]

&lt;?php

if(!empty($_POST)) {
	// Permet d'extraire le tableau et crée automatiquement les variables en fonctions des attributs name écrit précédement
	extract($_POST);

	$valid = true;

	// Si le champs nom est vide, cela veut dire qu'il ne l'a pas rempli
	if(empty($nom)) {
		$valid = false;
		$notif = &quot;Veuillez remplir correctement les champs.&quot;;
	}

	// Pareil pour le champs email
	if(empty($email)) {
		$valid = false;
		$notif = &quot;Veuillez remplir correctement les champs.&quot;;
	}

	// Permet de vérifier si le texte écrit dans le champs email est correct
	// S'il contient bien au moins 2 caractères avant l’arobase
	// S'il contient bien une arobase
	// S'il contient bien au moins 2 caractères entre l'arobase et le point
	// S'il y a bien entre 2 et 4 caractères après le point
	// Ce qui permet de vérifier si l'email est bien sous cette forme email@domaine.fr
	if($email != NULL &amp;&amp; !preg_match(&quot;#^[a-z0-9._-]+@[a-z0-9._-]{2,}\.[a-z]{2,4}$#&quot;,$email)) {
		$valid = false;
		$notif = &quot;Veuillez remplir correctement les champs.&quot;;
	}

	// Pareil pour le champs du message
	if(empty($message)) {
		$valid = false;
		$notif = &quot;Veuillez remplir correctement les champs.&quot;;
	}
}

// Si le tout est valide, on va alors envoyer l'email
if($valid) {
	// Spécifiez votre adresse email
	$to = &quot;votre@email.fr&quot;;

	// Spécifiez le sujet
	$subject = &quot;Sujet du mail&quot;;

	// Ne pas toucher. Ce sont les infos pour bien envoyer le mail et être bien encodé
	$headers = 'MIME-Version: 1.0' . &quot;\r\n&quot;;
	$headers .= 'Content-type: text/html; charset=utf-8' . &quot;\r\n&quot;;
	$headers .= &quot;From: &quot;.$nom.&quot; &lt;&quot;.$email.&quot;&gt; \r\n&quot;;
	$headers .= &quot;Reply-To: &quot;.$email;

	// On appel la fonction mail() de PHP afin de l'envoyer
	if(mail($to, $subject, $message, $headers)) {
		$notif = &quot;Votre mail a bien été envoyé.&quot;;
	} else {
		$notif = &quot;Une erreur est survenue lors de l'envoi.&quot;;
	}

	// Permet de vider les variables pour éviter les problèmes
	unset($nom);
	unset($email);
	unset($message);
}

// Affiche le message à l'utilisateur
echo $notif;

?&gt;

[/php]

<h2>Amélioration du formulaire</h2>

Voyons comment améliorer le tout. Car pour le moment tout cela reste un peu moche. Avec l'arrivé du HTML5, de nouveaux attributs sont arrivés. Par exemple les attributs placeholder, required et pattern.

<ul>
    <li><strong>placeholder</strong> : Permet d'afficher un texte à l'utilisateur qui disparaîtra lors de son clic dans le champs</li>
    <li><strong>required</strong> : Permet de bloquer l'envoi du formulaire si le champs en required n'est pas remplie</li>
    <li><strong>pattern</strong> : Permet de créer une règle de détection plus spécifique. A ne pas oublier de coupler avec un required</li>
</ul>

[html]

&lt;input class=&quot;contact_text&quot; type=&quot;text&quot; name=&quot;email&quot; placeholder=&quot;email@domaine.fr&quot; pattern=&quot;^[a-z0-9._-]+@[a-z0-9._-]{2,}\.[a-z]{2,4}$&quot; required&gt;

[/html]

Pour la partie PHP, vous avez dû vous rendre compte que si vous soumettiez le formulaire et qu'une erreur arrive vous aurez perdu toutes vos données. Donc nous pouvons déjà commencer par stocker le message d'erreur et les données de l'utilisateur dans la variable $_SESSION à condition de démarrer la session sur la page de contact et celle de l'envoi avec la fonction session_start();

Voici maintenant les deux pages modifiés :

[php]

&lt;?php session_start(); ?&gt;

&lt;?php if(isset($_SESSION['notif'])) { echo $_SESSION['notif'] } ?&gt;

&lt;form action=&quot;send.php&quot; method=&quot;post&quot;&gt;
	&lt;label for=&quot;nom&quot;&gt;Votre Nom :&lt;/label&gt;
	&lt;input type=&quot;text&quot; name=&quot;nom&quot; value=&quot;&lt;?php if(isset($_SESSION['nom'])) { echo $_SESSION['nom'] } ?&gt;&quot;&gt;

	&lt;label for=&quot;email&quot;&gt;Votre E-mail :&lt;/label&gt;
	&lt;input type=&quot;text&quot; name=&quot;email&quot; value=&quot;&lt;?php if(isset($_SESSION['email'])) { echo $_SESSION['email'] } ?&gt;&quot;&gt;

	&lt;label for=&quot;message&quot;&gt;Votre Message :&lt;/label&gt;
	&lt;textarea name=&quot;message&quot; rows=&quot;7&quot; cols=&quot;10&quot;&gt;&lt;?php if(isset($_SESSION['message'])) { echo $_SESSION['message'] } ?&gt;&lt;/textarea&gt;

	&lt;input type=&quot;submit&quot; value=&quot;Envoyer&quot;&gt;
&lt;/form&gt;

&lt;?php

// On vide notre variable $_SESSION afin que si l'utilisateur actualise la page, les messages disparaissent
unset(isset($_SESSION['nom'], $_SESSION['email'] $_SESSION['message'], $_SESSION['notif']);

?&gt;

[/php]

&nbsp;

[php]

&lt;?php

session_start();

if(!empty($_POST)) {
	extract($_POST);

	$valid = true;

	if(empty($nom)) {
		$valid = false;
		$_SESSION['notif'] = &quot;Veuillez remplir correctement les champs.&quot;;
	}

	if(empty($email)) {
		$valid = false;
		$_SESSION['notif'] = &quot;Veuillez remplir correctement les champs.&quot;;
	}

	if($email != NULL &amp;&amp; !preg_match(&quot;#^[a-z0-9._-]+@[a-z0-9._-]{2,}\.[a-z]{2,4}$#&quot;,$email)) {
		$valid = false;
		$_SESSION['notif'] = &quot;Veuillez remplir correctement les champs.&quot;;
	}

	if(empty($message)) {
		$valid = false;
		$_SESSION['notif'] = &quot;Veuillez remplir correctement les champs.&quot;;
	}

	$_SESSION['nom'] = $nom;
	$_SESSION['email'] = $email;
	$_SESSION['message'] = $message;
}

if($valid) {
	$to = &quot;votre@email.fr&quot;;

	$subject = &quot;Sujet du mail&quot;;

	$headers = 'MIME-Version: 1.0' . &quot;\r\n&quot;;
	$headers .= 'Content-type: text/html; charset=utf-8' . &quot;\r\n&quot;;
	$headers .= &quot;From: &quot;.$nom.&quot; &lt;&quot;.$email.&quot;&gt; \r\n&quot;;
	$headers .= &quot;Reply-To: &quot;.$email;

	if(mail($to, $subject, $message, $headers)) {
		$_SESSION['notif'] = &quot;Votre mail a bien été envoyé.&quot;;
	} else {
		$notif = &quot;Une erreur est survenue lors de l'envoi.&quot;;
	}

	unset($nom);
	unset($email);
	unset($message);
}

// Permet de renvoyer vers une autre page
header(&quot;Location: contact.php&quot;);

?&gt;

[/php]

Voilà, maintenant votre formulaire est quand même un peu mieux et vous avez vos erreurs qui s'affichent sur votre page de contact et les données de l'utilisateur sont conservés.
## Démo

2016-08-30 19:40:48
## Source

http://lemon-cake.fr/?p=175