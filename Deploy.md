# Documentation de Déploiement de l'Application en Docker

Cette documentation explique comment déployer votre application en utilisant Docker sur un serveur Lightsail.

## Étape 1 : Créer un Répertoire Git

1. Créez un dépôt Git avec le nom de votre site, par exemple `falcatiremi.com`.

## Étape 2 : Créer un Serveur sur Lightsail

1. **Créer un serveur** :
   - Choisissez une instance avec un minimum de 2 Go de RAM.
   - Configurez la clé SSH et l'adresse IP statique.

2. **Configurer les ports à ouvrir** :
   - Ouvrez les ports suivants :
     - 20
     - 22
     - 80
     - 443
     - 3306
     - 40000 - 40009
     - 9090
     - 3000

   Redémarrez le serveur pour appliquer les modifications avant de passer à la suite.

## Étape 3 : Ajouter les Fichiers de Production

1. Ajoutez les deux fichiers de production suivants à votre dépôt :
   - `docker-compose.yml`
   - `deploy.yml`
   - `install-plugins.sh`
   - `prometheus.yml`

*Remarque : Ne précisez pas le code dans cette documentation.*

## Étape 4 : Ajouter les Secrets dans GitHub

1. Allez dans les paramètres de votre dépôt GitHub.
2. Ajoutez les secrets nécessaires dans le fichier `deploy.yml` avec les variables d'environnement suivantes :

   ```bash
   WORDPRESS_DOMAIN=example.com
   WORDPRESS_DB_USER=db_user
   WORDPRESS_DB_PASSWORD=db_password
   WORDPRESS_DB_NAME=wordpress_db
   MYSQL_PASSWORD=mysql_password
   MYSQL_ROOT_PASSWORD=root_password
   FTP_USER=ftp_user
   FTP_PASS=ftp_password
   GRAFANA_PASSWORD=graphana_password
   ```

## Étape 5 : Lancer le Workflow

1. Lancez le workflow de déploiement à partir de votre dépôt.

## Conclusion

Votre application devrait maintenant être déployée avec succès sur Docker. Assurez-vous de vérifier que tous les services fonctionnent correctement.
