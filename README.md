```
================================================================================
                              README.txt
================================================================================
        PROJET UNIVERSITAIRE - PARTIE 2
        DigitalBank France - Plateforme de Sécurité et Monitoring
        ESIC Paris - Master Informatique / École d'Ingénieur
================================================================================

DATE DE CRÉATION : Janvier 2026
VERSION DU PROJET : Partie 2 - Livrable final


================================================================================
1. PRÉSENTATION GÉNÉRALE
================================================================================

Ce fichier README.txt constitue l'INDEX GLOBAL du projet de groupe Partie 2.
Il décrit l'organisation complète de l'arborescence et le rôle de chaque 
dossier et fichier livré.

CONTEXTE DU PROJET :
Entreprise fictive : DigitalBank France
Thématique : Sécurité bancaire, monitoring des transactions, détection de 
             fraude, tableaux de bord décisionnels, automatisation des 
             processus de sécurité

OBJECTIF :
Concevoir et documenter une solution technique complète permettant de sécuriser
les opérations bancaires numériques, détecter les comportements frauduleux en 
temps réel, et offrir des outils de pilotage aux équipes métier et IT.


================================================================================
2. STRUCTURE GÉNÉRALE DU PROJET
================================================================================

Le projet est organisé en 8 dossiers thématiques numérotés, facilitant la 
navigation et l'évaluation par le correcteur :

1_Specifications/         → Analyse des besoins et spécifications fonctionnelles
2_Architecture/           → Conception technique et schémas d'architecture
3_Code_Source/            → Implémentation technique (code, configuration)
4_Documentation/          → Documentation utilisateur et technique complète
5_Securite/               → Analyses de sécurité et conformité réglementaire
6_Tests/                  → Stratégies de test et rapports de validation
7_Gestion_Projet/         → Planification, suivi et gestion d'équipe
8_Presentation/           → Support de présentation finale du projet

Chaque dossier contient des livrables académiques conformes aux standards 
universitaires et professionnels.


================================================================================
3. DESCRIPTION DÉTAILLÉE DES DOSSIERS ET FICHIERS
================================================================================

--------------------------------------------------------------------------------
3.1. DOSSIER : 1_Specifications/
--------------------------------------------------------------------------------

RÔLE :
Contient l'analyse des besoins métier de DigitalBank France et la traduction 
de ces besoins en spécifications fonctionnelles et techniques.

FICHIERS :

• Document_Specifications.pdf
  Description détaillée des besoins fonctionnels et non-fonctionnels du projet.
  Comprend : contexte métier, problématiques identifiées, objectifs du système,
  exigences de performance, contraintes de sécurité et réglementaires (RGPD, 
  PCI-DSS), périmètre fonctionnel.

• User_Stories.xlsx
  Liste exhaustive des user stories au format tableau Excel.
  Colonnes : ID, En tant que (rôle), Je veux (fonctionnalité), Afin de 
  (bénéfice métier), Critères d'acceptation, Priorité (MoSCoW), Estimation.
  Permet la traçabilité entre besoins métier et développements réalisés.


--------------------------------------------------------------------------------
3.2. DOSSIER : 2_Architecture/
--------------------------------------------------------------------------------

RÔLE :
Présente la conception technique du système : architecture globale, modèle de 
données, choix technologiques justifiés. Livrables essentiels pour comprendre 
la structure de la solution.

FICHIERS :

• Schema_Architecture_Technique.png (ou .pdf)
  Schéma visuel de l'architecture technique complète du système.
  Représente : couche front-end (dashboards), couche backend (API, services 
  métier), couche données (base de données, datawarehouse), couche sécurité 
  (authentification, chiffrement), services externes (API bancaires, outils 
  de monitoring), flux de données entre composants.

• Modele_Donnees_ERD.png
  Diagramme Entité-Relation (ERD) du modèle de données.
  Présente : entités principales (utilisateurs, transactions, alertes, logs),
  relations et cardinalités, clés primaires et étrangères, principaux attributs.
  Permet de comprendre l'organisation et la structure de la base de données.

• Document_Conception_Technique.pdf
  Document détaillé décrivant la conception technique du système.
  Sections : architecture logicielle (patterns utilisés), architecture physique
  (infrastructure, déploiement), architecture de sécurité (authentification, 
  autorisation, chiffrement), architecture réseau, gestion de la scalabilité 
  et de la haute disponibilité, stratégie de sauvegarde et reprise d'activité.

• Justification_Choix_Technologiques.pdf
  Analyse et justification des technologies sélectionnées.
  Pour chaque technologie choisie (Supabase/Hasura, Python/Node.js, outils de
  monitoring, frameworks de dashboards, etc.) : présentation de la technologie,
  critères de sélection, alternatives évaluées, justification du choix final,
  forces et limites identifiées.


--------------------------------------------------------------------------------
3.3. DOSSIER : 3_Code_Source/
--------------------------------------------------------------------------------

RÔLE :
Contient l'intégralité du code source et des configurations du projet.
Organisé en sous-dossiers thématiques pour faciliter la navigation.

STRUCTURE ET FICHIERS :

• README.md
  Documentation technique dédiée au code source.
  Contenu : présentation de l'organisation du code, prérequis techniques 
  (langages, versions, dépendances), instructions d'installation locale, 
  commandes pour lancer les différents services, conventions de codage adoptées,
  architecture logicielle (design patterns, découpage modulaire).

• supabase_config/ (ou hasura_config/)
  Configuration du backend-as-a-service (BaaS) choisi.
  Contient : fichiers de configuration de la base de données (schémas SQL, 
  migrations), règles de sécurité (Row Level Security), configuration des 
  API auto-générées, webhooks et triggers, variables d'environnement.

• fraud_detection_api/
  API de détection de fraude développée spécifiquement pour le projet.
  Contient : code source de l'API (Python/Flask ou Node.js/Express), 
  algorithmes de détection (scoring, machine learning, règles métier), 
  endpoints REST documentés, gestion des alertes, intégration avec la base 
  de données, tests unitaires et d'intégration.

• dashboards/
  Code source des tableaux de bord de pilotage.
  Contient : interfaces web (React, Vue.js ou autre framework), composants 
  de visualisation (graphiques, KPI, tableaux), logique de récupération et 
  traitement des données, gestion de l'authentification et des rôles, 
  responsive design.

• workflows/
  Scripts et configurations d'automatisation des processus.
  Contient : workflows de notification automatique, processus d'escalade 
  des alertes, automatisation des rapports périodiques, intégration avec 
  outils externes (email, SMS, webhooks), orchestration (Airflow, n8n ou autre).

• monitoring/
  Configuration et scripts de monitoring du système.
  Contient : configuration des outils de monitoring (Prometheus, Grafana, 
  ELK Stack ou autre), métriques collectées (performances, disponibilité, 
  erreurs), dashboards de monitoring technique, alertes automatiques sur 
  incidents, logs applicatifs et système.


--------------------------------------------------------------------------------
3.4. DOSSIER : 4_Documentation/
--------------------------------------------------------------------------------

RÔLE :
Centralise toute la documentation utilisateur et technique nécessaire à 
l'utilisation, la maintenance et l'évolution du système.

FICHIERS :

• README_Principal.md
  Document de référence global du projet au format Markdown.
  Contenu : vue d'ensemble du projet, architecture simplifiée, guides de 
  démarrage rapide, liens vers les autres documentations, FAQ technique.

• Documentation_API.pdf (ou swagger.yaml)
  Documentation exhaustive de toutes les API développées.
  Format : spécification OpenAPI/Swagger ou document PDF structuré.
  Contenu : description de chaque endpoint, paramètres d'entrée/sortie, 
  codes de retour HTTP, exemples d'appels (requêtes/réponses), authentification
  et autorisation, gestion des erreurs, limitations et quotas.

• Manuel_Utilisateur.pdf
  Guide d'utilisation destiné aux utilisateurs finaux (non techniques).
  Contenu : présentation des fonctionnalités, guides pas à pas avec captures 
  d'écran, utilisation des dashboards, interprétation des alertes, gestion 
  du profil utilisateur, résolution des problèmes courants, glossaire métier.

• Guide_Installation_Deploiement.pdf
  Guide technique pour l'installation et le déploiement de la solution.
  Contenu : prérequis système (serveurs, OS, ressources), installation des 
  dépendances, configuration des services, déploiement en environnement de 
  production, procédures de mise à jour, sauvegarde et restauration, 
  troubleshooting technique.


--------------------------------------------------------------------------------
3.5. DOSSIER : 5_Securite/
--------------------------------------------------------------------------------

RÔLE :
Regroupe l'ensemble des analyses, audits et mesures de sécurité mis en place
pour garantir la conformité réglementaire et la protection des données sensibles.

FICHIERS ATTENDUS :

• Analyse_Risques_Securite.pdf
  Identification et évaluation des risques de sécurité du système.
  Contenu : méthodologie d'analyse (EBIOS, MEHARI ou autre), cartographie 
  des menaces, évaluation des vulnérabilités, matrice de criticité des risques,
  mesures de mitigation proposées.

• Plan_Securite.pdf
  Plan global de sécurisation du système.
  Contient : politique de sécurité, architecture de sécurité détaillée, 
  gestion des identités et des accès (IAM), chiffrement des données (au repos 
  et en transit), protection contre les attaques courantes (SQL injection, 
  XSS, CSRF), journalisation et traçabilité, plan de réponse aux incidents.

• Conformite_RGPD.pdf
  Analyse de conformité au Règlement Général sur la Protection des Données.
  Contenu : registre des traitements, bases légales, mesures de protection 
  des données personnelles, droits des personnes, durée de conservation, 
  procédures d'exercice des droits (accès, rectification, suppression).

• Rapport_Tests_Intrusion.pdf (optionnel)
  Rapport d'audit de sécurité et tests de pénétration.
  Contenu : méthodologie utilisée, vulnérabilités détectées, niveau de 
  criticité, preuves de concept (PoC), recommandations de correction.


--------------------------------------------------------------------------------
3.6. DOSSIER : 6_Tests/
--------------------------------------------------------------------------------

RÔLE :
Documente la stratégie de test mise en œuvre et présente les résultats des 
campagnes de validation. Garantit la qualité et la fiabilité du système.

FICHIERS ATTENDUS :

• Plan_Tests.pdf
  Stratégie globale de test du projet.
  Contenu : objectifs et périmètre des tests, types de tests réalisés (unitaire,
  intégration, système, acceptation), environnements de test, planning des 
  campagnes, critères d'entrée et de sortie, rôles et responsabilités.

• Scenarios_Tests.xlsx
  Tableau détaillé des scénarios de tests.
  Colonnes : ID scénario, User Story associée, Description du test, Données 
  d'entrée, Résultat attendu, Statut (Pass/Fail/Blocked), Commentaires.
  Couvre les tests fonctionnels et non-fonctionnels.

• Rapport_Tests.pdf
  Synthèse des résultats des campagnes de tests.
  Contenu : statistiques globales (taux de réussite, couverture de code), 
  résultats par type de test, bugs identifiés et leur statut, tests de 
  performance (temps de réponse, charge supportée), recommandations.

• Rapport_Tests_Performance.pdf (optionnel)
  Tests de charge et de performance spécifiques.
  Contenu : scénarios de charge testés, outils utilisés (JMeter, Locust), 
  métriques mesurées (latence, throughput, taux d'erreur), analyse des 
  résultats, identification des goulets d'étranglement, recommandations 
  d'optimisation.


--------------------------------------------------------------------------------
3.7. DOSSIER : 7_Gestion_Projet/
--------------------------------------------------------------------------------

RÔLE :
Retrace la gestion et le pilotage du projet : planification, suivi d'avancement,
organisation de l'équipe, gestion des risques. Démontre la méthodologie projet.

FICHIERS ATTENDUS :

• Planning_Projet.pdf (ou .mpp, .xlsx)
  Planning détaillé du projet.
  Contient : diagramme de Gantt, jalons (milestones), tâches et sous-tâches, 
  ressources affectées, chemin critique, dépendances entre tâches, dates 
  prévisionnelles et réelles.

• Comptes_Rendus_Reunions/
  Dossier contenant les CR de toutes les réunions d'équipe et de suivi.
  Format des CR : date, participants, ordre du jour, décisions prises, 
  actions à mener (qui, quoi, quand), points bloquants.

• Matrice_Risques.xlsx
  Suivi des risques projet.
  Colonnes : ID risque, Description, Catégorie (technique/organisationnel/
  métier), Probabilité, Impact, Criticité, Plan de mitigation, Responsable, 
  Statut (actif/résolu/évité).

• Organisation_Equipe.pdf
  Présentation de l'organisation et des rôles de l'équipe.
  Contenu : organigramme de l'équipe, rôles et responsabilités de chaque 
  membre, matrice RACI, répartition de la charge de travail, méthodologie 
  adoptée (Scrum, Kanban, Cycle en V).

• Bilan_Projet.pdf
  Document de clôture et retour d'expérience.
  Contenu : objectifs vs réalisations, écarts et justifications, indicateurs 
  de performance (respect planning, budget, qualité), difficultés rencontrées 
  et solutions apportées, enseignements tirés (REX), perspectives d'évolution.


--------------------------------------------------------------------------------
3.8. DOSSIER : 8_Presentation/
--------------------------------------------------------------------------------

RÔLE :
Contient le support de présentation finale du projet, destiné à la soutenance
orale devant le jury académique.

FICHIERS ATTENDUS :

• Presentation_Finale.pptx (ou .pdf)
  Support de présentation PowerPoint ou PDF.
  Structure type : page de garde (projet, équipe, date), contexte et 
  problématique, objectifs, architecture et conception, réalisations clés 
  (démonstrations, captures d'écran), résultats des tests, conformité et 
  sécurité, méthodologie projet, bilan et perspectives, remerciements.

• Script_Soutenance.pdf (optionnel)
  Notes et script détaillé pour la soutenance orale.
  Aide à structurer le discours et répartir les prises de parole entre membres.

• Video_Demo.mp4 (optionnel)
  Vidéo de démonstration du système en fonctionnement.
  Durée recommandée : 5-10 minutes. Présente les fonctionnalités principales,
  les interfaces utilisateur, un cas d'usage complet de détection de fraude.


================================================================================
4. LIVRABLES PRIORITAIRES POUR L'ÉVALUATION
================================================================================

Les correcteurs porteront une attention particulière aux livrables suivants,
qui constituent le cœur de l'évaluation académique :

ESSENTIEL (coefficient élevé) :
  • 1_Specifications/Document_Specifications.pdf
  • 2_Architecture/Schema_Architecture_Technique.png
  • 2_Architecture/Document_Conception_Technique.pdf
  • 3_Code_Source/ (ensemble du code et de la configuration)
  • 4_Documentation/Documentation_API.pdf
  • 5_Securite/Plan_Securite.pdf
  • 6_Tests/Rapport_Tests.pdf
  • 8_Presentation/Presentation_Finale.pptx

IMPORTANT (valorisation académique) :
  • 1_Specifications/User_Stories.xlsx
  • 2_Architecture/Justification_Choix_Technologiques.pdf
  • 4_Documentation/Guide_Installation_Deploiement.pdf
  • 5_Securite/Conformite_RGPD.pdf
  • 7_Gestion_Projet/Planning_Projet.pdf
  • 7_Gestion_Projet/Bilan_Projet.pdf

COMPLÉMENTAIRE (bonus potentiel) :
  • 5_Securite/Rapport_Tests_Intrusion.pdf
  • 6_Tests/Rapport_Tests_Performance.pdf
  • 8_Presentation/Video_Demo.mp4


================================================================================
5. CRITÈRES DE QUALITÉ ACADÉMIQUE
================================================================================

L'ensemble des livrables respecte les standards académiques suivants :

FORME :
  • Documents professionnels avec page de garde (titre, auteurs, date, logo école)
  • Sommaire paginé et numérotation hiérarchique des sections
  • Orthographe et syntaxe irréprochables
  • Mise en page soignée et homogène entre documents
  • Schémas et diagrammes lisibles avec légendes explicites

FOND :
  • Justification des choix techniques et méthodologiques
  • Référencement des sources et normes (ISO, RGPD, PCI-DSS, etc.)
  • Approche critique et analyse des limites
  • Cohérence entre les différents livrables
  • Respect du périmètre défini en début de projet

CODE SOURCE :
  • Code commenté et structuré selon les bonnes pratiques
  • Respect des conventions de nommage
  • Gestion des erreurs et logs appropriée
  • Sécurisation des accès et des données sensibles
  • Tests unitaires et documentation technique associée


================================================================================
6. UTILISATION DE CE README
================================================================================

POUR LE CORRECTEUR :
Ce fichier README.txt doit être votre premier point d'entrée dans le projet.
Il vous permet d'identifier rapidement l'emplacement de chaque livrable et 
de comprendre l'organisation globale avant d'approfondir l'évaluation.

POUR L'ÉQUIPE PROJET :
Ce fichier sert de checklist finale avant livraison. Vérifiez que chaque 
fichier mentionné est bien présent, correctement nommé et placé dans le bon
dossier.

NAVIGATION RECOMMANDÉE :
1. Lire ce README.txt en entier
2. Consulter 1_Specifications/Document_Specifications.pdf (contexte)
3. Consulter 2_Architecture/ (conception globale)
4. Explorer 3_Code_Source/ avec le README.md dédié
5. Approfondir avec 4_Documentation/ selon les besoins
6. Vérifier 5_Securite/ et 6_Tests/ (qualité et conformité)
7. Analyser 7_Gestion_Projet/ (méthodologie et pilotage)
8. Consulter 8_Presentation/ (synthèse du projet)


================================================================================
7. INFORMATIONS DE CONTACT
================================================================================

ÉCOLE :              ESIC Paris
FORMATION :          Master Informatique / École d'Ingénieur
PROJET :             DigitalBank France - Partie 2
PÉRIODE :            Année universitaire 2025-2026

================================================================================
8. CHANGELOG ET VERSIONS
================================================================================

VERSION 1.0 - Janvier 2026
  • Livraison initiale du projet Partie 2
  • Ensemble complet des 8 dossiers thématiques
  • Documentation exhaustive

(À mettre à jour si versions ultérieures)


================================================================================
                            FIN DU README.txt
================================================================================

Pour toute question relative à l'organisation de ce projet ou à l'emplacement
d'un livrable spécifique, se référer en priorité à ce document.

Merci de votre attention.

L'équipe projet DigitalBank France - ESIC Paris
================================================================================
```
