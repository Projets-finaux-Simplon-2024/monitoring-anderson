from locust import HttpUser, TaskSet, task, between

class FastAPITests(TaskSet):
    
    @task(3)
    def get_documents(self):
        """Tester la récupération de tous les documents"""
        self.client.get("/documents")
    
    @task(2)
    def upload_document(self):
        """Tester l'upload d'un document"""
        files = {'file': ('test.txt', 'Voici le contenu du fichier de test.')}
        data = {
            'collection_id': '1',
            'collection_name': 'test-collection',
            'title': 'test-document'
        }
        self.client.post("/upload_document", data=data, files=files)
    
    @task(1)
    def search_chunks(self):
        """Tester la recherche de similarité dans les chunks"""
        search_data = {
            "query": "exemple de texte à chercher",
            "top_n": 5,
            "filtre_par_collection": "test-collection"
        }
        self.client.post("/search", json=search_data)

class FastAPIUser(HttpUser):
    tasks = [FastAPITests]
    wait_time = between(1, 3)

    # Définir l'URL de l'API comme hôte par défaut
    host = "http://localhost:8080"  # Remplace par l'URL de ton API