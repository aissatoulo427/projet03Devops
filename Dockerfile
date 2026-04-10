# Utilisation de l'image officielle Nginx (légère)
FROM nginx:alpine

# Mise à jour des packages Alpine pour corriger les vulnérabilités HIGH :
# - CVE-2026-28390 : libcrypto3/libssl3 (openssl) → fix 3.5.6-r0
# - CVE-2026-22184 : zlib → fix 1.3.2-r0
RUN apk update && apk upgrade --no-cache

# Copier tous les fichiers du projet dans le répertoire Nginx
COPY index.html /usr/share/nginx/html/
COPY assets/ /usr/share/nginx/html/assets/
COPY images/ /usr/share/nginx/html/images/

# Exposer le port 80
EXPOSE 80

# Démarrer Nginx en foreground
CMD ["nginx", "-g", "daemon off;"]
