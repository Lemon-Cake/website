+++
date = "2014-06-01T12:30:25+00:00"
draft = false
title = "Animation d'un fichier PNG sans une seule ligne de JavaScript"
slug = "animation-d-un-fichier-png-sans-une-seule-ligne-de-javascript"
tags = ["Animation","CSS","Sprites","Tutoriaux"]
image = "https://www.babeuloula.fr/images/blog/head/css3_animation.jpg"
comments = true
share = true
author = "BaBeuloula"
description = "Si comme moi vous en avez assez de voir des animations GIF, toutes pixélisés et en 256 couleurs voici comment créer des animations uniquement en CSS3."
+++

Si comme moi vous en avez assez de voir des animations GIF, toutes pixelisés et en 256 couleurs voici comment créer des animations avec un fichier PNG ou JPG très facilement et sans une seule ligne de JavaScript.

<!--more-->

Avant toute chose, si vous souhaitez intégrer ce type d'animations sur vos sites Internet, faites bien attention, car cela n'est compatible qu'à partir d'Internet Explorer 10.

<h1>Création du fichier à animer</h1>

Pour créer ce fichier, il vous faudra créer un sprite. C'est à dire que sur la même image, vous allez placer toutes les images de l'animation. Voici un exemple de sprite :

<a href="//babeuloula.fr/images/lemoncake/google.png"><img class="size-full wp-image-665 aligncenter" src="//babeuloula.fr/images/lemoncake/google.png" alt="google" width="167" height="267" /></a>

Quand vous allez créer ce fichier, pensez bien à noter les dimensions d'une frame, et sa durée, et la durée totale de l'animation.

Vous pouvez télécharger le fichier que je vais me servir pour ce tuto ici : <a href="http://lemon-cake.fr/wp-content/uploads/2014/05/nyan_cat.png">http://lemon-cake.fr/wp-content/uploads/2014/05/nyan_cat.png</a>

<h1>Création de l'animation</h1>

Passons maintenant à l'animation en CSS3. L'image à animé devra être à l'intérieur d'une div (c'est le plus simple). Voici le code HTML :

[html]
&lt;html&gt;
&lt;head&gt;
	&lt;title&gt;Animation&lt;/title&gt;
&lt;/head&gt;
&lt;body&gt;
	&lt;div&gt;
		&lt;img class=&quot;animation&quot; src=&quot;nyan_cat.png&quot; alt=&quot;&quot;&gt;
	&lt;/div&gt;
&lt;/body&gt;
&lt;/html&gt;
[/html]

Et le code CSS :

[css]
div {
	width: 316px;
	height: 200px;
	overflow: hidden;
	display: inline-block;
	-webkit-transition: opacity 100ms ease-in,width 100ms ease-in;
	-moz-transition: opacity 100ms ease-in,width 100ms ease-in;
	-ms-transition: opacity 100ms ease-in,width 100ms ease-in;
	-o-transition: opacity 100ms ease-in,width 100ms ease-in;
	transition: opacity 100ms ease-in,width 100ms ease-in;
	position: relative;
}

.animation {
	-webkit-animation: nyan 750ms steps(7) infinite;
	-moz-animation: nyan 750ms steps(7) infinite;
	-ms-animation: nyan 750ms steps(7) infinite;
	-o-animation: nyan 750ms steps(7) infinite;
	animation: nyan 750ms steps(7) infinite;
	position: absolute;
	top: 0px;
	left: 0px;
}

@-webkit-keyframes nyan {
    0% {
        left: 0;
    }

    to {
        left: -2212px;
    }
}

@-moz-keyframes nyan {
    0% {
        left: 0;
    }

    to {
        left: -2212px;
    }
}

@-ms-keyframes nyan {
    0% {
        left: 0;
    }

    to {
        left: -2212px;
    }
}

@-o-keyframes nyan {
    0% {
        left: 0;
    }

    to {
        left: -2212px;
    }
}

@keyframes nyan {
    0% {
        left: 0;
    }

    to {
        left: -2212px;
    }
}
[/css]

A la place des dimensions de la <em>div</em>, remplacez les par celle de votre animation, et remplacer-les <em>100ms</em>, par le temps d'une <em>frame</em>.

Pour l'animation, remplacer <em>nyan</em>, par le nom de votre animation, <em>750ms</em>, par le temps total de votre animation, et <em>step</em> par le nombre de<em> frames - 1</em>. Le <em>infinite</em>, permet de répéter l'animation à l'infinie.

Puis changez le nom <em>nyan</em> des <em>keyframes</em> par celui de votre animation, et le <em>to</em> par la <em>dimension de votre image - la largeur de 1 frame</em>.

<h1>Résultat final</h1>

Voici le résultat final :

<iframe style="border: none;" src="http://depot.babeuloula.fr/CSS3_Animation/" width="350" height="225"></iframe>
## Démo

2015-12-17 23:52:32
## Source

http://lemon-cake.fr/?p=664