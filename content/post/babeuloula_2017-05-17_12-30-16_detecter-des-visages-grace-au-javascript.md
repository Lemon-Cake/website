+++
date = "2017-05-17T12:30:16+00:00"
draft = false
title = "Détecter des visages grâce au Javascript"
slug = "detecter-des-visages-grace-au-javascript"
tags = ["Algorithme","JavaScript","jQuery","Open-source"]
image = "https://www.babeuloula.fr/images/blog/head/detecter-des-visages-grace-au-javascript.jpg"
comments = true
share = true
author = "BaBeuloula"
description = "Le développeur Jay Salvat a développé un plugin jQuery qui permet de détecter les visages sur des images et des vidéos"
+++

Le développeur [Jay Salvat](http://jaysalvat.com/) a développé un plugin jQuery qui permet de détecter les visages sur des images et des vidéos.

[![jQuery face detection](//www.babeuloula.fr/images/blog/facedetection.jaysalvat.com.png)](//www.babeuloula.fr/images/blog/facedetection.jaysalvat.com.png)

Une fois les visages reconnus, le plugin vous retourne un tableau d'objets avec les informations suivantes :

- **x** - Coordonnée X du visage
- **y** - Coordonnée Y du visage
- **width** - Largeur du visage
- **height** - Hauteur du visage
- **positionX** - Position X par rapport au document
- **positionY** - Position Y par rapport au document
- **offsetX** - Position X par rapport au parent
- **offsetY** - Position Y par rapport au parent
- **scaleX** - Ratio de la largeur entre l'image originale et l'image affichée
- **scaleY** - Ratio de la hauteur entre l'image originale et l'image affichée
- **confidence** - Niveau de confiance

Pour les informations un peu plus techniques et si vous savez lire le Chinois, le plugin est basé sur l'algorithme de [Liu Liu](http://liuliu.me/).

Il existe pour [Bower](https://bower.io/) :

``` shell
bower install jquery.facedetection
```

Et aussi pour [NPM](https://www.npmjs.com/package/jquery.facedetection) :

``` shell
npm install jquery.facedetection
```
## Démo

``` html
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script> 
<script src="path/to/dist/jquery.facedetection.min.js"></script> 

<img id="picture" src="img/face.jpg">

<script>
    $('#picture').faceDetection({
        complete: function (faces) {
            console.log(faces);
        }
    });
</script> 
```

Et si vous souhaitez le voir en action : [http://facedetection.jaysalvat.com/](http://facedetection.jaysalvat.com/)
## Source

Le code source est disponible sur Github ici : [https://github.com/jaysalvat/jquery.facedetection](https://github.com/jaysalvat/jquery.facedetection)