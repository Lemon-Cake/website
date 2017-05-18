+++
date = "2014-04-14T12:30:25+00:00"
draft = false
title = "Créer des graphiques dynamiques avec Highcharts"
slug = "creer-graphiques-dynamiques-highcharts"
tags = ["Cours","Développement","JavaScript","jQuery","Tutoriaux"]
image = "https://www.babeuloula.fr/images/blog/head/highcharts.jpg"
comments = true
share = true
author = "BaBeuloula"
description = "Apprenez à créer et mettre à jour facilement des graphiques avec la bibliothèque Highcharts."
+++

<a title="Highcharts" href="http://www.highcharts.com/" target="_blank"><strong>Highcharts</strong></a> est un <strong>plugin JavaScript</strong> gratuit vous permettant de créer facilement des graphiques interactifs. Tous ces graphiques sont réalisés en <strong>SVG</strong>, qui est un format d’image vectorielle pour le web.

<strong>Highcharts</strong> propose deux types de librairies. La première <strong>Highstock</strong> (pour la bourse par exemple) et la deuxième, celle que nous allons utiliser, <strong>Highcharts</strong>.

Pour ce tutoriel, nous allons utiliser jQuery. Il est possible de l’utiliser en « Stand Alone » (sans bibliothèque), avec Mootools et avec Prototype.

<div class="read-more"><!--more--></div>

<h1>Mise en place</h1>

Ce tutoriel va s'organiser en deux parties. La première, ici, qui consistera à vous montrer comment fonctionne <strong>Highcharts</strong> et comment créer des graphiques simples. La deuxième partie viendra sous la forme d'un autre tutoriel avec cette fois-ci des graphiques dynamiques, c'est-à-dire avec des données issues d'une base de données MySQL.

<span style="line-height: 1.5em;">Commençons d’abord par lier les fichiers JavaScript à notre page web :</span>

[html]
&lt;script type=&quot;text/javascript&quot; src=&quot;http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js&quot;&gt;&lt;/script&gt;
&lt;script type=&quot;text/javascript&quot; src=&quot;http://code.highcharts.com/highcharts.js&quot;&gt;&lt;/script&gt;
[/html]

Après, comme à chaque fois où l’on utilise un plugin, il faut forcément un container pour stocker les informations. Créez donc une div (ou autre chose) avec un identifiant particulier. Par exemple :

[html]
&lt;div id=&quot;graphique&quot; style=&quot;width: 100%; height: 400px;&quot;&gt;&lt;/div&gt;
[/html]

Vous pouvez après choisir la taille que vous voulez.

<h1>Création de notre premier graphique</h1>

Le plugin prend en paramètre plusieurs données. Vous en avez la liste ici : <a href="http://api.highcharts.com/highcharts" target="_blank">http://api.highcharts.com/highcharts</a>

[javascript]
$(function () {
    $('#graphique').highcharts({
        chart: {
            type: 'bar' // pie pour des graphiques en camembert
        },
        title: {
            text: 'Consommation de fruit'
        },
        xAxis: {
            categories: ['Pommes', 'Bananes', 'Oranges']
        },
        yAxis: {
            title: {
                text: 'Nombre de fruits mangés'
            }
        },
        // Les données de notre graphique
        series: [{
            name: 'Jane',
            data: [1, 0, 4]
        }, {
            name: 'John',
            data: [5, 7, 3]
        }]
    });
});
[/javascript]

Voici ce que cela donne :

<a href="//babeuloula.fr/images/lemoncake/charts-300x245.png"><img class="size-medium wp-image-389 aligncenter" alt="charts" src="//babeuloula.fr/images/lemoncake/charts-300x245.png" width="300" height="245" /></a>

Vous avez vu ce n'est pas trop dur, mais comme vous avez pu vous en rendre compte, les données sont écrites directement dans le code. Or dans un système un peu plus poussé, nous aurons sans doute besoin de récupérer les données via une base de données.

<h1>Modifier dynamiquement les données d'un graphique Highcharts</h1>

Dans notre exemple, John avait mangé 3 Oranges. Mais là, l'envie lui prends d'en manger une autre. Mais comment mettre à jour notre graphique avec cette nouvelle donnée ?

Commençons par récupérer notre objet <strong>highcharts</strong>

[javascript]
var charts = $('#graphique').highcharts();
[/javascript]

Si nous faisons un console.log(charts), nous voyons plusieurs informations qui nous seront utiles pour nos mises à jours. En fouillant dedans on s'aperçoit que les informations sont structurées comme plus haut. Donc si nous voulons mettre à jour le graphique, nous devons changer les <em>series</em>. Nous allons donc faire :

[javascript]
charts.series[1].setData([5,7,4], true);
[/javascript]

Dans series, je sélectionne 1 (deuxième entrée dans le tabeau), car c'est celle qui correspond à John. Puis avec la fonction setData, je lui passe le nouveau tableau de données et le true, permet de dire à <strong>Highcharts</strong> de redessiner le graphique.

Pour pouvez faire de même avec la fonction setSeries, qui vous permettra de rajouter une nouvelle personne.

<h1>Conclusion</h1>

<strong>Highcharts</strong> permet vraiment de grandes choses, mais la meilleure reste encore de pouvoir <strong>charger des graphiques via une base de données</strong>.

Dans le prochain tutoriel, nous verrons comment faire un système de sondage avec l'exploitation des données de 2 façons différentes. L'une en passant directement les informations en JSON et l'autre en stockant les données dans des attributs personnalisés de notre div au cas où nous avons plusieurs sondages a afficher et donc diminuer le nombre de requêtes AJAX et SQL.
## Démo

2016-08-30 19:51:05
## Source

http://lemon-cake.fr/?p=534