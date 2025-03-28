from PyQt5.QtWidgets import QWidget, QVBoxLayout, QLabel, QTableWidget, QTableWidgetItem, QPushButton
from logic.equipes import Equipes

class EquipesUI(QWidget):
    def __init__(self, parent=None):
        super().__init__(parent)
        self.setWindowTitle("Gestion des Equipes")

        self.layout = QVBoxLayout(self)

        self.label = QLabel("Liste des Equipes", self)
        self.layout.addWidget(self.label)

        self.table = QTableWidget(self)
        self.layout.addWidget(self.table)

        self.btn_load = QPushButton("Charger les équipes", self)
        self.btn_load.clicked.connect(self.load_equipes)
        self.layout.addWidget(self.btn_load)

        self.equipes = Equipes()

    def load_equipes(self):
        equipes = self.equipes.get_all_equipes()
        self.table.setRowCount(len(equipes))
        self.table.setColumnCount(3)
        self.table.setHorizontalHeaderLabels(["ID", "Nom", "Pays"])

        for row, equipe in enumerate(equipes):
            self.table.setItem(row, 0, QTableWidgetItem(str(equipe["id"])))
            self.table.setItem(row, 1, QTableWidgetItem(equipe["nom"]))
            self.table.setItem(row, 2, QTableWidgetItem(equipe["pays"]))
