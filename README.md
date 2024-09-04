# Projet de Monitoring

## Prérequis

- Docker
- Docker Compose

## Démarrage de l'environnement de Monitoring

```bash
docker-compose up -d




### **6. Connecter ton application principale au Monitoring**

Pour connecter ton application principale à cet environnement de monitoring :
1. **Expose les services de ton application principale** sur un réseau que Prometheus peut atteindre. Tu pourrais ajouter un autre `docker-compose.yml` dans le projet de monitoring pour connecter les deux réseaux, ou simplement utiliser des règles de pare-feu ou de routage si nécessaire.
2. **Configurer les métriques sur ton application** pour qu’elles soient accessibles par Prometheus.

### **Conclusion**

Avec cette approche, tu as deux projets bien séparés :
- **Le projet de l'application principale** sur son propre réseau.
- **Le projet de monitoring** sur un réseau distinct avec tous les outils nécessaires pour surveiller l'application.

Cette séparation assure une isolation des responsabilités et te permet de gérer et de déployer chaque partie indépendamment.
