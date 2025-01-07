# BeVannes

BeVannes est une application révolutionnaire de médias sociaux qui redéfinit l'interaction avec notre environnement. Combinant géolocalisation, gamification et découverte culturelle, elle offre une expérience unique et engageante pour ses utilisateurs.


## Fonctionnalités

### Modules et interactions principales

#### Module principal : Spot du Jour
- Propose chaque jour un lieu unique à découvrir, sélectionné aléatoirement.
- Validation géolocalisée pour garantir la présence physique des utilisateurs.
- Collecte de points et contribution au classement global.
- Chaque spot est enrichi d'informations culturelles et historiques pour une expérience à la fois ludique et éducative.

![Capture d'écran 2025-01-07 214646](https://github.com/user-attachments/assets/60fa2189-ca66-4503-a74e-9ef0048cd765)


#### Partage intuitif de photos
- Capture et partage de photos directement via l'application.
- Association automatique des photos aux lieux via la géolocalisation.
- Notifications et validations en temps réel pour une expérience fluide.

![Capture d'écran 2025-01-07 214726](https://github.com/user-attachments/assets/46b086a4-64bc-4796-88f6-9940040e50ab)

![Capture d'écran 2025-01-07 214330](https://github.com/user-attachments/assets/73a00643-a628-4820-98fb-c721f88d1acb)


#### Gamification avancée
- Système de classement dynamique basé sur les points accumulés.
- Médailles et insignes pour récompenser les meilleures performances.
- Récompenses visuelles pour encourager la compétition saine entre utilisateurs.

![Capture d'écran 2025-01-07 214544](https://github.com/user-attachments/assets/6d221ff1-1401-402e-bd8b-e078556d8c1e)


#### Notifications quotidiennes
- Envoi de notifications motivantes ou informatives à des heures aléatoires pour engager les utilisateurs.



## Prérequis

Pour utiliser ou développer BeVannes, les éléments suivants sont requis :

- **Flutter** : Framework principal pour le développement multiplateforme.
- **FlutterFlow** : Utilisé pour le prototypage et l’intégration rapide.
- **API Géolocalisation** : Nécessaire pour la validation des positions.
- Un compte développeur Firebase pour le backend et la gestion des données.


## Installation

1. **Cloner le projet :**
   ```bash
   git clone <URL_DU_DEPOT>
   cd BeVannes
   ```

2. **Installer les dépendances :**
   Configurez l’environnement Flutter et utilisez FlutterFlow pour générer les composants.

3. **Configurer Firebase :**
   - Créez un projet Firebase.
   - Ajoutez le fichier `google-services.json` (Android) et `GoogleService-Info.plist` (iOS) à leurs dossiers respectifs.

4. **Exécuter l’application :**
   ```bash
   flutter run
   ```


## Configuration

### Gestion des Spots du Jour
- Le fichier `data/spots.json` contient les lieux prédéfinis.
- Ajoutez vos propres lieux au format :
  ```json
  {
    "spots": [
      {
        "name": "Tour Eiffel",
        "latitude": 48.8584,
        "longitude": 2.2945,
        "description": "Monument emblématique de Paris."
      }
    ]
  }
  ```

### Notifications automatisées
- Les notifications sont planifiées de manière aléatoire chaque jour.

## Fonctionnalités techniques

### Modules personnalisés
- **compareLatLng** : Valide les coordonnées géographiques entre le lieu et l’utilisateur.
- **sameDay** : Vérifie si la date courante correspond au Spot du Jour.
- **dateIsThisDay** : Assure la cohérence des dates.

### Backend
- Firebase Realtime Database pour la gestion des utilisateurs, des scores et des lieux.
- Cloud Functions pour les tâches planifiées.


## Contribuer

Les contributions sont les bienvenues pour améliorer BeVannes. Suivez ces étapes :

1. **Forkez le dépôt**.
2. **Créez une branche :**
   ```bash
   git checkout -b feature/nouvelle-fonctionnalite
   ```
3. **Soumettez une pull request.**


## Ressources utiles

- [Documentation Flutter](https://flutter.dev/docs)
- [Documentation FlutterFlow](https://docs.flutterflow.io)


## Licence

Ce projet est sous licence MIT.
Pour plus de détails, consultez le fichier [LICENSE](./LICENSE).
