+++
date = "2014-05-28T00:00:00+00:00"
draft = false
title = "Convertir les styles CSS en attribut style des balises HTML"
slug = "convertir-les-styles-css-en-attribut-style-des-balises-html"
tags = ["CSS","CSS3","HTML","HTML5","PHP"]
image = "https://www.babeuloula.fr/images/blog/head/html_css_php.jpg"
comments = true
share = true
author = "BaBeuloula"
description = "Intégrez votre CSS aux balises HTML"
+++

<p>Si vous faites un peu d&#39;email en <strong>PHP</strong>, vous avez d&eacute;j&agrave; d&ucirc;t vous rendre compte que les balises <em>style </em>ne passe pas sur tous les webmail (dont <strong>GMail</strong>). Voici la solution &agrave; vos probl&egrave;mes</p>
<!--more-->

[![John Reeve](https://www.babeuloula.fr/images/john_reeve.jpg)](https://www.babeuloula.fr/images/john_reeve.jpg)

<p>Comme j&#39;en avais marre de me casser la t&ecirc;te et d&#39;avoir des remarques comme quoi mes mails sont nuls et ne passent pas partout, j&#39;ai donc pos&eacute; la question &agrave; plusieurs personnes. Et un ami (qui g&egrave;re le site <a href="http://www.databazz.fr/" style="line-height: 1.6em;" target="_blank">DatabaZZ</a>), m&#39;a propos&eacute; cette&nbsp;classe <strong>PHP </strong>d&eacute;velopp&eacute; par <a href="https://github.com/jjriv" target="_blank">John Reeve</a>&nbsp;(photo de droite), <a href="https://github.com/jjriv/emogrifier" target="_blank">Emogrifier</a>.</p>

<p>Cette classe <strong>PHP </strong>est extr&ecirc;mement puissante et vous permet de convertir tout votre code <strong>CSS </strong>et l&#39;int&eacute;grer directement dans vos attributs&nbsp;<em>style&nbsp;</em>des balises <strong>HTML </strong>et il vous recr&eacute;e automatiquement un <strong>DOCTYPE </strong>correcte. Ainsi tous vos emails passeront correctement sur les diff&eacute;rents clients de messagerie et les webmails les plus capricieux (<strong>Outlook </strong>ou <strong>GMail</strong>).&nbsp;</p>

## Source

<pre class="brush: php " data-pbcklang="php" data-pbcktabsize="4" title="Utilisation n°1">
$html = &#39;&lt;html&gt;&lt;h1&gt;Hello world!&lt;/h1&gt;&lt;/html&gt;&#39;;
$css = &#39;h1 {font-size: 32px;}&#39;;
$emogrifier = new Pelago\\Emogrifier($html, $css);

echo $emogrifier-&gt;emogrify();</pre>

<pre class="brush: php " data-pbcklang="php" data-pbcktabsize="4" title="Utilisation n°2">
$emogrifier = new Pelago\\Emogrifier();

$html = &#39;&lt;html&gt;&lt;h1&gt;Hello world!&lt;/h1&gt;&lt;/html&gt;&#39;;
$css = &#39;h1 {font-size: 32px;}&#39;;

$emogrifier-&gt;setHtml($html);
$emogrifier-&gt;setCss($css);

echo $emogrifier-&gt;emogrify();</pre>

<pre class="brush: html " data-pbcklang="html" data-pbcktabsize="4" title="Résultat">
&lt;!DOCTYPE html PUBLIC &quot;-//W3C//DTD HTML 4.0 Transitional//EN&quot; &quot;http://www.w3.org/TR/REC-html40/loose.dtd&quot;&gt;
&lt;html&gt;
    &lt;body&gt;
        &lt;h1 style=&quot;font-size: 32px;&quot;&gt;Hello world!&lt;/h1&gt;
    &lt;/body&gt;
&lt;/html&gt;</pre>
