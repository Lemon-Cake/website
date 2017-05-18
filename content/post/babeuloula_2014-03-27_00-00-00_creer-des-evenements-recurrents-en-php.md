+++
date = "2014-03-27T00:00:00+00:00"
draft = false
title = "Créer des événements récurrents en PHP"
slug = "creer-des-evenements-recurrents-en-php"
tags = ["PHP","Serveur","Tutorial"]
image = "https://www.babeuloula.fr/images/blog/head/calendar.jpg"
comments = true
share = true
author = "BaBeuloula"
description = ""
+++

<p>Aujourd&#39;hui je viens d&#39;&ecirc;tre confront&eacute; &agrave; un probl&egrave;me, comment cr&eacute;er des &eacute;v&eacute;nements r&eacute;currents en PHP mais avec la version 5.2 de PHP ?</p>
<!--more-->

<p>Ce probl&egrave;me ne se serai jamais pos&eacute; si j&#39;avais eu un serveur sous PHP 5.3 ou plus. Et oui car avec l&#39;arriv&eacute;e de la version 5.3, une nouvelle classe a fait son apparition :&nbsp;<a href="http://php.net/manual/fr/class.dateperiod.php" target="_blank">DatePeriod()</a></p>

<p>Cette classe permet justement comme son nom l&#39;indique de cr&eacute;er des p&eacute;riodes avec des dates. Elle n&#39;utilise qu&#39;un contructeur qui s&#39;utilise comme ceci :</p>

<pre class="brush:php;" title="">
public __construct ( DateTime $start , DateInterval $interval , int $recurrences [, int $options ] )
public __construct ( DateTime $start , DateInterval $interval , DateTime $end [, int $options ] )
public __construct ( string $isostr [, int $options ] )</pre>

<p>Je vais utiliser la mathode 2, qui est la plus appropri&eacute;e pour mon cas. J&#39;ai besoin de cr&eacute;er des &eacute;v&eacute;venements toutes les semaines &agrave; partir d&#39;aujourd&#39;hui et sur 2 mois. Je vous laisse regarder le son code source.</p>

## Source

<p>PHP 5.2 :</p>

<pre class="brush:php;" title="">
// Premi&egrave;re date
$begin = new DateTime(&#39;2014-03-27&#39;);

// Date de fin
$end = new DateTime(&#39;2014-05-27&#39;);
               
while($begin &lt; $end) {
    $period[] = $begin-&gt;format(&#39;d/m/Y&#39;);
    $begin-&gt;modify(&#39;+1 week&#39;);
}

foreach($period as $p){
    echo $p . &quot;&lt;br&gt;&quot;;
}</pre>

<p>PHP 5.3 :</p>

<pre class="brush:php;" title="">
// Premi&egrave;re date
$begin = new DateTime(&#39;2014-03-27&#39;);

// Date de fin
$end = new DateTime(&#39;2014-05-27&#39;);

// R&eacute;curence
// Plus 1 semaine
$interval = new DateInterval(&#39;P1W&#39;);

$daterange = new DatePeriod($begin, $interval ,$end);

foreach($daterange as $date){
    echo $date-&gt;format(&quot;d/m/Y&quot;) . &quot;&lt;br&gt;&quot;;
}</pre>
