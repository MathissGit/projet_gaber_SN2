from PyQt5.QtWidgets import (
    QWidget,
    QVBoxLayout,
    QHBoxLayout,
    QTableWidget,
    QTableWidgetItem,
    QPushButton,
    QMessageBox,
    QLineEdit,
    QLabel,
)
from logic.etapes import Etapes


class EtapesUI(QWidget):
    def __init__(self, menu_window, parent=None):
        super().__init__(parent)
        self.menu_window = menu_window  # Référence au menu principal
        self.etapes_logic = Etapes()
        self.setWindowTitle("Gestion des Étapes")
        self.init_ui()

    def init_ui(self):
        self.layout = QVBoxLayout()

        # Table pour afficher les étapes
        self.table = QTableWidget()
        self.table.setColumnCount(4)
        self.table.setHorizontalHeaderLabels(["Numéro", "Nom", "Distance", "Date"])
        self.layout.addWidget(self.table)

        # Formulaire pour ajouter ou modifier une étape
        form_layout = QHBoxLayout()
        self.numero_input = QLineEdit()
        self.nom_input = QLineEdit()
        self.distance_input = QLineEdit()
        self.date_input = QLineEdit()
        form_layout.addWidget(QLabel("Numéro:"))
        form_layout.addWidget(self.numero_input)
        form_layout.addWidget(QLabel("Nom:"))
        form_layout.addWidget(self.nom_input)
        form_layout.addWidget(QLabel("Distance:"))
        form_layout.addWidget(self.distance_input)
        form_layout.addWidget(QLabel("Date:"))
        form_layout.addWidget(self.date_input)
        self.layout.addLayout(form_layout)

        # Boutons
        button_layout = QHBoxLayout()
        self.add_button = QPushButton("Ajouter")
        self.add_button.clicked.connect(self.add_etape)
        self.update_button = QPushButton("Modifier")
        self.update_button.clicked.connect(self.update_etape)
        self.delete_button = QPushButton("Supprimer")
        self.delete_button.clicked.connect(self.delete_etape)
        button_layout.addWidget(self.add_button)
        button_layout.addWidget(self.update_button)
        button_layout.addWidget(self.delete_button)

        # Bouton Retour
        self.back_button = QPushButton("Retour")
        self.back_button.clicked.connect(self.return_to_menu)
        button_layout.addWidget(self.back_button)

        self.layout.addLayout(button_layout)

        self.setLayout(self.layout)
        self.load_etapes()

    def load_etapes(self):
        """Charge les étapes depuis la base de données."""
        etapes = self.etapes_logic.get_all_etapes()
        self.table.setRowCount(len(etapes))
        for row, etape in enumerate(etapes):
            self.table.setItem(row, 0, QTableWidgetItem(str(etape["numero"])))
            self.table.setItem(row, 1, QTableWidgetItem(etape["nom"]))
            self.table.setItem(row, 2, QTableWidgetItem(str(etape["distance"])))
            self.table.setItem(row, 3, QTableWidgetItem(etape["date"]))

    def add_etape(self):
        """Ajoute une nouvelle étape."""
        numero = self.numero_input.text()
        nom = self.nom_input.text()
        distance = self.distance_input.text()
        date = self.date_input.text()
        if not (numero and nom and distance and date):
            QMessageBox.warning(self, "Erreur", "Veuillez remplir tous les champs.")
            return
        self.etapes_logic.add_etape(numero, nom, distance, date)
        self.load_etapes()

    def update_etape(self):
        """Met à jour l'étape sélectionnée."""
        selected_row = self.table.currentRow()
        if selected_row == -1:
            QMessageBox.warning(self, "Erreur", "Veuillez sélectionner une étape.")
            return
        numero = int(self.table.item(selected_row, 0).text())
        nom = self.nom_input.text()
        distance = self.distance_input.text()
        date = self.date_input.text()
        if not (nom and distance and date):
            QMessageBox.warning(self, "Erreur", "Veuillez remplir tous les champs.")
            return
        self.etapes_logic.update_etape(numero, nom, distance, date)
        self.load_etapes()

    def delete_etape(self):
        """Supprime l'étape sélectionnée."""
        selected_row = self.table.currentRow()
        if selected_row == -1:
            QMessageBox.warning(self, "Erreur", "Veuillez sélectionner une étape.")
            return
        numero = int(self.table.item(selected_row, 0).text())
        self.etapes_logic.delete_etape(numero)
        self.load_etapes()

    def return_to_menu(self):
        """Retourne au menu principal."""
        self.hide()
        self.menu_window.show()
