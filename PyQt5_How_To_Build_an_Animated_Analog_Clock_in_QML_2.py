import sys
from PyQt5.QtCore import QUrl
from PyQt5.QtGui import QGuiApplication
from PyQt5.QtQml import QQmlApplicationEngine

if __name__ == "__main__":
    # Create the application instance
    app = QGuiApplication(sys.argv)

    # Create QML engine
    engine = QQmlApplicationEngine()

    # Load the QML file
    engine.load(QUrl("Clock3.qml"))

    # Check if the QML file failed to load
    if not engine.rootObjects():
        sys.exit(-1)

    # Execute the application
    sys.exit(app.exec_())
