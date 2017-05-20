# Prérequis

- [Hugo](https://gohugo.io/)
- [Git](https://git-scm.com/)

# Installer le repo

La première étape est de télécharger les sources du site :

    $git clone git@github.com:Lemon-Cake/website.git

Les sources sont composées de plusieus [sous-modules git](https://git-scm.com/book/fr/v2/Utilitaires-Git-Sous-modules), il va être nécessaire de les initialiser :

    $git submodule init
    $git submodule update

Voilà, vous avez des sources prêtes à l'emploi !

# Build les sources

Vous avez ajouté un article dans le dossier `content` et vous souhaiteriez qu'il soit affiché sur le site final [https://lemon-cake.github.io/](https://lemon-cake.github.io/) ?

La démarche est assez simple.

Dans un premier temps, nous allons compiler les sources en utilisant le thème :

    $hugo -t=bleak

Puis nous allons mettre à jour les sources du repo des artefacts compilés :

    $cd public
    $git add .
    $git commit -m "<Votre message ici>"
    $git push

Voilà, le site est à jour ;)

Nous sommes en train de développer un système pour automatiser la démarche de compilation et de mise à jour du site.