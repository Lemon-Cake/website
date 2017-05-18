+++
date = "2014-04-13T00:00:00+00:00"
draft = false
title = "Ajouter du code dans CKEditor"
slug = "ajouter-du-code-dans-ckeditor"
tags = ["JavaScript"]
image = "https://www.babeuloula.fr/images/blog/head/ckeditor.jpg"
comments = true
share = true
author = "BaBeuloula"
description = ""
+++

<p>Si comme moi vous tenez un blog et vous cherchez un plugin <a href="http://ckeditor.com/" target="_blank">CKEditor</a> simple &agrave; utiliser mais tr&egrave;s performant je vous conseil celui ci.</p>
<!--more-->

<p><a href="http://pierrebaron.fr/pbckcode/" target="_blank">pbckcode</a>, est un plugin d&eacute;velopp&eacute; par <a href="http://pierrebaron.fr/" target="_blank">Pierre Baron</a>, qui vous permet d&#39;ajouter du code facilement dans vos textes. Le plugin ajoute directement les bonnes balises, les bonnes classes CSS. Il est compatible avec plusieurs plugins de colorations syntaxiques :</p>

<ul>
	<li><a href="https://code.google.com/p/google-code-prettify/" target="_blank">Google Code Prettify</a></li>
	<li><a href="http://prismjs.com/" target="_blank">Prism.js</a></li>
	<li><a href="http://highlightjs.org/" target="_blank">Highlight.js</a></li>
	<li><a href="http://alexgorbatchev.com/SyntaxHighlighter/" target="_blank">Syntaxhighlighter</a> (celui que j&#39;utilise)</li>
</ul>

<p style="text-align:center"><img alt="" src="http://s1.ckeditor.com/sites/default/files/styles/large/public/pbckcode/pbckcode_screenshot_0.png" style="width: 624px; height: 523px;" /></p>

<pre class="brush: javascript " data-pbcklang="javascript" data-pbcktabsize="4" title="Installation">
CKEDITOR.editorConfig = function( config ) {
     // CKEDITOR TOOLBAR CUSTOMIZATION
     // I only set the needed buttons, so feel frey to add those you want in the array
     config.toolbarGroups = [
         { name: &#39;pbckcode&#39; } ,
         // you other buttons here
     ];
 
     // CKEDITOR PLUGINS LOADING
     config.extraPlugins = &#39;pbckcode&#39;; // add other plugins here (comma separated)
 
     // ADVANCED CONTENT FILTER (ACF)
     // ACF protects your CKEditor instance of adding unofficial tags
     // however it strips out the pre tag of pbckcode plugin
     // add this rule to enable it, useful when you want to re edit a post
     config.allowedContent= &#39;pre[*]{*}(*)&#39;; // add other rules here
 
     // PBCKCODE CUSTOMIZATION
     config.pbckcode = {
         // An optional class to your pre tag.
         cls : &#39;&#39;,
 
         // The syntax highlighter you will use in the output view
         highlighter : &#39;PRETTIFY&#39;,
 
         // An array of the available modes for you plugin.
         // The key corresponds to the string shown in the select tag.
         // The value correspond to the loaded file for ACE Editor.
         modes :  [ [&#39;HTML&#39;, &#39;html&#39;], [&#39;CSS&#39;, &#39;css&#39;], [&#39;PHP&#39;, &#39;php&#39;], [&#39;JS&#39;, &#39;javascript&#39;] ],
 
         // The theme of the ACE Editor of the plugin.
         theme : &#39;textmate&#39;,
 
         // Tab indentation (in spaces)
         tab_size : &#39;4&#39;
     };
 };</pre>

<p>Vous avez plus de 40 langage pris en compte et plus de 30 th&egrave;mes.</p>

<pre class="brush: javascript " data-pbcklang="javascript" data-pbcktabsize="4" title="Langages">
 [&#39;C/C++&#39;        , &#39;c_pp&#39;]
 [&#39;C9Search&#39;     , &#39;c9search&#39;]
 [&#39;Clojure&#39;      , &#39;clojure&#39;]
 [&#39;CoffeeScript&#39; , &#39;coffee&#39;]
 [&#39;ColdFusion&#39;   , &#39;coldfusion&#39;]
 [&#39;C#&#39;           , &#39;csharp&#39;]
 [&#39;CSS&#39;          , &#39;css&#39;]
 [&#39;Diff&#39;         , &#39;diff&#39;]
 [&#39;Glsl&#39;         , &#39;glsl&#39;]
 [&#39;Go&#39;           , &#39;golang&#39;]
 [&#39;Groovy&#39;       , &#39;groovy&#39;]
 [&#39;haXe&#39;         , &#39;haxe&#39;]
 [&#39;HTML&#39;         , &#39;html&#39;]
 [&#39;Jade&#39;         , &#39;jade&#39;]
 [&#39;Java&#39;         , &#39;java&#39;]
 [&#39;JavaScript&#39;   , &#39;javascript&#39;]
 [&#39;JSON&#39;         , &#39;json&#39;]
 [&#39;JSP&#39;          , &#39;jsp&#39;]
 [&#39;JSX&#39;          , &#39;jsx&#39;]
 [&#39;LaTeX&#39;        , &#39;latex&#39;]
 [&#39;LESS&#39;         , &#39;less&#39;]
 [&#39;Liquid&#39;       , &#39;liquid&#39;]
 [&#39;Lua&#39;          , &#39;lua&#39;]
 [&#39;LuaPage&#39;      , &#39;luapage&#39;]
 [&#39;Markdown&#39;     , &#39;markdown&#39;]
 [&#39;OCaml&#39;        , &#39;ocaml&#39;]
 [&#39;Perl&#39;         , &#39;perl&#39;]
 [&#39;pgSQL&#39;        , &#39;pgsql&#39;]
 [&#39;PHP&#39;          , &#39;php&#39;]
 [&#39;Powershell&#39;   , &#39;powershel1&#39;]
 [&#39;Python&#39;       , &#39;python&#39;]
 [&#39;R&#39;            , &#39;ruby&#39;]
 [&#39;OpenSCAD&#39;     , &#39;scad&#39;]
 [&#39;Scala&#39;        , &#39;scala&#39;]
 [&#39;SCSS/Sass&#39;    , &#39;scss&#39;]
 [&#39;SH&#39;           , &#39;sh&#39;]
 [&#39;SQL&#39;          , &#39;sql&#39;]
 [&#39;SVG&#39;          , &#39;svg&#39;]
 [&#39;Tcl&#39;          , &#39;tcl&#39;]
 [&#39;Text&#39;         , &#39;text&#39;]
 [&#39;Textile&#39;      , &#39;textile&#39;]
 [&#39;XML&#39;          , &#39;xml&#39;]
 [&#39;XQuery&#39;       , &#39;xq&#39;]
 [&#39;YAML&#39;         , &#39;yaml&#39;]</pre>

<p>Vous pouvez t&eacute;l&eacute;charger le plugin ici :&nbsp;<a href="http://ckeditor.com/addon/pbckcode" target="_blank">http://ckeditor.com/addon/pbckcode</a></p>

<p>Il est compatible CKEditor 4.0 &agrave; 4.3 pour sa version 1.2.1 (actuelle)</p>

## Démo

<a href="http://pierrebaron.fr/pbckcode/examples/" target="_blank">A cette adresse</a>