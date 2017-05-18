+++
date = "2015-11-03T12:30:21+00:00"
draft = false
title = "Le CSS et l'orthographe de ses sélecteurs"
slug = "css-lorthographe-de-selecteurs"
tags = ["CSS","Tutoriaux"]
image = "https://www.babeuloula.fr/images/blog/head/Le-CSS-et-l-orthographe-de-ses-selecteurs.jpg"
comments = true
share = true
author = "BaBeuloula"
description = "Maîtrisez le CSS et son orthographe comme vous ne l'avez jamais fait."
+++

Le <strong>CSS (Cascading Style Sheets)</strong> est un langage web qui permet de rendre vos pages <strong>HTML</strong> un peu plus jolie à vos utilisateur.
Dans ce tuto je vais vous (ré)appendre certaines notions quant aux sélecteurs CSS.
<!--more-->

<h1>Avant propos</h1>

Dans ce tutoriel je vais utiliser certaines balises qui n'existe pas en HTML car ce tuto est la traduction française d'un site dont je vous donnerez le lien dans la conclusion afin que vous puissiez, une fois ce tuto terminé, aller tester vos connaissances.

<h1>Les bases</h1>

Pour sélectionner des composants HTML avec le CSS, cela se fait très simplement.
Vous souhaitez par exemple sélectionner tous les paragraphes <strong>p</strong> de votre site vous avez juste à faire :

[css]
p {
    /* VOTRE CODE */
}
[/css]

Pour sélectionner des balises avec des identifiants (attributs ID).

[css]
div#mon_id {
    /* VOTRE CODE */
}
[/css]

ou des classes (attributs CLASS)

[css]
div.ma_classe {
    /* VOTRE CODE */
}
[/css]

Si vous souhaitez sélectionner des zones spécifiques dans votre code comme par exemple la balise <strong>apple</strong> qui est dans <strong>plate</strong> :

[html]
&lt;div&gt;
    &lt;bento&gt;&lt;/bento&gt;
    &lt;plate&gt;
        &lt;apple/&gt;
    &lt;/plate&gt;
    &lt;apple/&gt;
&lt;/div&gt;
[/html]

[css]
plate apple {
    /* VOTRE CODE */
}
[/css]

Bien sûr vous pouvez combiner ce que l'on a vu plus haut comme ceci :

[css]
plate#mon_id apple {
    /* VOTRE CODE */
}
[/css]

Vous allez sans doute être amené dans votre développement à vouloir utiliser certaines propriétés pour plusieurs classes. Vous pouvez pour cela séparer vos sélecteurs par des <em>virgules</em> (sans limite), comme ceci :

[css]
div#mon_id, p.ma_class, span {
    /* VOTRE CODE */
}
[/css]

<h1>On rentre dans le tas</h1>

<h3>Sélectionner un élément qui suit directement un autre élément</h3>

Pour sélectionner dans votre code par exemple tous les <strong>a</strong> qui suivent un <strong>div</strong> vous pouvez utiliser le sélecteur <em>plus</em> :

[css]
div + a {
    /* VOTRE CODE */
}
[/css]

<h3>Sélectionner les éléments qui suivent directement un autre élément</h3>

Le sélecteur suivant permet de sélectionner plusieurs éléments à la fois. Pour cela il vous faudra utiliser le <strong>tilde</strong> (<strong>ALTGR</strong> + <strong>é</strong> sous Windows) :

[css]
div ~ a {
    /* VOTRE CODE */
}
[/css]

<h3>Sélectionner les enfants directs d'un élément</h3>

Pour sélectionner la balise <strong>apple</strong> qui est un enfant direct de la balise <strong>plate</strong>, il faut utiliser le sélecteur <em>supérieur à</em> :

[html]
&lt;div class=&quot;table&quot;&gt;
    &lt;plate&gt;
        &lt;bento&gt;
            &lt;apple/&gt;
        &lt;/bento&gt;
    &lt;/plate&gt;

    &lt;plate&gt;
        &lt;apple/&gt;
    &lt;/plate&gt;

    &lt;plate&gt;&lt;/plate&gt;

    &lt;apple/&gt;
    &lt;apple class=&quot;small&quot;/&gt;
&lt;/div&gt;
[/html]

[css]
plate &gt; apple {
    /* VOTRE CODE */
}
[/css]

<h1>Les pseudo-sélecteurs</h1>

Les pseudos-sélecteurs sont arrivés pour la plupart avec l'arrivé du <strong>CSS3</strong>. Grâce aux deux points suivit du sélecteur vous allez pouvoir faire des miracles dans votre code.
Par exemple pour sélectionner certains enfants :

[css]
div:first-child /** Sélectionnera le premier enfant **/
div:last-child /** Sélectionnera le dernier enfant **/

div:nth-child(X) /** Sélectionnera le Xème enfant en partant du début **/
div:nth-last-child(X) /** Sélectionnera le Xème enfant en partant de la fin **/

div a:only-child /** Sélectionnera uniquement les a qui seront dans des div **/

a:first-of-type /** Sélectionnera uniquement le premier a dans tous les éléments **/
a:last-of-type /** Sélectionnera uniquement le dernier a dans les éléments **/
a:nth-of-type(X) /** Sélectionnera uniquement le Xème a dans les éléments **/
div a:only-of-type /** Sélectionnera uniquement les a dans les div uniquement s'il est le seul a dans le div parent **/
[/css]

<h1>Les extras</h1>

Pour sélectionner toutes les balises, ou les balises enfants d'une autre vous pouvez utiliser le sélecteur <em>étoile</em> comme ceci :

[css]
* {
    /* VOTRE CODE */
}
/* OU */
div * {
    /* VOTRE CODE */
}
[/css]

<h3>Le CSS est capable de compter pour vous</h3>

Il est parfois agréable de ne colorier qu'une ligne sur 2 dans un tableau par exemple, afin de gagner en visibilité, mais comment faire ? Heureusement le CSS est capable de faire des opérations arithmétique simple :

[css]
table tr:nth-child(2n+1) {
    /* VOTRE CODE */
}
[/css]

Le code va remplacer <em>n</em> par des nombres de 0 à l'infinie et faire :

<ul>
    <li>2 x 0 + 1 = 1</li>
    <li>2 x 1 + 1 = 3</li>
    <li>2 x 2 + 1 = 5</li>
    <li>...</li>
</ul>

<h3>J'ai des choses à l'intérieur ?</h3>

Et oui le CSS est capable de savoir s'il a ou non des choses à l'intérieur de lui. Je m'explique.
Vous souhaitez sélectionner uniquement les div vides :

[css]
div:empty {
    /* VOTRE CODE */
}
[/css]

<h3>Toi je ne t'aime pas</h3>

Il peut être aussi discriminent :

[css]
div:not(.dummy) {
    /* VOTRE CODE */
}
[/css]

Et on peut combiner ceci avec des pseudo-éléments à la place d'une classe, identifiant ou balise.

<h1>Pour aller plus loin</h1>

Vous pouvez aussi styliser des attributs bien spécifiques.

<h3>Placeholder</h3>

Comme par exemple les attributs <strong>placeholder</strong> des <strong>input</strong> ou <strong>textarea</strong>.
Mais cela ne fonctionne pas encore partout, <em>Chrome</em> et <em>Firefox</em> oui, <em>Internet Explorer</em> pas sur tous (à partir de la 10), et <em>Opéra</em> pas du tout :

[css]
input::-moz-placeholder,
input::-webkit-input-placeholder,
input::-ms-input-placeholder {
    /* VOTRE CODE */
}
[/css]

<h3>Bouton <em>input type file</em> <strong>uniquement sous Chrome</strong></h3>

[css]
input::-webkit-file-upload-button {
    /* VOTRE CODE */
}
[/css]

<h1>Conclusion</h1>

Le CSS comment à être de plus en plus riche en (ce qui n'est pas un mal), nous pouvons maintenant outrepassé les design des navigateurs et faire des applications où le design n'a plus de limite.

Pour ceux qui souhaiterai mettre ce billet en pratique je vous conseil <a href="http://flukeout.github.io/" target="_blank">CSS Diner</a> développé par <a href="https://github.com/flukeout" target="_blank">Luke Pacholski</a> développeur et graphiste Canadien chez Mozilla.
## Démo

2016-08-30 19:56:18
## Source

http://lemon-cake.fr/?p=734