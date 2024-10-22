#!/bin/bash

set -e

# Exécute le script d'entrée par défaut de WordPress
docker-entrypoint.sh apache2-foreground &

# Attendre que WordPress soit prêt
until $(curl --output /dev/null --silent --head --fail http://"$WORDPRESS_DOMAIN":80); do
    printf '.'
    sleep 5
done

# Vérifier que wp-cli est installé
if ! command -v wp &> /dev/null
then
    echo "wp-cli could not be found, installing..."
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar
    mv wp-cli.phar /usr/local/bin/wp
fi

# Vérifier que WordPress est installé
until wp core is-installed --allow-root; do
    printf "En attente que WordPress soit prêt...\n"
    sleep 5
done

# Assurer que les permissions sont correctes
chown -R www-data:www-data /var/www/html

# Installer et activer les plugins
echo "Installation des plugins..."

# Liste des plugins à installer
plugins=(
    "akismet"
    "wordfence"
    "yoast-seo"
)

for plugin in "${plugins[@]}"; do
    echo "Installation et activation de $plugin..."
    wp plugin install "$plugin" --activate --allow-root || { echo "Erreur lors de l'installation de $plugin"; exit 1; }
done

# Mettre à jour la base de données si nécessaire
wp core update-db --allow-root

# Attendre que le conteneur soit terminé
wait