from logic.database import connect_to_db

class Etapes:
    def __init__(self):
        self.connection = connect_to_db()

    def get_all_etapes(self):
        """Récupère toutes les étapes."""
        try:
            cursor = self.connection.cursor(dictionary=True)
            cursor.execute("SELECT numero, nom, distance, date FROM etapes")
            return cursor.fetchall()
        except Exception as e:
            print(f"Erreur lors de la récupération des étapes : {e}")
            return []

    def add_etape(self, numero, nom, distance, date):
        """Ajoute une nouvelle étape."""
        try:
            cursor = self.connection.cursor()
            cursor.execute(
                "INSERT INTO etapes (numero, nom, distance, date) VALUES (%s, %s, %s, %s)",
                (numero, nom, distance, date)
            )
            self.connection.commit()
        except Exception as e:
            print(f"Erreur lors de l'ajout de l'étape : {e}")

    def delete_etape(self, numero):
        """Supprime une étape par son numéro."""
        try:
            cursor = self.connection.cursor()
            cursor.execute("DELETE FROM etapes WHERE numero = %s", (numero,))
            self.connection.commit()
        except Exception as e:
            print(f"Erreur lors de la suppression de l'étape : {e}")

    def update_etape(self, numero, nom, distance, date):
        """Met à jour une étape."""
        try:
            cursor = self.connection.cursor()
            cursor.execute(
                "UPDATE etapes SET nom = %s, distance = %s, date = %s WHERE numero = %s",
                (nom, distance, date, numero)
            )
            self.connection.commit()
        except Exception as e:
            print(f"Erreur lors de la mise à jour de l'étape : {e}")
