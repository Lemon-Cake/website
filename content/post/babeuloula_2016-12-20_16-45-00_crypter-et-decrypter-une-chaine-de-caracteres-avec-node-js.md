+++
date = "2016-12-20T16:45:00+00:00"
draft = false
title = "Crypter et décrypter une chaîne de caractères avec Node JS"
slug = "crypter-et-decrypter-une-chaine-de-caracteres-avec-node-js"
tags = ["Node.JS","Sécurité","Tutorial","Tutoriaux"]
image = "https://www.babeuloula.fr/images/blog/head/encryption-authentification-nodejs.jpg"
comments = true
share = true
author = "BaBeuloula"
description = "Dans certains programmes Node JS il peut être intéressant de vouloir stocker une chaîne de caractère crypté et pouvoir la décrypter quand bon vous semble"
+++

Dans un précèdent article je vous expliquais comment on pouvait [crypter et décrypter une chaine de caractères en PHP](https://www.babeuloula.fr/blog/crypter-et-decrypter-une-chaine-de-caracteres-en-php.html). Cette fois je vais vous montrer comment le faire en **Node JS**.

``` javascript
var crypto = require('crypto');

var text = "Master of puppets I'm pulling your strings, twisting your mind and smashing your dreams."

// On définit notre algorithme de cryptage
var algorithm = 'aes256';

// Notre clé de chiffrement, elle est souvent générée aléatoirement mais elle doit être la même pour le décryptage
var password = 'l5JmP+G0/1zB%;r8B8?2?2pcqGcL^3';

// On crypte notre texte
var cipher = crypto.createCipher(algorithm,password);
var crypted = cipher.update(text,'utf8','hex');
crypted += cipher.final('hex');

// On décrypte notre texte
var decipher = crypto.createDecipher(algorithm,password);
var dec = decipher.update(crypted,'hex','utf8');
dec += decipher.final('utf8');
```

Voici le contenu de la variable `crypted`

``` plaintext
52e4369739871151c5fb740a4373fa8300a97d4f508cfe6ceef05434026c2f85cf890e9efff36b6a0f140d35c5319771febf1aef9a56d04e46b91eb91162b16e8d608fbbf9f02bbcb0a5c68171bc0ba5776d39ee5230586ff9f748d0458c6199
```

Si vous souhaitez plus d'informations et aussi la liste de toutes les fonctions, vous pouvez cliquer sur le lien dans la source qui est la documentation officiel du module **Crypto** de **Node JS**.
## Source

[Documentation Crypto Node JS](https://nodejs.org/api/crypto.html)