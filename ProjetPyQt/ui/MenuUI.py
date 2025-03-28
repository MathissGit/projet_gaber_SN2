from PyQt5.QtWidgets import QWidget, QVBoxLayout, QPushButton


class MenuUI(QWidget):
    def __init__(self, parent=None):
        super().__init__(parent)
        self.setWindowTitle("Menu Principal")

        self.layout = QVBoxLayout(self)

        # Boutons de navigation
        self.coureurs_button = QPushButton("Gestion des Coureurs", self)
        self.equipes_button = QPushButton("Gestion des Equipes", self)
        self.etapes_button = QPushButton("Gestion des Etapes", self)

        self.layout.addWidget(self.coureurs_button)
        self.layout.addWidget(self.equipes_button)
        self.layout.addWidget(self.etapes_button)

        # Connexion des boutons à leurs actions
        self.coureurs_button.clicked.connect(self.open_coureurs_ui)
        self.equipes_button.clicked.connect(self.open_equipes_ui)
        self.etapes_button.clicked.connect(self.open_etapes_ui)

    def open_coureurs_ui(self):
        print("Ouverture de la fenêtre des coureurs...")  # Debug
        try:
            from projet_gaber_SN2.ProjetPyQt.ui.CoureursUI import CoureursUI
            self.coureurs_ui = CoureursUI(self)
            self.coureurs_ui.show()
            self.hide()  # Fermer le menu principal
        except Exception as e:
            print(f"Erreur lors de l'ouverture de la fenêtre Coureurs: {e}")

    def open_equipes_ui(self):
        print("Ouverture de la fenêtre des équipes...")  # Debug
        from projet_gaber_SN2.ProjetPyQt.ui.EquipesUI import EquipesUI
        self.equipes_ui = EquipesUI(self)
        self.equipes_ui.show()
        self.hide()

    def open_etapes_ui(self):
        print("Ouverture de la fenêtre des étapes...")  # Debug
        from projet_gaber_SN2.ProjetPyQt.ui.EtapesUI import EtapesUI
        self.etapes_ui = EtapesUI(self)
        self.etapes_ui.show()
        self.hide()
