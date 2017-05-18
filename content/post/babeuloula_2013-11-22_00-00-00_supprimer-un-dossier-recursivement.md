+++
date = "2013-11-22T00:00:00+00:00"
draft = false
title = "Supprimer un dossier récursivement"
slug = "supprimer-un-dossier-recursivement"
tags = ["PHP"]
image = "https://www.babeuloula.fr/images/blog/head/no-img-billet.jpg"
comments = true
share = true
author = "BaBeuloula"
description = ""
+++

<p>Si vous en avez assez de devoir effacer &agrave; la main tout les dossiers et sous dossier sur votre FTP car la fonction <a title=\"http://us2.php.net/fr/rmdir\" href=\"http://us2.php.net/fr/rmdir\" target=\"_blank\">rmdir();</a> de php vous dit que le dossier n\'est pas vide et bien voici une petite fonction qui vous aidera :</p>
<!--more-->
<p>Comme vous pouvez le voir, le script est hyper simple mais cela vous fera sans doute gagner du temps</p>
## Source

<pre class=\"brush: php; toolbar: false; first-line: 1; class-name: \'my_personnal_code\' \">function deleteRecursive($dir) {
    if (is_dir($dir)) {
        $objects = scandir($dir);
        foreach ($objects as $object) {
            if ($object != \".\" &amp;&amp; $object != \"..\") {
                if (filetype($dir . $object) == \"dir\")
                    deleteRecursive($dir . $object); else
                    unlink($dir . $object);
            }
        }
        reset($objects);
        rmdir($dir);
    }
}

$dir = \"../dossier/\";
$folders = scandir($dir);

// Supprime \'.\' et \'..\' du tableau
unset($folders[0], $folders[1]);

foreach ($folders as $f) {
    deleteRecursive($dir . $f);
}</pre>