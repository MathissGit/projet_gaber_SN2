from logic.database import connect_db

class Etapes:
    def get_all_etapes(self):
        conn = connect_db()
        cursor = conn.cursor(dictionary=True)
        query = "SELECT numero, nom, distance, date FROM etapes"
        cursor.execute(query)
        etapes = cursor.fetchall()
        conn.close()
        return etapes
