import sys
from PyQt5.QtWidgets import QApplication, QMainWindow, QMenu, QMenuBar, QAction
from ui.CoureursUI import CoureursUI
from ui.EquipesUI import EquipesUI
from ui.EtapesUI import EtapesUI
from PyQt5.QtWidgets import QStackedWidget

class MainWindow(QMainWindow):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("Gestion des coureurs, équipes et étapes")
        self.setGeometry(100, 100, 800, 600)

        # Stack widget to hold different UIs
        self.stack = QStackedWidget(self)
        self.setCentralWidget(self.stack)

        # Initialize UI pages
        self.coureurs_ui = CoureursUI(self)
        self.equipes_ui = EquipesUI(self)
        self.etapes_ui = EtapesUI(self)

        # Add the pages to the stack
        self.stack.addWidget(self.coureurs_ui)
        self.stack.addWidget(self.equipes_ui)
        self.stack.addWidget(self.etapes_ui)

        # Create menu
        self.create_menu()

    def create_menu(self):
        menubar = self.menuBar()

        # Create the menu and actions
        menu = menubar.addMenu('Menu')

        coureurs_action = QAction('Coureurs', self)
        coureurs_action.triggered.connect(self.show_coureurs)
        menu.addAction(coureurs_action)

        equipes_action = QAction('Equipes', self)
        equipes_action.triggered.connect(self.show_equipes)
        menu.addAction(equipes_action)

        etapes_action = QAction('Etapes', self)
        etapes_action.triggered.connect(self.show_etapes)
        menu.addAction(etapes_action)

    def show_coureurs(self):
        self.stack.setCurrentWidget(self.coureurs_ui)

    def show_equipes(self):
        self.stack.setCurrentWidget(self.equipes_ui)

    def show_etapes(self):
        self.stack.setCurrentWidget(self.etapes_ui)

if __name__ == '__main__':
    app = QApplication(sys.argv)
    window = MainWindow()
    window.show()
    sys.exit(app.exec_())
