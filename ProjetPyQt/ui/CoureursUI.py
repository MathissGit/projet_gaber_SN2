from PyQt5.QtWidgets import QWidget, QVBoxLayout, QLabel, QTableWidget, QTableWidgetItem, QPushButton
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
        self.btn_load.clicked.connect(self.load_coureurs)
        self.layout.addWidget(self.btn_load)

        self.coureurs = Coureurs()

    def load_coureurs(self):
        coureurs = self.coureurs.get_all_coureurs()
        self.table.setRowCount(len(coureurs))
        self.table.setColumnCount(4)
        self.table.setHorizontalHeaderLabels(["ID", "Nom", "Pays", "Date de naissance"])

        for row, coureur in enumerate(coureurs):
            self.table.setItem(row, 0, QTableWidgetItem(str(coureur["id"])))
            self.table.setItem(row, 1, QTableWidgetItem(coureur["nom"]))
            self.table.setItem(row, 2, QTableWidgetItem(coureur["pays"]))
            self.table.setItem(row, 3, QTableWidgetItem(str(coureur["date_naissance"])))
