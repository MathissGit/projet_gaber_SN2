from logic.database import connect_db

class Equipes:
    def get_all_equipes(self):
        conn = connect_db()
        cursor = conn.cursor(dictionary=True)
        query = "SELECT id, nom, pays FROM equipes"
        cursor.execute(query)
        equipes = cursor.fetchall()
        conn.close()
        return equipes
