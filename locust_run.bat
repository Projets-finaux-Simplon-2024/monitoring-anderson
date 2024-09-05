@echo off

:: Définir la version de Python à utiliser
set PYTHON_VERSION=py -3.12

:: Vérifier si l'environnement virtuel existe
if not exist "env_locust" (
    echo Création de l'environnement virtuel...
    %PYTHON_VERSION% -m venv env_locust
)

:: Activer l'environnement virtuel
call env_locust\Scripts\activate

:: Upgrade de pip
python -m pip install --upgrade pip

:: Installer les dépendances
python -m pip install -r requirements.txt

:: Se placer dans le répertoire où les fichiers Locust sont présents
cd locust_tests

:: Lancer Locust en mode interface web
start cmd /k locust -f locust_main.py

:: Attendre quelques secondes pour s'assurer que Locust démarre
timeout /t 5 /nobreak

:: Ouvrir le navigateur par défaut à l'adresse de Locust
start http://localhost:8089

:: Afficher un message pour indiquer que Locust est en cours d'exécution
echo Locust is now running at: http://localhost:8089
echo Please access the URL in your web browser to start the test.

:: Désactiver l'environnement virtuel
deactivate

echo Fin de l'exécution du script.
pause