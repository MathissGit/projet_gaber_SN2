import mysql.connector
from mysql.connector import Error

def connect_db():
    try:
        connection = mysql.connector.connect(
            host='localhost',          # Hôte de ton serveur MySQL (souvent localhost)
            user='ton_utilisateur',    # L'utilisateur que tu utilises pour te connecter à ta base de données
            password='ton_mot_de_passe',  # Le mot de passe associé à cet utilisateur
            database='nom_de_ta_bdd'   # Le nom de ta base de données sur PHPMyAdmin
        )
        if connection.is_connected():
            print("Connexion réussie à la base de données")
        return connection
    except Error as e:
        print(f"Erreur lors de la connexion à la base de données : {e}")
        return None
