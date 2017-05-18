+++
date = "2016-05-26T12:30:03+00:00"
draft = false
title = "Récupérer le fil d'actualité d'une page Facebook facilement"
slug = "recuperer-fil-dactualite-dune-page-facebook-facilement"
tags = ["AJAX","API","jQuery","PHP","Tutoriaux"]
image = "https://www.babeuloula.fr/images/blog/head/recuperer-le-fil-d-actualite-d-une-page-Facebook-facilement.jpg"
comments = true
share = true
author = "BaBeuloula"
description = "L'API Facebook est une vraie galère quand il s'agit de récupérer des données. Voici comment récupérer le fil d'actualité d'un page Facebook."
+++

Si vous connaissez l'API de Facebook, vous savez à quel point celle-ci est très complexe à utiliser.
Aujourd'hui je vous propose de récupérer le contenu des actualités qui ont été postés sur une page Facebook (dont vous êtes ou non le propriétaire).

<!--more-->

Le but est de ce tuto est d'avoir, sans trop de lignes de code et surtout sans que cela soit indigeste à comprendre, la possibilité d'afficher sur un site le contenu d'une page Facebook avec le design de son site et pas celui de Facebook.

Le tuto est fait actuellement avec la <strong>version 2.6 de l'API Facebook</strong>. Sauf s'ils changent leur système, il devrait toujours être possible de le faire dans les versions futures.

<h2>Création d'une application Facebook</h2>

Nous allons avoir besoin de créer une application Facebook uniquement pour avoir un <em>app_id</em> et un <em>secret</em>.

Commencez par vous rendre sur le site : <a href="https://developers.facebook.com/" target="_blank">https://developers.facebook.com/</a>

Si cela n'est pas fait, loggez vous et cliquez sur le bouton <strong>Ajouter une app</strong> en haut à droite (au niveau de votre image de profile) :

<a href="//babeuloula.fr/images/lemoncake/facebook_dev-1024x755.png"><img class="aligncenter wp-image-820 size-large" src="//babeuloula.fr/images/lemoncake/facebook_dev-1024x755.png" alt="facebook_dev" width="550" height="406" /></a>

Puis sélectionnez <strong>Site web (www)</strong> :

<a href="//babeuloula.fr/images/lemoncake/application_site_web_www.png"><img class="aligncenter wp-image-817 size-full" src="//babeuloula.fr/images/lemoncake/application_site_web_www.png" alt="application_site_web_www" width="938" height="523" /></a>

Dans le champ, rentrer le nom de votre application  et cliquez sur <strong>Create New Facebook App ID</strong> :

<a href="//babeuloula.fr/images/lemoncake/create_app.png"><img class="aligncenter wp-image-818 size-full" src="//babeuloula.fr/images/lemoncake/create_app.png" alt="create_app" width="940" height="308" /></a>

Dans la popup, laissez cocher <strong>non</strong> à la question <em>Est-ce la version de test d’une autre app ?</em>, saisissez votre adresse email qui sera utilisée en cas de soucis avec votre application et pour terminer sélectionnez la catégorie de votre application (perso je préfère mettre la catégorie de la page Facebook dont je veux avoir le contenu) :

<a href="//babeuloula.fr/images/lemoncake/popup_create_app.png"><img class="aligncenter wp-image-821 size-full" src="//babeuloula.fr/images/lemoncake/popup_create_app.png" alt="popup_create_app" width="624" height="610" /></a>

Une fois l'application créée, cliquez sur le bouton <strong>Skip Quick Start</strong> en haut à droite :

<a href="//babeuloula.fr/images/lemoncake/skip_quick_start.png"><img class="aligncenter wp-image-823 size-full" src="//babeuloula.fr/images/lemoncake/skip_quick_start.png" alt="skip_quick_start" width="941" height="305" /></a>

Là vous devriez arriver sur votre <b>Tableau de bord</b> et vous devriez voir votre <em>app_id</em> et votre <em>secret</em>. Notez bien ces informations, elles nous servirons pour la suite :

<img class="aligncenter wp-image-819 size-full" src="//babeuloula.fr/images/lemoncake/credentials.png" alt="credentials" width="801" height="283" />

Et pour terminer sur le site de Facebook, rendez-vous dans <strong>Examen des apps</strong> et passez <em>Votre app est en <strong>développement</strong> et donc indisponible au public</em> sur <strong>oui</strong> et confirmer dans la popup :

<img class="aligncenter wp-image-822 size-full" src="//babeuloula.fr/images/lemoncake/public_app.png" alt="public_app" width="810" height="143" />

<h2>Passons au code PHP</h2>

La partie PHP va être très rapide

[php]

$app_id = 'aaa'; // Remplacez par votre app_id
$secret = 'bbb'; // Remplacez par votre secret

$pageName = 'LemonCake' // Nom de la page Facebook que vous souhaitez récupérer. Ce nom est celui dans l'URL de la page et non le nom réel. Ex: https://www.facebook.com/LemonCake/

$token = $app_id . '|' . $secret; // On prépare le token en séparant $app_id et $secret par un |

// Via cette URL on va récupérer l'identifiant unique de la page pour récupérer les données
$page = file_get_contents('https://graph.facebook.com/' . $pageName . '?fields=fan_count,talking_about_count,name&amp;access_token='.$token);
$page = json_decode($page);

// Récupération de l'identifiant unique de la page
$pageID = $page-&gt;id;

// Récupération du flux de la page
// Dans cette URL on peut voir que je demande de récupérer :
// - L'image du poste
// - Le message
// - La date de création
// - Les partages
// - Les likes et commentaires dont vous pouvez modifier la limite qui là est de 1
$response = file_get_contents(&quot;https://graph.facebook.com/v2.6/$pageID/feed?fields=picture,message,story,created_time,shares,likes.limit(1).summary(true),comments.limit(1).summary(true)&amp;access_token=&quot;.$token);
$response = json_decode($response);

[/php]

Si vous souhaitez visualiser les données je vous conseil de faire un <em>var_dump</em> de <i>$response</i>.

Afin de rendre ce tuto assez complet, je vous donne le code d'une page qui vous affichera le contenu de 2 pages Facebook, celle de <strong>Lemon Cake</strong> et celle de <strong>Golden Moustache</strong>.
J'ai rajouté une partie javascript pour charger le reste de la page via une requête AJAX :

[html]

&lt;!DOCTYPE HTML&gt;

&lt;html lang=&quot;fr&quot;&gt;

    &lt;head&gt;

        &lt;title&gt;Facebook Pages&lt;/title&gt;

        &lt;link title=&quot;defaut&quot; type=&quot;text/css&quot; rel=&quot;stylesheet&quot; href=&quot;https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css&quot; media=&quot;screen&quot;&gt;
        &lt;link title=&quot;defaut&quot; type=&quot;text/css&quot; rel=&quot;stylesheet&quot; href=&quot;http://getbootstrap.com/examples/jumbotron-narrow/jumbotron-narrow.css&quot; media=&quot;screen&quot;&gt;

        &lt;META CHARSET=&quot;UTF-8&quot;&gt;
        &lt;META HTTP-EQUIV=&quot;CONTENT-LANGUAGE&quot; CONTENT=&quot;FR&quot;&gt;
        &lt;META NAME=&quot;VIEWPORT&quot; CONTENT=&quot;WIDTH=DEVICE-WIDTH, INITIAL-SCALE=1.0&quot;&gt;

    &lt;/head&gt;

    &lt;body&gt;

        &lt;div class=&quot;container&quot;&gt;

            &lt;div class=&quot;header clearfix&quot;&gt;
                &lt;h3 class=&quot;text-muted&quot;&gt;Facebook Pages&lt;/h3&gt;
            &lt;/div&gt;

            &lt;div class=&quot;jumbotron text-center&quot;&gt;
                &lt;h1&gt;Facebook Pages&lt;/h1&gt;
                &lt;p class=&quot;lead&quot;&gt;Cliquez sur l'un des boutons suivant pour afficher le fil d'actualité de la page Facebook.&lt;/p&gt;
                &lt;p&gt;
                    &lt;a class=&quot;btn btn-lg btn-success&quot; href=&quot;?pageName=LemonCake&quot; role=&quot;button&quot;&gt;Lemon Cake&lt;/a&gt;
                    &lt;a class=&quot;btn btn-lg btn-success&quot; href=&quot;?pageName=GoldenMoustache&quot; role=&quot;button&quot;&gt;Golden Moustache&lt;/a&gt;
                &lt;/p&gt;
            &lt;/div&gt;

            &lt;?php

                if(isset($_GET['pageName'])) {

            ?&gt;
                    &lt;div class=&quot;actus&quot;&gt;
                        &lt;div class=&quot;row&quot;&gt;
                            &lt;?php

                                $app_id = 'aaa';
                                $secret = 'bbb';

                                $token = $app_id . '|' . $secret;

                                $page = file_get_contents('https://graph.facebook.com/' . $_GET['pageName'] . '?fields=fan_count,talking_about_count,name&amp;access_token='.$token);
                                $page = json_decode($page);

                                $pageID = $page-&gt;id;

                                $response = file_get_contents(&quot;https://graph.facebook.com/v2.6/$pageID/feed?fields=picture,message,story,created_time,shares,likes.limit(1).summary(true),comments.limit(1).summary(true)&amp;access_token=&quot;.$token);
                                $response = json_decode($response);

                                $i = 0;

                                foreach($response-&gt;data as $data) {

                            ?&gt;
                                    &lt;div class=&quot;col-sm-4 text-center&quot;&gt;
                                        &lt;img class=&quot;img-circle&quot; src=&quot;&lt;?php echo isset($data-&gt;picture) ? $data-&gt;picture : 'http://placehold.it/140x140' ?&gt;&quot; width=&quot;140&quot; height=&quot;140&quot;&gt;
                                        &lt;p&gt;&lt;small&gt;&lt;?php echo date('d/m/Y H:i', strtotime($data-&gt;created_time)) ?&gt;&lt;/small&gt;&lt;/p&gt;
                                        &lt;p&gt;&lt;?php echo isset($data-&gt;message) ? $data-&gt;message : '' ?&gt;&lt;/p&gt;
                                        &lt;p&gt;
                                            &lt;button type=&quot;button&quot; class=&quot;btn btn-primary btn-xs&quot;&gt;&lt;?php echo (isset($data-&gt;likes-&gt;summary-&gt;total_count)) ? $data-&gt;likes-&gt;summary-&gt;total_count : 0 ?&gt; j'aime(s)&lt;/button&gt;
                                            &lt;button type=&quot;button&quot; class=&quot;btn btn-success btn-xs&quot;&gt;&lt;?php echo (isset($data-&gt;shares-&gt;count)) ? $data-&gt;shares-&gt;count : 0 ?&gt; partage(s)&lt;/button&gt;
                                            &lt;button type=&quot;button&quot; class=&quot;btn btn-info btn-xs&quot; style=&quot;margin-top: 5px&quot;&gt;&lt;?php echo (isset($data-&gt;comments-&gt;summary-&gt;total_count)) ? $data-&gt;comments-&gt;summary-&gt;total_count : 0 ?&gt; commenaite(s)&lt;/button&gt;
                                        &lt;/p&gt;
                                    &lt;/div&gt;
                            &lt;?php

                                    $i++;

                                    if($i === 3) {

                            ?&gt;
                                        &lt;/div&gt;
                                        &lt;div class=&quot;row&quot;&gt;
                            &lt;?php

                                        $i = 0;
                                    }

                                }

                            ?&gt;

                        &lt;/div&gt;
                    &lt;/div&gt;

                    &lt;p class=&quot;text-center loadMoreActusContainer&quot;&gt;
                        &lt;button data-href=&quot;&lt;?php echo $response-&gt;paging-&gt;next ?&gt;&quot; type=&quot;button&quot; class=&quot;btn btn-primary btn-lg loadMoreActus&quot;&gt;Charger plus d'actualités&lt;/button&gt;
                    &lt;/p&gt;
            &lt;?php

                }

            ?&gt;

            &lt;footer class=&quot;footer&quot;&gt;
                &lt;p&gt;&amp;copy; 2016 Facebook Pages.&lt;/p&gt;
            &lt;/footer&gt;

        &lt;/div&gt;

        &lt;script type=&quot;text/javascript&quot; src=&quot;https://code.jquery.com/jquery-2.2.3.min.js&quot;&gt;&lt;/script&gt;
        &lt;script type=&quot;text/javascript&quot; src=&quot;https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js&quot;&gt;&lt;/script&gt;
        &lt;script type=&quot;text/javascript&quot; src=&quot;http://momentjs.com/downloads/moment-with-locales.js&quot;&gt;&lt;/script&gt;
        &lt;script type=&quot;text/javascript&quot;&gt;
            jQuery(function($){

                $(document).on('click', '.loadMoreActus', function(e) {
                    e.preventDefault();
                    e.stopPropagation();

                    var that = this;

                    href = $(that).attr('data-href');

                    console.log($(that).attr('data-href'));

                    $(that).prop('disabled', true);

                    $.ajax({
                        url: href,
                        type: 'get',
                        success: function(response) {
                            var $row = $(&quot;&lt;div/&gt;&quot;).addClass('row');
                            var i = 0;
                            $.each(response.data, function(index, data) {
                                try {
                                    $row.append(
                                        $(&quot;&lt;div/&gt;&quot;).addClass('col-sm-4 text-center').append(
                                            $(&quot;&lt;img/&gt;&quot;).addClass('img-circle').attr('src', (data.picture !== undefined) ? data.picture : 'http://placehold.it/140x140').width(140).height(140),
                                            $(&quot;&lt;p/&gt;&quot;).html(
                                                $(&quot;&lt;small/&gt;&quot;).text(moment(data.created_time).format('DD/MM/YYYY HH:mm'))
                                            ),
                                            $(&quot;&lt;p/&gt;&quot;).text(
                                                (data.message !== undefined) ? data.message : ''
                                            ),
                                            $(&quot;&lt;p/&gt;&quot;).append(
                                                $(&quot;&lt;button/&gt;&quot;).attr('type', 'button').addClass('btn btn-primary btn-xs').append(
                                                    (data.likes !== undefined) ? data.likes.summary.total_count : 0,
                                                    &quot; j'aime(s)&quot;
                                                ),
                                                $(&quot;&lt;button/&gt;&quot;).attr('type', 'button').addClass('btn btn-success btn-xs').css('margin-left', '5px').append(
                                                    (data.shares !== undefined) ? data.shares.count : 0,
                                                    &quot; partage(s)&quot;
                                                ),
                                                $(&quot;&lt;button/&gt;&quot;).attr('type', 'button').addClass('btn btn-info btn-xs').append(
                                                    (data.comments !== undefined) ? data.comments.summary.total_count : 0,
                                                    &quot; commenaite(s)&quot;
                                                )
                                            )
                                        )
                                    );
                                } catch(Err) {
                                    console.log(Err);
                                    console.log(data);
                                }

                                i++;

                                if(i === 3) {
                                    $(&quot;.actus&quot;).append($row);
                                    $row = $(&quot;&lt;div/&gt;&quot;).addClass('row');
                                    i = 0;
                                }
                            });

                            $(&quot;.actus&quot;).append($row);

                            if(response.data.length === 25) {
                                $(&quot;.loadMoreActusContainer&quot;).html(
                                    $(&quot;&lt;button/&gt;&quot;).attr('data-href', response.paging.next).attr('type', 'button').addClass('btn btn-primary btn-lg loadMoreActus').text(&quot;Charger plus d'actualités&quot;)
                                );
                            } else {
                                $(&quot;.loadMoreActusContainer&quot;).html('');
                            }
                        },
                        error: function(response) {
                            alert('ERROR LOAD MORE ACTUS');
                        }
                    });
                });

            });
        &lt;/script&gt;

    &lt;/body&gt;

&lt;/html&gt;
[/html]

Voilà j'espère que ce petit tuto vous aidera
## Démo

2016-05-26 08:05:01
## Source

http://lemon-cake.fr/?p=813