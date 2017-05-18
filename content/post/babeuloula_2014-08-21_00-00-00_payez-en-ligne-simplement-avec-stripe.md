+++
date = "2014-08-21T00:00:00+00:00"
draft = false
title = "Payez en ligne simplement avec Stripe"
slug = "payez-en-ligne-simplement-avec-stripe"
tags = ["Android","API","iOS","Java","PHP","Tutorial"]
image = "https://www.babeuloula.fr/images/blog/head/account-1778.jpg"
comments = true
share = true
author = "BaBeuloula"
description = ""
+++

<p>La derni&egrave;re fois que j&#39;ai programm&eacute; un site de vente en ligne, j&#39;ai d&ucirc; utiliser Paypal car le client ne voulait pas utiliser le syst&egrave;me de sa banque. Vous allez dire que c&#39;est cool car l&#39;API de Paypal est simple. Le seul souci&nbsp;c&#39;est que pour payer on est forc&eacute;ment redirig&eacute; vers leur site Internet.&nbsp;Et bien gr&acirc;ce &agrave;&nbsp;<a href="https://stripe.com/fr" target="_blank">Stripe</a>&nbsp;vous pourrez cr&eacute;er votre propre page de paiement avec vos petits doigts.</p>

<p><!--more-->Stripe est donc un syst&egrave;me de paiement en ligne un peu&nbsp;comme Paypal car il int&egrave;gre un syst&egrave;me de porte-monnaie en ligne. Mais pas seulement, vous pouvez aussi g&eacute;rer des coupons de r&eacute;ductions, des abonnements et en plus super simplement et sans devoir allez sur le site de Stripe pour les g&eacute;rer. &nbsp;</p>

<p>La <a href="https://stripe.com/docs/api" target="_blank">documentation</a> de l&#39;API est tr&egrave;s bien &eacute;crite et super simple. Vous pouvez l&#39;utiliser en :</p>

<ul>
	<li>CURL</li>
	<li>Ruby</li>
	<li>Python</li>
	<li>PHP</li>
	<li>Java</li>
	<li>NodeJS</li>
</ul>

<p>Pour ma part de vais utiliser la version&nbsp;PHP.</p>

<h1>Installation</h1>

<p>Pour l&#39;installation rien de plus simple, soit vous utilisez composer, soit comme moi (car je suis sur un mutualis&eacute;), vous faites tout &agrave; la main. Rendez-vous sur leur <a href="https://github.com/stripe/stripe-php" target="_blank">github</a>,&nbsp;clonez le d&eacute;p&ocirc;t et faites un petit <em>require </em>:</p>

<pre class="brush: php " data-pbcklang="php" data-pbcktabsize="4">
require_once(&quot;/path/to/stripe-php/lib/Stripe.php&quot;);</pre>

<h1>Cr&eacute;er un achat</h1>

<p>Je consid&egrave;re que vous cr&eacute;&eacute; votre page de paiement avec votre<strong> certificat SSL&nbsp;</strong>(car sinon je n&#39;irai jamais payer sur votre site). Si vous souhaitez tester des cartes bleues :&nbsp;<a href="https://stripe.com/docs/testing" target="_blank">https://stripe.com/docs/testing</a></p>

<p>Voici comment cr&eacute;er facilement votre premier paiement :</p>

<pre class="brush: php " data-pbcklang="php" data-pbcktabsize="4">
Stripe::setApiKey(&#39;VOTRE_CLE_API_STRIPE&#39;);
$myCard = array(
    &#39;number&#39; =&gt; &#39;4242424242424242&#39;,
    &#39;exp_month&#39; =&gt; 5, 
    &#39;exp_year&#39; =&gt; 2015,
    &#39;cvc&#39; =&gt; &#39;123&#39;
);
$charge = Stripe_Charge::create(array(&#39;card&#39; =&gt; $myCard, &#39;amount&#39; =&gt; 2000, &#39;currency&#39; =&gt; &#39;eur&#39;));
echo $charge;</pre>

<p>La cl&eacute; API vous la trouvez votre <a class="zoombox" href="http://www.babeuloula.fr/fichiers/images/stripe_dashboard.png">dashboard</a>. <em>number</em>, le num&eacute;ro de carte, <em>exp_month</em>, le mois d&#39;expiration de la date et <em>exp_year</em>, l&#39;ann&eacute;e d&#39;expiration de la date et <em>cvc</em>, le cryptograme de la carte.&nbsp;La valeur retourn&eacute;e est du JSON et structur&eacute;e comme ceci :</p>

<pre class="brush: javascript " data-pbcklang="javascript" data-pbcktabsize="4">
{
  &quot;id&quot;: &quot;ch_14TxMy2eZvKYlo2CUIIvVb9Z&quot;,
  &quot;object&quot;: &quot;charge&quot;,
  &quot;created&quot;: 1408634456,
  &quot;livemode&quot;: false,
  &quot;paid&quot;: true,
  &quot;amount&quot;: 1000,
  &quot;currency&quot;: &quot;usd&quot;,
  &quot;refunded&quot;: false,
  &quot;card&quot;: {
    &quot;id&quot;: &quot;card_14TxMw2eZvKYlo2CtHUYQP6J&quot;,
    &quot;object&quot;: &quot;card&quot;,
    &quot;last4&quot;: &quot;4242&quot;,
    &quot;brand&quot;: &quot;Visa&quot;,
    &quot;funding&quot;: &quot;credit&quot;,
    &quot;exp_month&quot;: 5,
    &quot;exp_year&quot;: 2015,
    &quot;fingerprint&quot;: &quot;Xt5EWLLDS7FJjR1c&quot;,
    &quot;country&quot;: &quot;US&quot;,
    &quot;name&quot;: null,
    &quot;address_line1&quot;: null,
    &quot;address_line2&quot;: null,
    &quot;address_city&quot;: null,
    &quot;address_state&quot;: null,
    &quot;address_zip&quot;: null,
    &quot;address_country&quot;: null,
    &quot;cvc_check&quot;: &quot;pass&quot;,
    &quot;address_line1_check&quot;: null,
    &quot;address_zip_check&quot;: null,
    &quot;customer&quot;: &quot;cus_4dDo4VEnSTnOLu&quot;
  },
  &quot;captured&quot;: true,
  &quot;refunds&quot;: {
    &quot;object&quot;: &quot;list&quot;,
    &quot;total_count&quot;: 0,
    &quot;has_more&quot;: false,
    &quot;url&quot;: &quot;/v1/charges/ch_14TxMy2eZvKYlo2CUIIvVb9Z/refunds&quot;,
    &quot;data&quot;: [

    ]
  },
  &quot;balance_transaction&quot;: &quot;txn_14RYFK2eZvKYlo2CPhRVrMFQ&quot;,
  &quot;failure_message&quot;: null,
  &quot;failure_code&quot;: null,
  &quot;amount_refunded&quot;: 0,
  &quot;customer&quot;: &quot;cus_4dDo4VEnSTnOLu&quot;,
  &quot;invoice&quot;: null,
  &quot;description&quot;: &quot;1000 Test Coins&quot;,
  &quot;dispute&quot;: null,
  &quot;metadata&quot;: {
    &quot;division_profile_id&quot;: &quot;Bingo|www|0c1234567890&quot;,
    &quot;offer_id&quot;: &quot;test_offer_id&quot;,
    &quot;cobra_app_id&quot;: &quot;393048167382719&quot;
  },
  &quot;statement_description&quot;: null,
  &quot;receipt_email&quot;: null
}</pre>

<p>On y retrouve un <em>id</em>, qui correspond &agrave; l&#39;identifiant unique du paiement, <em>created</em>, le timestramp du paiement, <em>paid</em>, si le paiement est r&eacute;ussi ou non, amount, le prix en centimes, <em>card</em>, les donn&eacute;es de la carte bancaire que je vous conseille de sauvegarder, et c&#39;est sans risque pour la personne car vous n&#39;avez que les 4 derniers chiffres sur les 16&nbsp;de sa carte ...</p>

<h1>Remboursement d&#39;un achat</h1>

<p>La cr&eacute;ation des remboursements se d&eacute;roule presque pareil :</p>

<pre class="brush: php " data-pbcklang="php" data-pbcktabsize="4">
$ch = Stripe_Charge::retrieve(&quot;NUMERO_DE_TRANSACTION&quot;);
$re = $ch-&gt;refunds-&gt;create();
echo $re;</pre>

<p>Le num&eacute;ro de la transaction est le num&eacute;ro qui a &eacute;t&eacute; donn&eacute; plus haut. Pensez donc &agrave; le sauvegarder. La valeur de retour est encore du JSON :</p>

<pre class="brush: javascript " data-pbcklang="javascript" data-pbcktabsize="4">
{
  &quot;id&quot;: &quot;ch_14TxMy2eZvKYlo2CUIIvVb9Z&quot;,
  &quot;object&quot;: &quot;charge&quot;,
  &quot;created&quot;: 1408634456,
  &quot;livemode&quot;: false,
  &quot;paid&quot;: true,
  &quot;amount&quot;: 1000,
  &quot;currency&quot;: &quot;usd&quot;,
  &quot;refunded&quot;: true,
  &quot;card&quot;: {
    &quot;id&quot;: &quot;card_14TxMw2eZvKYlo2CtHUYQP6J&quot;,
    &quot;object&quot;: &quot;card&quot;,
    &quot;last4&quot;: &quot;4242&quot;,
    &quot;brand&quot;: &quot;Visa&quot;,
    &quot;funding&quot;: &quot;credit&quot;,
    &quot;exp_month&quot;: 5,
    &quot;exp_year&quot;: 2015,
    &quot;fingerprint&quot;: &quot;Xt5EWLLDS7FJjR1c&quot;,
    &quot;country&quot;: &quot;US&quot;,
    &quot;name&quot;: null,
    &quot;address_line1&quot;: null,
    &quot;address_line2&quot;: null,
    &quot;address_city&quot;: null,
    &quot;address_state&quot;: null,
    &quot;address_zip&quot;: null,
    &quot;address_country&quot;: null,
    &quot;cvc_check&quot;: &quot;pass&quot;,
    &quot;address_line1_check&quot;: null,
    &quot;address_zip_check&quot;: null,
    &quot;customer&quot;: &quot;cus_4dDo4VEnSTnOLu&quot;
  },
  &quot;captured&quot;: true,
  &quot;refunds&quot;: {
    &quot;object&quot;: &quot;list&quot;,
    &quot;total_count&quot;: 0,
    &quot;has_more&quot;: false,
    &quot;url&quot;: &quot;/v1/charges/ch_14TxMy2eZvKYlo2CUIIvVb9Z/refunds&quot;,
    &quot;data&quot;: [
      {
        &quot;id&quot;: &quot;re_4dDpFxqEDLVlWW&quot;,
        &quot;amount&quot;: 1000,
        &quot;currency&quot;: &quot;usd&quot;,
        &quot;created&quot;: 1408634512,
        &quot;object&quot;: &quot;refund&quot;,
        &quot;balance_transaction&quot;: &quot;txn_4dDp5mQgp22BuT&quot;,
        &quot;metadata&quot;: {
        },
        &quot;charge&quot;: &quot;ch_4dDpJRBKEbfzoy&quot;
      }
    ]
  },
  &quot;balance_transaction&quot;: &quot;txn_14RYFK2eZvKYlo2CPhRVrMFQ&quot;,
  &quot;failure_message&quot;: null,
  &quot;failure_code&quot;: null,
  &quot;amount_refunded&quot;: 1000,
  &quot;customer&quot;: &quot;cus_4dDo4VEnSTnOLu&quot;,
  &quot;invoice&quot;: null,
  &quot;description&quot;: &quot;1000 Test Coins&quot;,
  &quot;dispute&quot;: null,
  &quot;metadata&quot;: {
    &quot;division_profile_id&quot;: &quot;Bingo|www|0c1234567890&quot;,
    &quot;offer_id&quot;: &quot;test_offer_id&quot;,
    &quot;cobra_app_id&quot;: &quot;393048167382719&quot;
  },
  &quot;statement_description&quot;: null,
  &quot;receipt_email&quot;: null
}</pre>

<p>On y retrouve les m&ecirc;mes infos que plus haut mais cette fois&nbsp;<em>refunded </em>est pass&eacute; &agrave; <em>true</em>.</p>

<h1>Cr&eacute;ation d&#39;un coupon</h1>

<p>La cr&eacute;ation d&#39;un coupon est elle aussi tr&egrave;s simple :</p>

<pre class="brush: php " data-pbcklang="php" data-pbcktabsize="4">
Stripe_Coupon::create(array(
  &quot;percent_off&quot; =&gt; 25,
  &quot;duration&quot; =&gt; &quot;repeating&quot;,
  &quot;duration_in_months&quot; =&gt; 3,
  &quot;id&quot; =&gt; &quot;25OFF&quot;)
);</pre>

<p><em>percent_off</em>, le pourcentage de r&eacute;duction, <em>duration</em>, indique le si coupon est valable pour une dur&eacute;e d&eacute;termin&eacute;e,&nbsp;<em>duration_in_months</em>, indique combien de temps il peut &ecirc;tre utilis&eacute;, et <em>id</em>, ce que doit rentrer l&#39;utilisateur pour avoir la r&eacute;duction.</p>

<p>Le retour est comme d&#39;habitude du JSON.</p>

<h1>Conclusion</h1>

<p>J&#39;ai volontairement survol&eacute; la doc dans ce petit tuto, mais si vous avez un anglais pas trop nul (si j&#39;ai pu comprendre vous devriez pouvoir) vous arriverez &agrave; faire ce que vous souhaitez.</p>

<p>Ce syst&egrave;me est tr&egrave;s complet, simple et permet vraiment de cr&eacute;er son propre site de e-commerce tr&egrave;s facilement et sans se soucier du syst&egrave;me mit en place par les banques.&nbsp;</p>

<p>Il faut juste savoir que pour le moment le syst&egrave;me est en beta en France, car seulement certains cartes sont acc&eacute;pt&eacute;s (VISA,&nbsp;MasterCard et American Express).</p>

<p>Au niveau de la commission c&#39;est 2,9% + 0.30&euro; / paiement.</p>
