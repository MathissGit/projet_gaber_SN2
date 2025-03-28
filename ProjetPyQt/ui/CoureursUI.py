from PyQt5.QtWidgets import QWidget, QVBoxLayout, QLabel, QTableWidget, QTableWidgetItem, QPushButton, QMessageBox
from logic.coureurs import Coureurs

class CoureursUI(QWidget):
    def __init__(self, parent=None):
        super().__init__(parent)
        self.setWindowTitle("Gestion des Coureurs")

        self.layout = QVBoxLayout(self)

        self.label = QLabel("Liste des Coureurs", self)
        self.layout.addWidget(self.label)

        self.table = QTableWidget(self)
        self.layout.addWidget(self.table)

        self.btn_load = QPushButton("Charger les coureurs", self)
        self.btn_load.clicked.connect(self.load_coureurs)  # Connexion à la méthode load_coureurs
        self.layout.addWidget(self.btn_load)

        self.coureurs = Coureurs()

    def load_coureurs(self):
        print("Tentative de chargement des coureurs...")  # Log de débogage
        try:
            coureurs = self.coureurs.get_all_coureurs()
            print(f"Coureurs récupérés : {coureurs}")  # Affiche les coureurs récupérés
            if coureurs:  # Si des coureurs sont retournés
                self.table.setRowCount(len(coureurs))
                self.table.setColumnCount(4)
                self.table.setHorizontalHeaderLabels(["ID", "Nom", "Pays", "Date de naissance"])

                for row, coureur in enumerate(coureurs):
                    self.table.setItem(row, 0, QTableWidgetItem(str(coureur["id"])))
                    self.table.setItem(row, 1, QTableWidgetItem(coureur["nom"]))
                    self.table.setItem(row, 2, QTableWidgetItem(coureur["pays"]))
                    self.table.setItem(row, 3, QTableWidgetItem(str(coureur["date_naissance"])))
            else:
                self.show_error_message("Aucun coureur trouvé.")
        except Exception as e:
            print(f"Erreur lors du chargement des coureurs : {str(e)}")  # Log d'exception
            self.show_error_message(f"Erreur lors du chargement des coureurs: {str(e)}")

    def show_error_message(self, message):
        msg = QMessageBox(self)
        msg.setIcon(QMessageBox.Critical)
        msg.setWindowTitle("Erreur")
        msg.setText(message)
        msg.exec_()
