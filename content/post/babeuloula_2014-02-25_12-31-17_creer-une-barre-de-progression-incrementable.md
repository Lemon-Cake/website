+++
date = "2014-02-25T12:31:17+00:00"
draft = false
title = "Créer une barre de progression incrémentable"
slug = "creer-une-barre-de-progression-incrementable"
tags = ["AJAX","JavaScript","jQuery","PHP","Tutoriaux"]
image = "https://www.babeuloula.fr/images/blog/head/progress.jpg"
comments = true
share = true
author = "BaBeuloula"
description = "Lorsque vous faites vos scripts avec des requêtes en AJAX, vous avez sans doute dû être confronté au problème "Mais où en est la progression mon script ?""
+++

Lorsque vous faites vos scripts avec des requêtes en AJAX, vous avez sans doute dû être confronté au problème "Mais où en est mon script ?". Et bien voici un petit tutorial simple pour vous apprendre à créer une barre de progression incrémentable très facilement.

<div class="read-more"><!--more--></div>

Lors de ce tutorial nous allons créer 2 scripts PHP, l'un qui servira à savoir où en est l'avancement du script et l'autre qui sera le script à écouter.

<h1>Création de la page HTML</h1>

Cette page HTML sera la page que verra notre utilisateur. Vous pourrez la styliser comme vous le souhaitez. Perso je vais partir sur quelque chose de simple mais moche. Ceci étant juste pour un tuto, je n'ai pas voulu faire un super design.

[html]
&lt;h1&gt;ProgressBar&lt;/h1&gt;

&lt;div class=&quot;progress&quot;&gt;
 Chargement &lt;span&gt;0&lt;/span&gt;% ...
&lt;/div&gt;
&lt;div class=&quot;progressBar&quot;&gt;
 &lt;div class=&quot;bar&quot;&gt;&lt;/div&gt;
&lt;/div&gt;

&lt;button id=&quot;launch&quot;&gt;Lancer le chargement&lt;/button&gt;
[/html]

<h1>Création du CSS</h1>

Le CSS de la page va être très simple. Nous allons faire progresser notre barre dans la div classe "bar", et elle sera contenue dans la div classe "progressBar".

[css]
.progressBar {
    width: 300px;
    background: #CCC;
    border: solid 1px #000;
    height: 30px;
}

.bar {
    background: #F00;
    height: 30px;
    width: 0%;
}
[/css]

<h1>Création du script AJAX</h1>

Et comme nous allons utiliser des scripts PHP, nous allons les lancer via des requêtes AJAX.

Pour ceux qui ne connaissent pas l'AJAX (non ce n'est pas le produit nettoyant) mais <b>Asynchronous JavaScript and XML</b> qui permet de lancer des scripts en arrière plan, sans que l'utilisateur ne s'en aperçoive.

L'exemple le plus parlant est celui de Facebook. Quand vous cliquer sur un "J'aime", votre page ne se recharge pas, juste une petite partie. Et bien ceci est possible grâce à l'AJAX. Si vous voulez voir ces appels, vous pouvez télécharger l’extension Firebug pour Firefox, et faire F12, puis cliquer sur l'onglet "Network". Sous Google Chrome, l’extension est pré-installé.

Afin de rendre tout cela plus facile, j'utilise <a title="jQuery" href="http://jquery.com/download/" target="_blank">jQuery </a>pour faire ces appels. C'est la même chose qu'avec l'XHR en JavaScript pur.

Dès que la personne va cliquer sur le bouton, toutes les secondes, la première requête AJAX va récupérer le pourcentage d'avancement du deuxième script. A chaque fois qu'elle est terminé, on incrémente la barre de progression ainsi que son pourcentage.

Et dans le même temps, une deuxième requête AJAX va se lancer, elle va être le vrai script qui va faire les opérations. Une fois cette requête AJAX terminé, on passe le pourcentage à 100% et on arrête la première requête AJAX.

[javascript]
 $(&quot;#launch&quot;).click(function() {
    var finish = false;

    setInterval(function(){
        if(!finish) {
            $.ajax({
                url: &quot;getProgression.php&quot;,
                success: function(response) {
                    $(&quot;.progress span&quot;).html(response);
                    $(&quot;.progressBar .bar&quot;).css('width', response+'%');
                }
            });
        }
    },1000);

    $.ajax({
        url: &quot;setProgression.php&quot;,
        success: function(response) {
            finish = true;
            $(&quot;.progress span&quot;).html('100');
            $(&quot;.progressBar .bar&quot;).css('width', '100%');
        }
    });
});
[/javascript]

<h1>Création des scripts PHP</h1>

Pour ce tutorial j'ai créé un petit script qui va créer un fichier *.txt qui contiendra le pourcentage d'avancement. Et afin de voir la progression, j'ai mis un sleep(); fait une pause lors du script. Ici elle est d'une seconde.

[php]
/* Calcul de pourcent
 * (Chargé / Total) * 100
 */

$total = 42;
for($charge = 0; $charge &lt; $total; $charge++) {
    sleep(1);
    $pourcent = round(($charge / $total) * 100, 2);
    file_put_contents('progress.txt', $pourcent);
}

unlink('progress.txt');
[/php]

Et voici le script qui va se charger de récupérer le pourcentage. Je regarde d'abord si le fichier existe afin d'éviter les erreurs.

[php]
if(is_file('progress.txt')) {
    echo file_get_contents('progress.txt');
} else {
    echo '0';
}
[/php]

<h1>Démonstration</h1>

Je vous laisse cliquer sur le bouton :

<iframe src="http://depot.babeuloula.fr/AJAX_PHP_ProgressBar/" width="400" height="200"></iframe>

<h1>Modification</h1>

Si jamais vous ne voulez pas passer par la création d'un fichier mais par les sessions PHP, n'oubliez pas à chaque fin d'incrémentation de mettre cette fonction : <a title="session_write_close" href="http://www.php.net/manual/fr/function.session-write-close.php" target="_blank">session_write_close();</a>
## Démo

2016-08-30 19:50:00
## Source

http://lemon-cake.fr/?p=475