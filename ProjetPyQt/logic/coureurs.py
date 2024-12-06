# logic/coureurs.py
from logic.database import connect_to_db

class Coureurs:
    def __init__(self):
        self.connection = connect_to_db()
    
    def get_all_coureurs(self):
        """Récupère tous les coureurs."""
        try:
            cursor = self.connection.cursor(dictionary=True)
            cursor.execute("SELECT numero, nom, pays, date_naissance FROM coureurs")
            return cursor.fetchall()
        except Exception as e:
            print(f"Erreur lors de la récupération des coureurs : {e}")
            return []
    
    def add_coureur(self, numero, nom, pays, date_naissance):
        """Ajoute un coureur."""
        try:
            cursor = self.connection.cursor()
            cursor.execute(
                "INSERT INTO coureurs (numero, nom, pays, date_naissance) VALUES (%s, %s, %s, %s)",
                (numero, nom, pays, date_naissance)
            )
            self.connection.commit()
        except Exception as e:
            print(f"Erreur lors de l'ajout du coureur : {e}")
    
    def delete_coureur(self, numero):
        """Supprime un coureur."""
        try:
            cursor = self.connection.cursor()
            cursor.execute("DELETE FROM coureurs WHERE numero = %s", (numero,))
            self.connection.commit()
        except Exception as e:
            print(f"Erreur lors de la suppression du coureur : {e}")
