# ui/menu_ui.py
from PyQt5.QtWidgets import QWidget, QVBoxLayout, QPushButton

class MenuUI(QWidget):
    def __init__(self, parent=None):
        super().__init__(parent)
        self.setWindowTitle('Menu Principal')
        
        self.layout = QVBoxLayout(self)
        
        # Boutons de navigation
        self.coureurs_button = QPushButton('Gestion des Coureurs', self)
        self.equipes_button = QPushButton('Gestion des Equipes', self)
        self.etapes_button = QPushButton('Gestion des Etapes', self)
        
        self.layout.addWidget(self.coureurs_button)
        self.layout.addWidget(self.equipes_button)
        self.layout.addWidget(self.etapes_button)
        
        # Connexion des boutons à leurs actions
        self.coureurs_button.clicked.connect(self.open_coureurs_ui)
        self.equipes_button.clicked.connect(self.open_equipes_ui)
        self.etapes_button.clicked.connect(self.open_etapes_ui)
    
    def open_coureurs_ui(self):
        from ui.coureurs_ui import CoureursUI
        self.coureurs_ui = CoureursUI()
        self.coureurs_ui.show()
        self.close()  # Fermer le menu principal
    
    def open_equipes_ui(self):
        from ui.equipes_ui import EquipesUI
        self.equipes_ui = EquipesUI()
        self.equipes_ui.show()
        self.close()  # Fermer le menu principal
    
    def open_etapes_ui(self):
        from ui.etapes_ui import EtapesUI
        self.etapes_ui = EtapesUI()
        self.etapes_ui.show()
        self.close()  # Fermer le menu principal
