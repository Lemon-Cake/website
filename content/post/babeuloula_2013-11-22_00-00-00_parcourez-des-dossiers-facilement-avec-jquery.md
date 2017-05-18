+++
date = "2013-11-22T00:00:00+00:00"
draft = false
title = "Parcourez des dossiers facilement avec jQuery"
slug = "parcourez-des-dossiers-facilement-avec-jquery"
tags = ["JavaScript","jQuery"]
image = "https://www.babeuloula.fr/images/blog/head/folder.jpg"
comments = true
share = true
author = "BaBeuloula"
description = "Si vous chercher une méthode facile, efficace et jolie de parcourir vos dossiers pour un site Internet sans devoir connaître une seule ligne de PHP"
+++

<p>Si vous chercher une m&eacute;thode facile, efficace et jolie de parcourir vos dossiers pour un site Internet sans devoir conna&icirc;tre une seule ligne de PHP je vous conseil le plugin <a href="http://www.abeautifulsite.net/blog/2008/03/jquery-file-tree/" target="_blank" title="http://www.abeautifulsite.net/blog/2008/03/jquery-file-tree/">jQuery File Tree</a>&nbsp;qui est tr&egrave;s simple &agrave; mettre en place.</p>
<!--more-->

<p>Et voil&agrave; vous avez un syst&egrave;me complet qui vous permettera d&#39;afficher le dossier que vous souhaitez.&nbsp;</p>

<p><a class="zoombox" href="http://www.babeuloula.fr/images/jquery-file-tree.png" title="jQuery File Tree"><img alt="jQuery File Tree" src="http://www.babeuloula.fr/images/jquery-file-tree.png" style="display:block; height:212px; margin-left:auto; margin-right:auto; width:450px" /></a></p>

## Démo

Une démo est visible <a href="http://labs.abeautifulsite.net/archived/jquery-fileTree/demo/" target="_blank">ici</a>
## Source

<pre class="brush: javascript; toolbar: false; first-line: 1; class-name: 'my_personnal_code' ">
$(document).ready( function() {
    $(&#39;#container_id&#39;).fileTree({
            root: &#39;/some/folder/&#39;
    }, function(file) {
        /** TODO **/
    });
});</pre>
