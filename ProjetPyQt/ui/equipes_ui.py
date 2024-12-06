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
from logic.equipes import Equipes


class EquipesUI(QWidget):
    def __init__(self, menu_window, parent=None):
        super().__init__(parent)
        self.menu_window = menu_window  # Référence au menu principal
        self.equipes_logic = Equipes()
        self.setWindowTitle("Gestion des Équipes")
        self.init_ui()

    def init_ui(self):
        self.layout = QVBoxLayout()

        # Table pour afficher les équipes
        self.table = QTableWidget()
        self.table.setColumnCount(3)
        self.table.setHorizontalHeaderLabels(["ID", "Nom", "Pays"])
        self.layout.addWidget(self.table)

        # Formulaire pour ajouter ou modifier une équipe
        form_layout = QHBoxLayout()
        self.nom_input = QLineEdit()
        self.pays_input = QLineEdit()
        form_layout.addWidget(QLabel("Nom:"))
        form_layout.addWidget(self.nom_input)
        form_layout.addWidget(QLabel("Pays:"))
        form_layout.addWidget(self.pays_input)
        self.layout.addLayout(form_layout)

        # Boutons
        button_layout = QHBoxLayout()
        self.add_button = QPushButton("Ajouter")
        self.add_button.clicked.connect(self.add_equipe)
        self.update_button = QPushButton("Modifier")
        self.update_button.clicked.connect(self.update_equipe)
        self.delete_button = QPushButton("Supprimer")
        self.delete_button.clicked.connect(self.delete_equipe)
        
        # Bouton Retour
        self.back_button = QPushButton("Retour")
        self.back_button.clicked.connect(self.return_to_menu)

        button_layout.addWidget(self.add_button)
        button_layout.addWidget(self.update_button)
        button_layout.addWidget(self.delete_button)
        button_layout.addWidget(self.back_button)

        self.layout.addLayout(button_layout)

        self.setLayout(self.layout)
        self.load_equipes()

    def load_equipes(self):
        """Charge les équipes depuis la base de données."""
        equipes = self.equipes_logic.get_all_equipes()
        self.table.setRowCount(len(equipes))
        for row, equipe in enumerate(equipes):
            self.table.setItem(row, 0, QTableWidgetItem(str(equipe["id"])))
            self.table.setItem(row, 1, QTableWidgetItem(equipe["nom"]))
            self.table.setItem(row, 2, QTableWidgetItem(equipe["pays"]))

    def add_equipe(self):
        """Ajoute une nouvelle équipe."""
        nom = self.nom_input.text()
        pays = self.pays_input.text()
        if not nom or not pays:
            QMessageBox.warning(self, "Erreur", "Veuillez remplir tous les champs.")
            return
        self.equipes_logic.add_equipe(nom, pays)
        self.load_equipes()

    def update_equipe(self):
        """Met à jour l'équipe sélectionnée."""
        selected_row = self.table.currentRow()
        if selected_row == -1:
            QMessageBox.warning(self, "Erreur", "Veuillez sélectionner une équipe.")
            return
        equipe_id = int(self.table.item(selected_row, 0).text())
        nom = self.nom_input.text()
        pays = self.pays_input.text()
        if not nom or not pays:
            QMessageBox.warning(self, "Erreur", "Veuillez remplir tous les champs.")
            return
        self.equipes_logic.update_equipe(equipe_id, nom, pays)
        self.load_equipes()

    def delete_equipe(self):
        """Supprime l'équipe sélectionnée."""
        selected_row = self.table.currentRow()
        if selected_row == -1:
            QMessageBox.warning(self, "Erreur", "Veuillez sélectionner une équipe.")
            return
        equipe_id = int(self.table.item(selected_row, 0).text())
        self.equipes_logic.delete_equipe(equipe_id)
        self.load_equipes()

    def return_to_menu(self):
        """Retourne au menu principal."""
        self.hide()
        self.menu_window.show()
