from PyQt5.QtWidgets import QWidget, QVBoxLayout, QLabel, QTableWidget, QTableWidgetItem, QPushButton
from logic.etapes import Etapes

class EtapesUI(QWidget):
    def __init__(self, parent=None):
        super().__init__(parent)
        self.setWindowTitle("Gestion des Etapes")

        self.layout = QVBoxLayout(self)

        self.label = QLabel("Liste des Etapes", self)
        self.layout.addWidget(self.label)

        self.table = QTableWidget(self)
        self.layout.addWidget(self.table)

        self.btn_load = QPushButton("Charger les étapes", self)
        self.btn_load.clicked.connect(self.load_etapes)
        self.layout.addWidget(self.btn_load)

        self.etapes = Etapes()

    def load_etapes(self):
        etapes = self.etapes.get_all_etapes()
        self.table.setRowCount(len(etapes))
        self.table.setColumnCount(4)
        self.table.setHorizontalHeaderLabels(["Numéro", "Nom", "Distance", "Date"])

        for row, etape in enumerate(etapes):
            self.table.setItem(row, 0, QTableWidgetItem(str(etape["numero"])))
            self.table.setItem(row, 1, QTableWidgetItem(etape["nom"]))
            self.table.setItem(row, 2, QTableWidgetItem(str(etape["distance"])))
            self.table.setItem(row, 3, QTableWidgetItem(str(etape["date"])))
