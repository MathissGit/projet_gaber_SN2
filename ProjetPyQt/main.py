import sys
from PyQt5.QtWidgets import QApplication
from ui.menu_ui import MenuUI

def main():
    app = QApplication(sys.argv)
    menu = MenuUI()
    menu.show()
    sys.exit(app.exec_())

if __name__ == '__main__':
    main()
