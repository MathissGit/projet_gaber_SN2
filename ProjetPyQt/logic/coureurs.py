
from logic.database import connect_db;
class Coureurs:
    def get_all_coureurs(self):
        print("Tentative de connexion à la base de données...")
        try:
            conn = connect_db()
            cursor = conn.cursor(dictionary=True)
            query = "SELECT id, nom, pays, date_naissance FROM coureurs"
            cursor.execute(query)
            coureurs = cursor.fetchall()
            conn.close()
            print(f"Coureurs récupérés : {coureurs}")  # Log de débogage
            return coureurs
        except Exception as e:
            print(f"Erreur lors de la récupération des coureurs : {str(e)}")
            return []  # Retourne une liste vide en cas d'erreur
