+++
date = "2015-08-03T12:30:31+00:00"
draft = false
title = "Les bases du Shell"
slug = "bases-shell"
tags = ["Serveur","Shell","Tutoriaux"]
image = "https://www.babeuloula.fr/images/blog/head/base-shell.jpg"
comments = true
share = true
author = "BaBeuloula"
description = "Si vous utilisez un serveur Linux, il peut être utile d'utiliser le langage Shell qui permet d’exécuter du code. Voici quelques bases pour commencer."
+++

Si vous utilisez un serveur Linux, il peut être utile d'utiliser le langage Shell qui permet d’exécuter du code un peu comme on le ferait avec des fichiers batch (ou *.bat) sous Windows.

<!--more-->

Avant de commencer la programmation je vais vous détailler un peu plus le Shell.
<h1>Qu'est-ce que le Shell ?</h1>
Alors non le Shell n'est pas le nom d'un géant pétrolier mais un langage de programmation des systèmes Unix (Linux et Mac).

Si l'on traduit le mot <strong>Shell</strong> en français cela nous donne <em>coquille</em>,<em> coque </em>ou <em>coquillage</em>. C'est un interpréteur de commandes qui permet d'avoir accès aux commandes et fonctionnalités internes du système d'exploitation. Il est accessible depuis la console ou un terminal.
<h1>Programmation</h1>
Maintenant que l'on en sait un peu plus on va commencer à programmer. Cet article étant pour les novices, je vais essayer de détailler au mieux ce que je vais faire mais je vais aussi ne faire que des codes simples qui peuvent servir. Je ne vais pas me lancer à faire des scripts trop complexes.

Avant de commencer n'importe quel script il faut lui indiquer le type de Shell que nous allons utiliser. Nous allons utiliser le plus connu le bash (Bourne-Again Shell) :

[shell]
#!/bin/bash
[/shell]

Voici un script (<strong>liste.sh</strong>) très simple qui permet de lister les fichiers qui sont dans le dossier de mon script :

[shell]
#!/bin/bash

# Permet de dire que le script sera en UTF-8 et du coup les accents seront pris en charge
export LANG=&quot;fr_FR.UTF-8&quot;

# Permet d'afficher un message à l'utilisateur qui va lancer le script
echo Voici les fichiers qui sont dans ce dossier :

# Liste tous les fichiers et dossier du répertoire courant
ls

# Ferme le script après l’exécution
exit 0
[/shell]

Alors oui c'est très bien mais comment je fais pour le lancer.

[shell]
sh liste.sh
[/shell]

<h2>Les variables</h2>
La création d'une variable est très simple :

[shell]
# Il ne doit y avoir aucun espace de chaque cotés du =, sinon vous aurez une erreur
ma_variable=&quot;Une chaîne de caractère par exemple&quot;

# Affichage de ma variable
echo $ma_variable
[/shell]

En Shell il n'y a pas de concaténation donc voici comment rajouter du texte à la fin de notre variable à la fin :

&nbsp;

[shell]
ma_variable=&quot;Une chaîne de caractère par exemple&quot;
ma_variable=&quot;$ma_variable avec du texte à la fin&quot;
[/shell]

<h2>Le choix dans la date</h2>
Nous pouvons aussi manipuler les dates en Shell :

[shell]
# Afficher la date du jour
echo $(date) # Wed Jul 22 12:40:36 GMT 2015
[/shell]

Si l'on souhaite afficher d'autres informations comme par exemple la date au format dd/mm/aaaa hh:mm:ss

&nbsp;

[shell]
# Le + permet de passer des paramètres à la fonction et les %d, %m ... sont les paramètres.
# Le \ avant le %T ou %H permet d’échapper l'espace car sinon il crée une erreur

echo $(date +%d/%m/%Y\ %T)

# ou
echo $(date +%d/%m/%Y\ %H:%M:%S)
[/shell]

Si vous souhaitez voir tous les paramètres, voici un lien qui les résume tous, et en français : <a href="http://www.christopher.compagnon.name/techno/shell-date.html" target="_blank">http://www.christopher.compagnon.name/techno/shell-date.html</a>
<h2>Les opérateurs (&gt;=, &gt;, &lt;=, &lt;)</h2>
Les opérateurs sont très simple à comprendre

Supérieur à (&gt;)

[shell]
-gt
[/shell]

Supérieur ou égal à (&gt;=)

[shell]
-ge
[/shell]

Inférieur à (&lt;)

[shell]
-lt
[/shell]

Inférieur ou égale à (&lt;=)

[shell]
-le
[/shell]

<h2>Les instructions (if, else, elif)</h2>

[shell]
var=4

# Notez bien cette fois-ci les espaces dans les conditions qui sont important
if [ $var = 1 ]
then
     echo &quot;non&quot;
elif [ $var = 2 ]
then
     echo &quot;toujours pas&quot;
else
     echo &quot;j'abandonne&quot;
fi
[/shell]

<h2>Les boucles (while, until, for)</h2>
<h3>while</h3>
Le <em>while</em> veut dire "tant que". Tant que ma condition est réussie je continue ma boucle.

[shell]
while ma_condition
     do mon_script
done
[/shell]

<h3>until</h3>
Le <em>until</em> (jusqu'à ce que) fonctionne de la façon inverse. Je fais mon script jusqu'à ce que ma condition soit vérifiée.

[shell]
until ma_condition
 do mon_script
done
[/shell]

Pour faire simple. Tant que je dis la vérité, je ne suis pas un menteur. Mais jusqu'à ce que je dise un mensonge, je suis un menteur. Cela peut paraître un peu complexe mais ce n'est rien. Quand vous ferez vos premiers scripts vous comprendrez.
<h3>for</h3>
Le <em>for</em> fonctionne un peu comme le <em>for</em> de <strong>twig</strong> (pour ceux qui utilisent ce moteur de template).

[shell]
for element in elements
    do echo &quot;$element&quot;
done
[/shell]

<h2>Exercice</h2>
Voici un exercice assez simple pour voir si vous avez compris le fonctionnement du Shell.

Vous devrez faire un script qui demande à l'utilisateur de rentrer un mot de passe (que vous aurez défini) et vous lui demanderez de le rentrer à chaque fois si le mot de passe n'est pas le bon.
Ensuite, une fois qu'il aura trouvé le bon mot de passe demandez lui son âge. Il doit être supérieur à 20, sinon dites-lui qu'il est trop jeune. Inférieur ou égale à 30, sinon dites-lui qu'il est trop vieux. Et enfin s'il a le bon age, dites lui que c'est parfait.
<h3>Aide</h3>
Pour récupérer le contenu de ce que l'utilisateur va taper il faut faire :

[shell]
echo &quot;Ma question&quot;
read reponse
[/shell]

<em>reponse</em> est automatiquement une variable.

&nbsp;

Voilà, j'espère que ce petit tuto vous aidera à débuter avec le Shell, et si vous avez des questions ou remarques, laissez-les dans les commentaires.

PS : La réponse est juste après, je vous laisse faire une auto-correction, et en cas de doute, mettez votre proposition dans les commentaires.

&nbsp;

&nbsp;

&nbsp;

&nbsp;

&nbsp;

&nbsp;
<h2>Réponse</h2>

[shell]
#!/bin/bash

magic_word=&quot;secret&quot;

echo &quot;Quel est le mot magique ?&quot;
read mot_magique

while [ $magic_word != $mot_magique ]
do
     echo &quot;Ce n'est pas le bon mot. Réssayez :&quot;
          read mot_magique
done

echo &quot;Bravo ! Mais quel est ton age ?&quot;
read age

if [ $age -le 20 ]
then
          echo &quot;Trop jeune !&quot;
elif [ $age -gt 30 ]
then
          echo &quot;Trop vieux !&quot;
else
          echo &quot;Parfait !&quot;
fi

exit 0
[/shell]

&nbsp;

&nbsp;
## Démo

2015-07-23 15:48:03
## Source

http://lemon-cake.fr/?p=713