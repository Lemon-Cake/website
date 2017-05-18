+++
date = "2016-11-07T12:15:32+00:00"
draft = false
title = "Résoudre "Impossible d’ouvrir l’application avec le compte Administrateur intégré""
slug = "resoudre-impossible-d-ouvrir-l-application-avec-le-compte-administrateur-integre"
tags = ["Problème","Tutorial","Tutoriaux","Windows"]
image = "https://www.babeuloula.fr/images/blog/head/impossible-d-ouvrir-l-application-avec-le-compte-administrateur-integre.jpg"
comments = true
share = true
author = "BaBeuloula"
description = "Comment résoudre l'erreur "Impossible d’ouvrir l’application avec le compte Administrateur intégré" sous Windows 10"
+++

J'ai récement fais l'acquisition de **Gears Of War 4** sur ma console **Xbox One** et j'ai voulu bénéficier de la nouvelle foncitonnalité proposé par **Microsoft**, j'ai nommé **Play Everywhere**. Ce système permet de jouer à un jeu sorti sur **Xbox One** sur votre **PC** et inversement. 

Le problème c'est qu'au lancement de l'application **Xbox** (ou toute autre application proposé par le **Windows Store**), j'avais ce message d'erreur :

[![Impossible d’ouvrir l’application avec le compte Administrateur intégré](//www.babeuloula.fr/images/lua/open-application.png)](//www.babeuloula.fr/images/lua/open-application.png)

Voici comment résoudre le soucis, **très faiclement**.

Le problème vient du fait que votre compte administrateur avec lequel vous êtes connecté n'est pas soumis au **UAC**. Et non ce n'est pas que votre compte ne fait pas partie de **Union Aerospace Corporation** de **Doom** mais ceci **User Account Control** (**UAC**, "contrôle du compte de l'utilisateur" pour les anglophobes). Sans ce contrôle, vous ne pouvez pas éxecuter des applications qui demandent un accès **administrateur** sur votre machine.

Pour résoudre ce soucis, commençons par lancer **l'éditeur de registre**. Soit vous recherchez **regedit** dans la barre de recherche en bas à droite, soit vous le lancez via la commande **Executer** en appuyant simultanément sur les touches `Win + R`. Puis tapez **regedit** et cliquez sur OK.

[![Fenêtre éxecuter Windows 10](//www.babeuloula.fr/images/lua/win_r.png)](//www.babeuloula.fr/images/lua/win_r.png)

Une fois que **l'éditeur de registre** s'est lancé, recherchez, dans la partie gauche, les "dossiers" suivant : 

`HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\`

Sur la partie droite droite vous devriez voir différentes clés avec leurs valeurs, et plus particulièrement la clé **EnableLUA** : 

[![Editeur de registre ou regedit Windows 10](//www.babeuloula.fr/images/lua/regedit.png)](//www.babeuloula.fr/images/lua/regedit.png)

Double cliquez sur cette clé, et modifiez la valeur qui doit être à **0** par **1**.

[![Fenêtre clé de registre EnableLUA regedit](//www.babeuloula.fr/images/lua/enable-lua.png)](//www.babeuloula.fr/images/lua/enable-lua.png)

Redémarrez votre PC et voilà le problème devrait être resolu.