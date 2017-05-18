+++
date = "2014-03-24T00:00:00+00:00"
draft = false
title = "Les fonctions de PHP en JavaScript"
slug = "les-fonctions-de-php-en-javascript"
tags = ["JavaScript","PHP"]
image = "https://www.babeuloula.fr/images/blog/head/jquery.jpg"
comments = true
share = true
author = "BaBeuloula"
description = ""
+++

<p>Si comme moi les fonctions PHP vous sont plus famili&egrave;re que les fonctions JavaScript, je vous conseil de garder&nbsp;ce site en m&eacute;moire.</p>
<!--more-->

<p><a href="http://phpjs.org/functions/" target="_blank">php.js</a> est un site cr&eacute;&eacute; par <a href="https://twitter.com/kvz" target="_blank">Kevin van Zonneveld</a> et ses <a href="http://phpjs.org/authors/" target="_blank">contributeurs</a> qui regroupe toutes (enfin un bon paquet) de fonction PHP en JavaScript. Ainsi si vous avez un site fullJS &agrave; cr&eacute;er et que cela fait bien longtemps que vous n&#39;avez pas touch&eacute; &agrave; ce langage vous trouverez votre bonheur sur ce site.</p>

<p>Si vous utilisez NodeJS pour vos projet voi&ccedil;i comment l&#39;installer :</p>

<pre class="brush:plain;" title="">
$ mkdir test &amp;&amp; cd $_
$ npm install phpjs
$ $EDITOR try.js</pre>

<p>Dans la liste des fonctions les plus connues vous avez :</p>

<ul>
	<li><a href="http://phpjs.org/functions/echo/" target="_blank">echo</a></li>
	<li><a href="http://phpjs.org/functions/explode/" target="_blank">explode</a></li>
	<li><a href="http://phpjs.org/functions/implode/" target="_blank">implode</a></li>
	<li><a href="http://phpjs.org/functions/strip_tags/" target="_blank">strip_tags</a></li>
	<li><a href="http://phpjs.org/functions/stripslashes/" target="_blank">stripslashes</a></li>
	<li><a href="http://phpjs.org/functions/serialize/" target="_blank">serialize</a> et&nbsp;<a href="http://phpjs.org/functions/unserialize/" target="_blank">unserialize</a></li>
	<li><a href="http://phpjs.org/functions/var_dump/" target="_blank">var_dump</a></li>
</ul>

<p>Et sans oublier le lien vers le GitHub du projet :&nbsp;<a href="https://github.com/kvz/phpjs" target="_blank">https://github.com/kvz/phpjs</a></p>

## Source

<pre class="brush:jscript;" title="">
function htmlentities(string, quote_style, charset, double_encode) {
  //  discuss at: http://phpjs.org/functions/htmlentities/
  // original by: Kevin van Zonneveld (http://kevin.vanzonneveld.net)
  //  revised by: Kevin van Zonneveld (http://kevin.vanzonneveld.net)
  //  revised by: Kevin van Zonneveld (http://kevin.vanzonneveld.net)
  // improved by: nobbler
  // improved by: Jack
  // improved by: Rafał Kukawski (http://blog.kukawski.pl)
  // improved by: Dj (http://phpjs.org/functions/htmlentities:425#comment_134018)
  // bugfixed by: Onno Marsman
  // bugfixed by: Brett Zamir (http://brett-zamir.me)
  //    input by: Ratheous
  //  depends on: get_html_translation_table
  //   example 1: htmlentities(&#39;Kevin &amp; van Zonneveld&#39;);
  //   returns 1: &#39;Kevin &amp;amp; van Zonneveld&#39;
  //   example 2: htmlentities(&quot;foo&#39;bar&quot;,&quot;ENT_QUOTES&quot;);
  //   returns 2: &#39;foo&amp;#039;bar&#39;

  var hash_map = this.get_html_translation_table(&#39;HTML_ENTITIES&#39;, quote_style),
    symbol = &#39;&#39;;
  string = string == null ? &#39;&#39; : string + &#39;&#39;;

  if (!hash_map) {
    return false;
  }

  if (quote_style &amp;&amp; quote_style === &#39;ENT_QUOTES&#39;) {
    hash_map[&quot;&#39;&quot;] = &#39;&amp;#039;&#39;;
  }

  if ( !! double_encode || double_encode == null) {
    for (symbol in hash_map) {
      if (hash_map.hasOwnProperty(symbol)) {
        string = string.split(symbol)
          .join(hash_map[symbol]);
      }
    }
  } else {
    string = string.replace(/([sS]*?)(&amp;(?:#d+|#x[da-f]+|[a-zA-Z][da-z]*);|$)/g, function (ignore, text, entity) {
      for (symbol in hash_map) {
        if (hash_map.hasOwnProperty(symbol)) {
          text = text.split(symbol)
            .join(hash_map[symbol]);
        }
      }

      return text + entity;
    });
  }

  return string;
}</pre>

<p>&nbsp;</p>
