+++
date = "2014-09-16T00:00:00+00:00"
draft = false
title = "Blur et masques en SVG"
slug = "blur-et-masques-en-svg"
tags = ["CSS","CSS3","HTML","HTML5","JavaScript","jQuery","SVG","Tutorial"]
image = "https://www.babeuloula.fr/images/blog/head/flou_mask_svg.jpg"
comments = true
share = true
author = "BaBeuloula"
description = "Créer un masque et du flou avec des SVG"
+++

Il existe de plus en plus de site avec le fond de leur site qui est flouté ou d'autres qui utilisent des formes complexes pour rendre un peu plus joli leur site. Je me suis donc penché sur sur ces techniques et voici quelques petites astuces pour faire du **flou** (ou **blur** en anglais) et pour faire aussi des **masques en SVG**.

Tout d'abord, je tiens à vous dire que si vous ne visualisez pas correctement la demo, c'est sans doute car **votre navigateur gère mal le SVG**. J'ai fais des tests et je n'ai pu voir les **résultats des techniques utilisant du SVG** que sur certains navigateurs.

## Flou ou Blur

Pour ce qui est du système de floutage je vais vous montrer 2 systèmes, l'un utilisant un plugin jQuery, et l'autre utilisant du SVG.

### blur.js

[blur.js](http://www.blurjs.com/) est un plugin jQuery écrite par [Jacob Kelley](https://github.com/jakiestfu) permettant de créer du flou sur le fond d'un div en se basant sur l'arrière plan d'un autre div. Sur son site vous pouvez voir qu'il floute les div d'exemples en se basant sur l'image du fond du site.

``` javascript
$('.target').blurjs({
	source: 'body',             //Background to blur
	radius: 5,                  //Blur Radius
	overlay: '',                //Overlay Color, follow CSS3's rgba() syntax
	offset: {                   //Pixel offset of background-position
		x: 0,
		y: 0
	},
	optClass: '',               //Class to add to all affected elements
	cache: false,               //If set to true, blurred image will be cached and used in the future. If image is in cache already, it will be used.
	cacheKeyPrefix: 'blurjs-',	//Prefix to the keyname in the localStorage object
	draggable: false            //Only used if jQuery UI is present. Will change background-position to fixed
});
```

Ainsi si vous souhaitez **flouter l'image du fond du site** car celui ci est dynamique et que votre client ne sait pas comment flouter une image, placez l'image à flouter en fond du site (sur le **body** par exemple) et mettez rempalcez la classe `target` par **body**.

### SVG

La méthode du SVG fonctionne très bien mais elle n'est pas compatible partout.

#### HTML

``` html
<svg width="300" height="300" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
    <defs>
        <filter id="gaussian_blur">
            <feGaussianBlur in="SourceGraphic" stdDeviation="5"/>
        </filter>
    </defs>
    <image id="image" width="300" height="300" y="0" x="0" xlink:href="IMAGE_A_FLOUTER" />
</svg>
```

#### CSS

``` css
svg {
    filter: url('#gaussian_blur');
}
```

Votre image est maintenant flouté.

## Masque en SVG

Et pour ce qui est du masque, je vais utiliser uniquement du SVG.

``` html
<svg width="300" height="300" baseProfile="full" version="1.2">
    <defs>
        <mask id="mask" maskUnits="userSpaceOnUse" maskContentUnits="userSpaceOnUse" transform="scale(1)">
            <image width="300" height="300" xlink:href="MASQUE" />
        </mask>
    </defs>
    <image id="image" mask="url(#mask)" width="300" height="300" y="0" x="0" xlink:href="IMAGE_A_MASQUER" />
</svg>
```

Et biensûr vous pouvez coupler les 2 méthodes.
## Démo

## Blur

<svg class="blur_no_mask" width="300" height="300" baseProfile="full" version="1.2">
    <defs>
        <filter id="gaussian_blur">
            <feGaussianBlur in="SourceGraphic" stdDeviation="5"/>
        </filter>
    </defs>
    <image id="image" width="300" height="300" y="0" x="0" xlink:href="https://www.babeuloula.fr/images/image.jpg" />
</svg>

<style>
    svg.blur_no_mask {
        filter: url('#gaussian_blur');
    }
</style>

## Masque

<svg width="300" height="300" baseProfile="full" version="1.2">
    <defs>
        <mask id="mask" maskUnits="userSpaceOnUse" maskContentUnits="userSpaceOnUse" transform="scale(1)">
            <image width="300" height="300" xlink:href="https://www.babeuloula.fr/images/mask.png" />
        </mask>
    </defs>
    <image id="image" mask="url(#mask)" width="300" height="300" y="0" x="0" xlink:href="https://www.babeuloula.fr/images/image.jpg" />
</svg>
## Source

## Blur

``` html
<svg class="blur_no_mask" width="300" height="300" baseProfile="full" version="1.2">
    <defs>
        <filter id="gaussian_blur">
            <feGaussianBlur in="SourceGraphic" stdDeviation="5"/>
        </filter>
    </defs>
    <image id="image" width="300" height="300" y="0" x="0" xlink:href="https://www.babeuloula.fr/images/image.jpg" />
</svg>

<style>
    svg.blur_no_mask {
        filter: url('#gaussian_blur');
    }
</style>
```

## Masque

``` html
<svg width="300" height="300" baseProfile="full" version="1.2">
    <defs>
        <mask id="mask" maskUnits="userSpaceOnUse" maskContentUnits="userSpaceOnUse" transform="scale(1)">
            <image width="300" height="300" xlink:href="https://www.babeuloula.fr/images/mask.png" />
        </mask>
    </defs>
    <image id="image" mask="url(#mask)" width="300" height="300" y="0" x="0" xlink:href="https://www.babeuloula.fr/images/image.jpg" />
</svg>
```