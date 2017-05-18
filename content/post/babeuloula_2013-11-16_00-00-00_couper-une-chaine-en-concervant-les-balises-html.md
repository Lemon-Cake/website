+++
date = "2013-11-16T00:00:00+00:00"
draft = false
title = "Couper une chaîne en concervant les balises HTML"
slug = "couper-une-chaine-en-concervant-les-balises-html"
tags = ["Framework","HTML","PHP","SQL"]
image = "https://www.babeuloula.fr/images/blog/head/no-img-billet.jpg"
comments = true
share = true
author = "BaBeuloula"
description = ""
+++

<p>Pour mon travail je dois d&eacute;velopper un syst&egrave;me de news et il faut que sur la page d'acceuil, on n'affiche qu'une petite partie de la news. J'avais bien s&ucirc;r penser &agrave; utiliser la fonction php <a title="http://php.net/manual/fr/function.substr.php" href="http://php.net/manual/fr/function.substr.php" target="_blank">substr()</a> :</p>
<!--more-->
<p>Alors je vous rassure, ce n'est pas moi qui ait adapt&eacute; cette fonction. Non je l'ai trouv&eacute; sur ce site :&nbsp;<a title="http://www.ycerdan.fr/php/tronquer-un-texte-en-conservant-les-tags-html-en-php/" href="http://www.ycerdan.fr/php/tronquer-un-texte-en-conservant-les-tags-html-en-php/" target="_blank">http://www.ycerdan.fr/php/tronquer-un-texte-en-conservant-les-tags-html-en-php/</a></p>
<p>Je vous laisse vous rendre sur son site pour voir comment l'utiliser et regarder les exemples qu'il donne afin que le m&eacute;rite lui revienne. Je ne fais que partager ma d&eacute;couverte</p>
<pre class="brush: php; toolbar: false; first-line: 1; class-name: 'my_personnal_code' ">$string = "<p>Mon texte r&eacute;cup&eacute;r&eacute; depuis ma base de donn&eacute;es SQL</p>";

echo substr ($string , 0, 25);</pre>

<p>Ce qui donne :</p>

<pre class="brush: html; toolbar: false; first-line: 1; class-name: 'my_personnal_code' ">
&lt;p&gt;Mon texte r&eacute;cup&eacute;r&eacute; dep</pre>
<p>Sauf que le probl&egrave;me comme vous pouvez le voir c'est que si jamais vous utiliser comme moi un syst&egrave;me tel que CKEditor ou TinyMCE, il va forc&eacute;ment avoir des balises qui vont se glisser dans votre texte r&eacute;cup&eacute;r&eacute; depuis votre base de donn&eacute;es et du coup votre site va &ecirc;tre totalement d&eacute;form&eacute; &agrave; cause des balises coup&eacute;s.</p>
<p>En cherchant sur Internet et en postant sur un forum on m'a conseill&eacute; cette fonction que je vous copie juste en dessus. Elle est &agrave; la base du framework PHP <a title="http://cakephp.org/" href="http://cakephp.org/" target="_blank">CakePHP</a>&nbsp;et un peu modifi&eacute;e. Vous devez n&eacute;anmoins avoir activ&eacute; la fonction <em><strong>mbstring</strong></em> :</p>
## Source

<pre class="brush: php; toolbar: false; first-line: 1; class-name: 'my_personnal_code' ">/**
 * Truncates text.
 *
 * Cuts a string to the length of $length and replaces the last characters
 * with the ending if the text is longer than length.
 *
 * @param string  $text String to truncate.
 * @param integer $length Length of returned string, including ellipsis.
 * @param mixed $ending If string, will be used as Ending and appended to the trimmed string. Can also be an associative array that can contain the last three params of this method.
 * @param boolean $exact If false, $text will not be cut mid-word
 * @param boolean $considerHtml If true, HTML tags would be handled correctly
 * @return string Trimmed string.
 */
  
function truncate($text, $length = 100, $ending = '...', $exact = true, $considerHtml = false) {
    if (is_array($ending)) {
        extract($ending);
    }
    if ($considerHtml) {
        if (mb_strlen(preg_replace('//', '', $text)) ]*&gt;)?([^&lt;&gt;]*)/', $text, $tags, PREG_SET_ORDER);
        foreach ($tags as $tag) {
            if (!preg_match('/img|br|input|hr|area|base|basefont|col|frame|isindex|link|meta|param/s', $tag[2])) {
                if (preg_match('/]*&gt;/s', $tag[0])) {
                    array_unshift($openTags, $tag[2]);
                } else if (preg_match('/&lt;\/([\w]+)[^&gt;]*&gt;/s', $tag[0], $closeTag)) {
                    $pos = array_search($closeTag[1], $openTags);
                    if ($pos !== false) {
                        array_splice($openTags, $pos, 1);
                    }
                }
            }
            $truncate .= $tag[1];
 
            $contentLength = mb_strlen(preg_replace('/&amp;[0-9a-z]{2,8};|&amp;#[0-9]{1,7};|&amp;#x[0-9a-f]{1,6};/i', ' ', $tag[3]));
            if ($contentLength + $totalLength &gt; $length) {
                $left = $length - $totalLength;
                $entitiesLength = 0;
                if (preg_match_all('/&amp;[0-9a-z]{2,8};|&amp;#[0-9]{1,7};|&amp;#x[0-9a-f]{1,6};/i', $tag[3], $entities, PREG_OFFSET_CAPTURE)) {
                    foreach ($entities[0] as $entity) {
                        if ($entity[1] + 1 - $entitiesLength = $length) {
                break;
            }
        }
 
    } else {
        if (mb_strlen($text) /', $bits, $droppedTags, PREG_SET_ORDER);
                if (!empty($droppedTags)) {
                    foreach ($droppedTags as $closingTag) {
                        if (!in_array($closingTag[1], $openTags)) {
                            array_unshift($openTags, $closingTag[1]);
                        }
                    }
                }
            }
            $truncate = mb_substr($truncate, 0, $spacepos);
        }
    }
 
    $truncate .= $ending;
 
    if ($considerHtml) {
        foreach ($openTags as $tag) {
            $truncate .= '';
        }
    }
 
    return $truncate;
}</pre>