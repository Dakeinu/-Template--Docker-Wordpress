# Documentation de Déploiement de l'Application en Docker

Cette documentation explique comment déployer votre application en utilisant Docker sur un serveur Lightsail.

## Étape 1 : Créer un Répertoire Git

1. Créez un dépôt Git avec le nom de votre site, par exemple `falcatiremi.com` à partir du template : https://github.com/Dakeinu/Template-Docker-Wordpress

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
     - 2222
     - 3000
     - 3306
     - 9090
     - 40000 - 40009

   Redémarrez le serveur pour appliquer les modifications avant de passer à la suite.

## Étape 3 : Ajouter les Fichiers de Production

1. Ajoutez les deux fichiers de production suivants à votre dépôt :
   - `docker-compose.yml`
   - `deploy.yml`
   - `prometheus.yml`
   - `.github/workflows/deploy.yml`

## Étape 4 : Ajouter les Secrets dans GitHub

1. Allez dans les secrets/variables de votre dépôt GitHub.
2. Ajoutez/Vérifiez les secrets nécessaires dans le fichier `deploy.yml` avec les variables d'environnement suivantes :

   - SSH_HOST : L’adresse IP ou le nom de domaine du serveur distant où vous déployez votre application.
	- SSH_USER : Le nom d’utilisateur SSH utilisé pour se connecter au serveur.
	- SSH_PRIVATE_KEY : La clé privée SSH pour authentifier l’utilisateur SSH sur le serveur.
	- WORDPRESS_DOMAIN : Le domaine de votre installation WordPress.
	- WORDPRESS_DB_USER : Le nom d’utilisateur pour la base de données WordPress.
	- WORDPRESS_DB_PASSWORD : Le mot de passe pour la base de données WordPress.
	- WORDPRESS_DB_NAME : Le nom de la base de données WordPress.
	- MYSQL_PASSWORD : Le mot de passe pour l’utilisateur MySQL.
	- MYSQL_ROOT_PASSWORD : Le mot de passe pour l’utilisateur root de MySQL.
	- FTP_PASS : Le mot de passe FTP, si utilisé.
	- FTP_USER : Le nom d’utilisateur FTP, si utilisé.
	- GRAFANA_PASSWORD : Le mot de passe pour Grafana, si utilisé.
	- WORDPRESS_ADMIN_USER : Le nom d’utilisateur de l’administrateur WordPress.
	- WORDPRESS_ADMIN_PASSWORD : Le mot de passe de l’administrateur WordPress.
	- WORDPRESS_ADMIN_EMAIL : L’adresse email de l’administrateur WordPress.
   - WORDPRESS_SITE_TITLE : Le titre de votre site WordPress.
	- WORDPRESS_ENABLE_INDEXING : Une variable pour activer ou désactiver l’indexation du site (0 pour non, 1 pour oui).
	- WORDPRESS_PLUGINS : Une liste des plugins WordPress à installer, séparés par des espaces.
	- TRAEFIK_USERNAME : Le nom d’utilisateur pour l’interface de Traefik.
	- TRAEFIK_PASSWORD : Le mot de passe pour l’interface de Traefik.

## Étape 5 : Lancer le Workflow

1. Relancez le workflow de déploiement à partir de votre dépôt.

## Conclusion

Votre application devrait maintenant être déployée avec succès sur Docker. Assurez-vous de vérifier que tous les services fonctionnent correctement.
