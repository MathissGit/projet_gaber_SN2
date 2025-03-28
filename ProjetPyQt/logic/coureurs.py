from logic.database import connect_db

class Coureurs:
    def get_all_coureurs(self):
        conn = connect_db()
        cursor = conn.cursor(dictionary=True)
        query = "SELECT id, nom, pays, date_naissance FROM coureurs"
        cursor.execute(query)
        coureurs = cursor.fetchall()
        conn.close()
        return coureurs
