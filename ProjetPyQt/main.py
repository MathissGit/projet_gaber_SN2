from PyQt5.QtWidgets import QApplication, QMainWindow, QMessageBox
from ui.CoureursUI import CoureursUI

class MainWindow(QMainWindow):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("Application de Gestion")

        # Ajouter CoureursUI
        self.coureurs_ui = CoureursUI(self)
        self.setCentralWidget(self.coureurs_ui)

    def closeEvent(self, event):
        print("Fermeture de la fenêtre principale...")  # Log de fermeture

if __name__ == "__main__":
    app = QApplication([])

    try:
        window = MainWindow()
        window.show()
    except Exception as e:
        print(f"Erreur lors de la création de la fenêtre principale: {str(e)}")
        msg = QMessageBox()
        msg.setIcon(QMessageBox.Critical)
        msg.setWindowTitle("Erreur")
        msg.setText(f"Erreur de lancement de l'application : {str(e)}")
        msg.exec_()

    app.exec_()
