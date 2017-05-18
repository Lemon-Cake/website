+++
date = "2016-09-20T12:15:41+00:00"
draft = false
title = "Visualiser les photos Windows 10 dans l'ordre d'affichage"
slug = "visualiser-les-photos-windows-10-dans-l-ordre-d-affichage"
tags = ["Problème","Tutorial","Tutoriaux","Windows"]
image = "https://www.babeuloula.fr/images/blog/head/visualiser-les-photos-windows-10-dans-l-ordre-d-affichage.jpg"
comments = true
share = true
author = "BaBeuloula"
description = "Comment afficher correctement l'ordre des photos Windows 10 par rapport à l'ordre de trie demandé"
+++

Quand Windows 10 est sorti j'ai voulu tester sur mon PC portable où je fais des tests dessus et je me suis aperçu d'un soucis assez génant concernant l'affichage des photos.

J'ai voulu faire une recherche dans mes photos de famille et je voulais regarder les photos via la **Visionneuse de photos Windows** (*Windows Photo Viewer* pour les intimes) et à ma grande surprise, lorsque je regardais ces photos, j'arrivais à visualiser des photos qui n'étaient pas du tout issues de la recherche mais du dossier où était contenu la photo que je visualisais.

Afin de corriger ce problème, rendez dans **Editeur de registre**, *Win + R* et tapez *regedit*.

Puis rendez-vous dans `HKEY_CLASSES_ROOT\jpegfile\shell\open\DropTarget` et creez une **Nouvelle valeur chaîne**, nommez là `Clsid`. Double cliquez dessus et rentrez la valeur `{FFE2A43C-56B9-4bf5-9A79-CC6D4285608A}`

Maintenant vous devriez visualiser les fichiers *.jpg correctement.

Si toutefois, vous souhaitez aussi visualiser les fichiers *.png, rendez-vous dans `HKEY_CLASSES_ROOT\pngfile\shell\open\DropTarget` et créez une **Nouvelle valeur chaîne** avec le même nom et la même valeur que pour les fichiers *.jpg.