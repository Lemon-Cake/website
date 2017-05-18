+++
date = "2017-05-13T19:35:07+00:00"
draft = false
title = "Tester son site sur toutes les versions de Microsoft Internet Explorer"
slug = "tester-son-site-sur-toutes-les-versions-de-microsoft-internet-explorer"
tags = ["HTML","HTML5","JavaScript","jQuery","Logiciel","Navigateur","Problème","Windows"]
image = "https://www.babeuloula.fr/images/blog/head/tester-son-site-sur-toutes-les-versions-de-microsoft-internet-explorer.jpg"
comments = true
share = true
author = "BaBeuloula"
description = "Lors de la réalisation d'un site Internet, il est important de devoir le rendre compatible avec les navigateurs les plus utilisés"
+++

Lors de la réalisation d'un site Internet, il est important de devoir le rendre compatible avec les navigateurs les plus utilisés et surtout avec Microsoft Internet Explorer. Le problème c'est qu'il existe plein de versions différentes de ce navigateur. Et dès que vous allez faire une mise à jour Windows, il va installer automatiquement la dernière version. Du coup plutôt que d'avoir une batterie d'ordinateurs avec toutes les versions d'IE qui existe, Microsoft a pensé à nous, petits développeurs web.

En effet, ils proposent sur leur site de télécharger gratuitement des machines virtuelles avec toutes les versions d'Internet Explorer :

* IE8 (Windows 7)
* IE9 (Windows 7)
* IE10 (Windows 7)
* IE11 (Windows 7)
* IE11 (Windows 8.1)
* Edge (Windows 10)
* Edge Preview (Windows 10)

Et en plus, ils ne se sont pas contenté de les mettre à disposition que sur Windows, elles sont disponibles aussi sur Mac et Linux :

* [VirtualBox](https://www.virtualbox.org/)
* [Vagrant](https://www.vagrantup.com/)
* [HyperV](https://msdn.microsoft.com/fr-fr/library/mt169373(v=ws.11).aspx) (Windows)
* [VPC](https://www.microsoft.com/fr-fr/download/details.aspx?id=3702) (Windows)
* [VMware](http://www.vmware.com/fr.html) (Windows et Mac)
* [Parallels](http://www.parallels.com/fr/) (Mac)

Alors bien sûr, ils ne sont pas fous chez Microsoft. Ces machines virtuelles ne sont disponibles que pendant 90 jours. Après il faudra la réinstaller. Mais comme ça met un peu de temps à s'installer la première fois, je vous conseille de faire un snapshot de votre machine après l'installation.

Pour télécharger les machines virtuelles c'est par ici : [https://developer.microsoft.com/en-us/microsoft-edge/tools/vms/](https://developer.microsoft.com/en-us/microsoft-edge/tools/vms/)