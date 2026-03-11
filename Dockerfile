# Utilisation de l'image officielle Nginx (légère)
FROM nginx:alpine

# Copier tous les fichiers du projet dans le répertoire Nginx
COPY index.html /usr/share/nginx/html/
COPY assets/ /usr/share/nginx/html/assets/
COPY images/ /usr/share/nginx/html/images/

# Exposer le port 80
EXPOSE 80

# Démarrer Nginx en foreground
CMD ["nginx", "-g", "daemon off;"]
