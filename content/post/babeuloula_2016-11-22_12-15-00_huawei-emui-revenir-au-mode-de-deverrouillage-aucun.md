+++
date = "2016-11-22T12:15:00+00:00"
draft = false
title = "Huawei EMUI, revenir au mode de déverrouillage Aucun"
slug = "huawei-emui-revenir-au-mode-de-deverrouillage-aucun"
tags = ["Android","Tutorial","Tutoriaux"]
image = "https://www.babeuloula.fr/images/blog/head/huawei-mate-8.jpg"
comments = true
share = true
author = "BaBeuloula"
description = "Comment désactiver le verrouillage par Code ou Schéma de votre téléphone sous Huawei EMUI"
+++

J'ai récement changé mon **Nexus 5** qui commençait à dater par un nouveau téléphone et abandonnant par la même les téléphones **Google** pour un téléphone de la firme chinoise, **Huawei**. J'ai pris le **Mate 8** en provenance direct de chine afin de le payer moins cher. **600€ en Europe, contre 400€ en Chine**. J'ai eu de la chance d'être en **NXT-L29C432**, qui est la ROM Européenne et pas en **NXT-TL00**.

Bref, sur mon **Mate 8**, j'ai la possibilité de mettre en place un **déverrouillage par empreinte digitale**. Le principe est pas mal mais suivant comment on place son doigt, il le détecte plus ou moins bien selon les personnes. A ma grande surprise, je ne pouvais pas revenir au **mode de déverrouillage Aucun**. L'option était grisée et j'avais ce message **Désactivé par l'administrateur, la politique de cryptage ou la mémorisation des identifiants**.

[![Mode de déverrouillage Huawei Mate 8](//www.babeuloula.fr/images/huawei/mode-de-deverrouillage-emui.png)](//www.babeuloula.fr/images/huawei/mode-de-deverrouillage-emui.png)

J'ai donc cherché un peu partout sur Internet j'ai vu que cela était un problème récurrent sur **EMUI** (EMotion UI), qui est la surcouche proposé par **Huawei**. J'ai trouvé diverses solutions me disant, par exemple, de **supprimer tous les certificats de mon téléphone**, **retirer ma carte SD**, **supprimer les comptes Exchange**, et même de faire une **réinstallation d'usine** (factory reset). J'ai même contacté Huawei mais même eux ne savaient pas quoi faire.

J'étais donc prêt à faire le **factory reset** à contre cœur mais avant, je suis allé sur un forum spécialisé **Android**, [FrAndroid](http://www.frandroid.com/), et sur le forum, une personne m'a dit que de tester une solution qui provenait du forum **Honor 8** et celle-ci a fonctionné, la voici :

1. Allez dans **Paramètres** => **Ecran de verrouillage** => choisissez **Schéma** à la place de **Code** ou **Mot de passe**
2. Verrouillez votre téléphone
3. Puis allumez l'écran jusqu'au schéma
4. Rentrez plusieurs fois un schéma différent de celui que vous avez créé
5. Au bout de plusieurs essais, vous allez être bloqué pendant un certain temps
6. Laissez le compte à rebours se terminer
7. Une fois terminé, appuyez sur **PIN de sauvegarde**
8. Rentrez votre **PIN**

Et voilà, vous être revenu au **mode de déverrouillage Aucun**
## Source

[Forum FrAndroid - Supprimer le verrouillage par code, par lagste](http://forum.frandroid.com/topic/241677-supprimer-le-verrouillage-par-code/)

[Image par Andri Koolme](https://www.flickr.com/photos/andrikoolme/26450011456)