+++
date = "2017-01-10T12:30:00+00:00"
draft = false
title = "Créer une tâche CRON sous Symfony"
slug = "creer-une-tache-cron-sous-symfony"
tags = ["Framework","Linux","PHP","Symfony","Tutorial","Tutoriaux"]
image = "https://www.babeuloula.fr/images/blog/head/create_cron_task_symfony.jpg"
comments = true
share = true
author = "BaBeuloula"
description = "Créer facilement et en quelques lignes une tâche CRON pour Symfony en utilisant toute la puissance du framework et la console"
+++

Je me suis enfin plongé dans **Symfony** pour des besoins professionnels et j'ai été confronté au fait de devoir **exécuter une tâche CRON sur un site Symfony**. Alors oui créer un CRON n'est pas dur mais pouvoir réutiliser la logique et surtout la puissance de Symfony n'est pas forcément facile à faire si on doit charger composants après composants.

Il y a toujours la possibilité de créer des routes et d'**appeler les URL dans le CRON** mais comme Symfony intègre une **console**, pourquoi ne pas s'en servir justement. Voici donc comment en quelques lignes on peut réaliser une tâche CRON

``` php
<?php

    namespace BaBeuloula\TestBundle\Command;

    use Symfony\Component\Console\Command\Command;
    use Symfony\Component\Console\Input\InputArgument;
    use Symfony\Component\Console\Input\InputInterface;
    use Symfony\Component\Console\Output\OutputInterface;

    class TestCommand extends Command {

        protected function configure () {
            // On set le nom de la commande
            $this->setName('app:test');

            // On set la description
            $this->setDescription("Permet juste de faire un test dans la console");

            // On set l'aide
            $this->setHelp("Je serai affiche si on lance la commande app/console app:test -h");

            // On prépare les arguments
            $this->addArgument('name', InputArgument::REQUIRED, "Quel est ton prenom ?")
                 ->addArgument('last_name', InputArgument::OPTIONAL, "Quel est ton nom ?");
        }

        public function execute (InputInterface $input, OutputInterface $output) {
            $text = 'Hi '.$input->getArgument('name');

            $lastName = $input->getArgument('last_name');
            if ($lastName) {
                $text .= ' '.$lastName;
            }

            $output->writeln($text.'!');
        }
    }
```

Et maintenant si j'exécute la commande `php app/console app:test Jérémy`

``` bash
$ php app\console app:test Jeremy
Hi Jeremy!

$ php app\console app:test Jeremy Test
Hi Jeremy Test!
```

Vous pouvez aussi récupérer des options si besoin 

``` php
$this
    // ...
    ->addOption(
        'iterations',
        null,
        InputOption::VALUE_REQUIRED,
        'How many times should the message be printed?',
        1
    );
```

Et vous pouvez aller récupérer l'option via `$input->getOption('iterations')`. 

**L'ordre de vos options n'a d'importance, par contre l'ordre des paramètres est important lui.**

Si vous avez besoin de **charger le container** dans votre **commande**, remplacez `extends Command` par `extand ContainerAwareCommand` avec le use `Symfony\Bundle\FrameworkBundle\Command\ContainerAwareCommand`. Vous pouvez maintenant charger le **container** avec 

``` php
$this->getContainer();
```

Et du coup, vous pouvez **récupérer Doctrine via son service**

``` php
$this->getContainer()->get('doctrine')->getManager();
```

Voilà comment en quelques lignes vous avez créé une nouvelle commande pour la **console Symfony** et maintenant il ne vous reste plus qu'à l'insérer dans votre **crontab**.
## Source

[Documentation Symfony sur l'utilisation de la console](http://symfony.com/doc/2.8/console/input.html)