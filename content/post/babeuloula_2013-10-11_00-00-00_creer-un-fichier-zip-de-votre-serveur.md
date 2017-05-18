+++
date = "2013-10-11T00:00:00+00:00"
draft = false
title = "Créer un fichier zip de votre serveur et sauvegarde SQL"
slug = "creer-un-fichier-zip-de-votre-serveur"
tags = ["PHP","Serveur","SQL"]
image = "https://www.babeuloula.fr/images/blog/head/no-img-billet.jpg"
comments = true
share = true
author = "BaBeuloula"
description = ""
+++

<p>Pour un projet perso je dois mettre un place un script qui permet de cr&eacute;er un backup des fichiers pr&eacute;sent sur le serveur ainsi que la base de donn&eacute;es. <span style=\"text-decoration: underline;\"><strong>Il faut absolument un serveur avec PHP 5.*</strong></span>.</p>
<!--more-->
<p>Tout d\'abord vous aurez besoin de ce <a title=\"T&eacute;l&eacute;charger backup.php\" href=\"http://www.babeuloula.fr/blog/dl.php?file=fichiers/divers/backup.php\" target=\"_blank\">fichier</a> pour r&eacute;aliser facilement le backup de la base de donn&eacute;es. Ce script a &eacute;t&eacute; r&eacute;alis&eacute; par&nbsp;<a title=\"contact@ab-d.fr\" href=\"mailto:contact@ab-d.fr\">Benoit Asselin</a>, vous pouvez aller sur son site Internet pour plus d\'info sur lui :&nbsp;<a title=\"http://www.ab-d.fr/\" href=\"http://www.ab-d.fr/\" target=\"_blank\">http://www.ab-d.fr/</a>.</p>
<p>Voici le cours d\'OpenClassRoom dont je me suis servi pour ce tuto :&nbsp;<a title=\"Cours ZipArchive\" href=\"http://fr.openclassrooms.com/informatique/cours/les-fonctions-zip-en-php\" target=\"_blank\">http://fr.openclassrooms.com/informatique/cours/les-fonctions-zip-en-php</a></p>
<p>Et la doc php.net :&nbsp;<a title=\"Doc ZipArchive\" href=\"http://php.net/manual/fr/class.ziparchive.php\" target=\"_blank\">http://php.net/manual/fr/class.ziparchive.php</a></p>
## Source

<pre class=\"brush: php; toolbar: false; first-line: 1; class-name: \'my_personnal_code\' \">&lt;!?php 

    require_once \'backup.php\';

    //Fonction qui va nous cr&eacute;er le fichier zip avec tous les fichiers et dossiers
    //Pour plus d\'infos sur la fonction PHP ZipArchive je vous renvoi vers la doc de PHP et le cours d\'OpenClassRooms
    function Zip($source, $destination) {
        if (!extension_loaded(\'zip\') || !file_exists($source)) {
            return false;
        }

        $zip = new ZipArchive();
        if (!$zip-&gt;open($destination, ZIPARCHIVE::CREATE)) {
            return false;
        }

        $source = str_replace(\'\\\', \'/\', realpath($source));

        if (is_dir($source) === true) {
            $files = new RecursiveIteratorIterator(new RecursiveDirectoryIterator($source), RecursiveIteratorIterator::SELF_FIRST);

            foreach ($files as $file) {
                $file = str_replace(\'\\\', \'/\', $file);

                // Ignore \".\" and \"..\" folders
                if (in_array(substr($file, strrpos($file, \'/\') + 1), array(\'.\', \'..\')))
                    continue;

                $file = realpath($file);

                if (is_dir($file) === true) {
                    $zip-&gt;addEmptyDir(str_replace($source . \'/\', \'\', $file . \'/\'));
                } else if (is_file($file) === true) {
                    $zip-&gt;addFromString(str_replace($source . \'/\', \'\', $file), file_get_contents($file));
                }
            }
        } else if (is_file($source) === true) {
            $zip-&gt;addFromString(basename($source), file_get_contents($source));
        }
        
        return $zip-&gt;close();
    }
    
    
    $dir_save = \'wordpress/\';
        
    new BackupMySQL(array(
        \'username\' =&gt; \'login\',
        \'passwd\' =&gt; \'mdp\',
        \'dbname\' =&gt; \'nom_de_votre_base\',
        \'nom_fichier\' =&gt; \'nom_du_fichier_de_sortie\'
    ));

    //Si vous souhaitez enregistrer le dossier courant pensez &agrave; mettre ./ avant
    Zip(\'dossier_a_sauvegarder\', \'chemin/fichier_de_sortie.zip\');

?&gt;</pre>