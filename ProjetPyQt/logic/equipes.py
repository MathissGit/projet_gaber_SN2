from logic.database import connect_to_db


class Equipes:
    def __init__(self):
        self.connection = connect_to_db()

    def get_all_equipes(self):
        """Récupère toutes les équipes."""
        try:
            cursor = self.connection.cursor(dictionary=True)
            cursor.execute("SELECT id, nom, pays FROM equipes")
            return cursor.fetchall()
        except Exception as e:
            print(f"Erreur lors de la récupération des équipes : {e}")
            return []

    def add_equipe(self, nom, pays):
        """Ajoute une nouvelle équipe."""
        try:
            cursor = self.connection.cursor()
            cursor.execute(
                "INSERT INTO equipes (nom, pays) VALUES (%s, %s)", (nom, pays)
            )
            self.connection.commit()
        except Exception as e:
            print(f"Erreur lors de l'ajout de l'équipe : {e}")

    def delete_equipe(self, equipe_id):
        """Supprime une équipe par son ID."""
        try:
            cursor = self.connection.cursor()
            cursor.execute("DELETE FROM equipes WHERE id = %s", (equipe_id,))
            self.connection.commit()
        except Exception as e:
            print(f"Erreur lors de la suppression de l'équipe : {e}")

    def update_equipe(self, equipe_id, nom, pays):
        """Met à jour une équipe."""
        try:
            cursor = self.connection.cursor()
            cursor.execute(
                "UPDATE equipes SET nom = %s, pays = %s WHERE id = %s",
                (nom, pays, equipe_id),
            )
            self.connection.commit()
        except Exception as e:
            print(f"Erreur lors de la mise à jour de l'équipe : {e}")
