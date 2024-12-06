from PyQt5.QtWidgets import (
    QWidget,
    QVBoxLayout,
    QPushButton,
    QTableWidget,
    QTableWidgetItem,
    QHBoxLayout,
    QMessageBox,
    QLineEdit,
    QLabel,
    QFormLayout,
)
from logic.coureurs import Coureurs


class CoureursUI(QWidget):
    def __init__(self, menu_window, parent=None):
        super().__init__(parent)
        self.menu_window = menu_window  # Référence au menu principal
        self.setWindowTitle("Gestion des Coureurs")
        self.resize(600, 400)

        # Initialisation de la logique
        self.coureurs_logic = Coureurs()

        # Mise en page principale
        self.layout = QVBoxLayout()

        # Tableau des coureurs
        self.table = QTableWidget()
        self.table.setColumnCount(4)
        self.table.setHorizontalHeaderLabels(["ID", "Nom", "Pays", "Date de naissance"])
        self.layout.addWidget(self.table)

        # Boutons
        buttons_layout = QHBoxLayout()

        self.load_button = QPushButton("Charger")
        self.load_button.clicked.connect(self.load_coureurs)
        buttons_layout.addWidget(self.load_button)

        self.add_button = QPushButton("Ajouter")
        self.add_button.clicked.connect(self.show_add_coureur_form)
        buttons_layout.addWidget(self.add_button)

        self.update_button = QPushButton("Modifier")
        self.update_button.clicked.connect(self.show_update_coureur_form)
        buttons_layout.addWidget(self.update_button)

        self.delete_button = QPushButton("Supprimer")
        self.delete_button.clicked.connect(self.delete_coureur)
        buttons_layout.addWidget(self.delete_button)

        # Bouton Retour
        self.back_button = QPushButton("Retour")
        self.back_button.clicked.connect(self.return_to_menu)
        buttons_layout.addWidget(self.back_button)

        self.layout.addLayout(buttons_layout)
        self.setLayout(self.layout)

        # Charger les coureurs au démarrage
        self.load_coureurs()

    def load_coureurs(self):
        """Charge les coureurs dans le tableau."""
        coureurs = self.coureurs_logic.get_all_coureurs()
        self.table.setRowCount(len(coureurs))

        for row_idx, coureur in enumerate(coureurs):
            self.table.setItem(row_idx, 0, QTableWidgetItem(str(coureur["id"])))
            self.table.setItem(row_idx, 1, QTableWidgetItem(coureur["nom"]))
            self.table.setItem(row_idx, 2, QTableWidgetItem(coureur["pays"]))
            self.table.setItem(row_idx, 3, QTableWidgetItem(coureur["date_naissance"]))

    def show_add_coureur_form(self):
        """Affiche un formulaire pour ajouter un coureur."""
        self.show_coureur_form(mode="add")

    def show_update_coureur_form(self):
        """Affiche un formulaire pour modifier un coureur sélectionné."""
        selected_row = self.table.currentRow()
        if selected_row == -1:
            QMessageBox.warning(
                self, "Erreur", "Veuillez sélectionner un coureur à modifier."
            )
            return

        coureur_id = int(self.table.item(selected_row, 0).text())
        self.show_coureur_form(mode="update", coureur_id=coureur_id)

    def show_coureur_form(self, mode, coureur_id=None):
        """Affiche un formulaire pour ajouter ou modifier un coureur."""
        form = QWidget()
        form.setWindowTitle(
            "Ajouter un coureur" if mode == "add" else "Modifier un coureur"
        )
        layout = QFormLayout()

        nom_input = QLineEdit()
        pays_input = QLineEdit()
        date_naissance_input = QLineEdit()

        layout.addRow("Nom:", nom_input)
        layout.addRow("Pays:", pays_input)
        layout.addRow("Date de naissance (YYYY-MM-DD):", date_naissance_input)

        save_button = QPushButton("Enregistrer")
        cancel_button = QPushButton("Annuler")

        def save_coureur():
            nom = nom_input.text()
            pays = pays_input.text()
            date_naissance = date_naissance_input.text()

            if mode == "add":
                self.coureurs_logic.add_coureur(nom, pays, date_naissance)
            elif mode == "update":
                self.coureurs_logic.update_coureur(
                    coureur_id, nom, pays, date_naissance
                )

            self.load_coureurs()
            form.close()

        save_button.clicked.connect(save_coureur)
        cancel_button.clicked.connect(form.close)

        buttons_layout = QHBoxLayout()
        buttons_layout.addWidget(save_button)
        buttons_layout.addWidget(cancel_button)
        layout.addRow(buttons_layout)

        form.setLayout(layout)
        form.show()

    def delete_coureur(self):
        """Supprime le coureur sélectionné."""
        selected_row = self.table.currentRow()
        if selected_row == -1:
            QMessageBox.warning(
                self, "Erreur", "Veuillez sélectionner un coureur à supprimer."
            )
            return

        coureur_id = int(self.table.item(selected_row, 0).text())
        self.coureurs_logic.delete_coureur(coureur_id)
        self.load_coureurs()

    def return_to_menu(self):
        """Retourne au menu principal."""
        self.hide()
        self.menu_window.show()
