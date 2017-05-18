+++
date = "2016-12-12T12:30:00+00:00"
draft = false
title = "Installer HTTPie sur Windows et Linux"
slug = "installer-httpie-sur-windows-et-linux"
tags = ["API","Linux","Tutorial","Tutoriaux","Windows"]
image = "https://www.babeuloula.fr/images/blog/head/installer-httpie-sur-windows.jpg"
comments = true
share = true
author = "BaBeuloula"
description = "Voici comment installer facilement HTTPie, un client HTTP en ligne de commande"
+++

[**HTTPie**](https://httpie.org/), que l'on prononce *aitch-tee-tee-pie*, est une librairie pour **Mac** qui permet de taper des requêtes **HTTP** directement en lignes de commandes. Elle a été créée par [**Jakub Roztocil**](https://textplain.club/) un développeur installé à Londres.

Cela est assez pratique si on doit tester une **API** ou une **URL** rapidement sans utiliser un logiciel ou autre.

Normalement, quand vous souhaitez envoyer une requête **HTTP** en ligne de commande, vous passez sans doute par **cURL** avec une commande de ce genre là :

``` shell
curl -X POST -H "Content-Type: application/json" http://mon-api.fr
```

Vous êtes d'accord avec moi, c'est assez long. Et bien avec **HTTPie**, vous allez pouvoir taper juste :

``` shell
http POST http://mon-api.fr
```

**HTTPie** va se charger de détecter lui même le **Content-Type**. Et en plus il va vous afficher une coloration syntaxique du retour de la requête.

[![HTTPie](//www.babeuloula.fr/images/httpie/httpie.png)](//www.babeuloula.fr/images/httpie/httpie.png)

Voici comment l'installer en quelques étapes très simple :

Commencez par télécharger [**cURL pour Windows**](https://curl.haxx.se/download.html), sauf si vous utilisez autre chose que l'invité de commande de Windows (ex: **cmder**, **gitbash** ...)

Inscrivez dans le **PATH** de Windows le chemin vers **cURL**

[![PATH System Windows](//www.babeuloula.fr/images/httpie/path_system_windows.png)](//www.babeuloula.fr/images/httpie/path_system_windows.png)

Puis, téléchargez [**Python**](http://python.org/download). Pour ma part j'ai utilisé la dernière version en date, **3.5.2**. N'oubliez pas de cocher la case qui permet d'inscrire automatiquement **Python** au **PATH** de **Windows**. Sinon, faite la même chose que plus haut mais pour **Python**

Une fois tout cela installé, tapez les commandes suivantes :

``` shell
curl http://python-distribute.org/distribute_setup.py | python
curl -k https://raw.github.com/pypa/pip/master/contrib/get-pip.py | python
pip install -U https://github.com/jkbr/httpie/tarball/master
# pip est un gestionnaire de paquet Python.
```

Vous pouvez maintenant taper la commande `http` directement dans votre invité de commande et voir ceci :

``` plaintext
C:\Users\BaBeuloula
λ http
usage: http-script.py [--json] [--form] [--pretty {all,colors,format,none}]
                      [--style STYLE] [--print WHAT] [--headers] [--body]
                      [--verbose] [--all] [--history-print WHAT] [--stream]
                      [--output FILE] [--download] [--continue]
                      [--session SESSION_NAME_OR_PATH | --session-read-only SESSION_NAME_OR_PATH]
                      [--auth USER[:PASS]] [--auth-type {basic,digest}]
                      [--proxy PROTOCOL:PROXY_URL] [--follow]
                      [--max-redirects MAX_REDIRECTS] [--timeout SECONDS]
                      [--check-status] [--verify VERIFY]
                      [--ssl {ssl2.3,ssl3,tls1,tls1.1,tls1.2}] [--cert CERT]
                      [--cert-key CERT_KEY] [--ignore-stdin] [--help]
                      [--version] [--traceback]
                      [--default-scheme DEFAULT_SCHEME] [--debug]
                      [METHOD] URL [REQUEST_ITEM [REQUEST_ITEM ...]]
http-script.py: error: the following arguments are required: URL
```

Rien de plus compliqué. Vous allez pouvoir tester des URL ou API directement en lignes de commandes.

Si dans vos API vous avec un système d'authentification en **oauth**, vous pouvez installer **httpie-oauth** avec la commande : 

``` shell
pip install httpie-oauth
```

Elle fonctionne comme ceci : 

``` shell
# Création de la session
$ http --session=logged-in --auth-type=oauth1 --auth='client-key:client-secret' example.org

# Réutiliser une session
$ http --session=logged-in POST example.org hello=world
```