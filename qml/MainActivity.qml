import QtQuick 2.15
import QtQuick.Controls.Material
import app

Window {
    height: 1200
    width: 900
    minimumHeight: 650
    minimumWidth: 700
    id: window
    visible: true
    visibility: Window.Maximized
    title: qsTr("Программа для тестирования")

    StackView {
        id: stack
        anchors.fill: parent
        initialItem: settings.skipAutorization && settings.userName.trim() !== ""  &&  db.isUserExists(settings.userName) ? "qrc:/path/qml/NavigationActivity/NavigationActivity.qml" : "qrc:/path/qml/EnteryActivity/EnteryActivity.qml"
    }

    DataBase {
        id: db
    }

    SettingsManager {
        id: settings
    }
}
