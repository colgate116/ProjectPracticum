import QtQuick 2.15
import QtQuick.Controls.Material
import app

Window {
    id: window
    height: 1200
    width: 900
    minimumHeight: 650
    minimumWidth: 700
    visible: true
    visibility: Window.Maximized
    title: qsTr("Программа для тестирования")

    Material.theme: switch( settings.theme ) {
                    case 0:
                        return Material.Light
                    case 1:
                        return Material.Dark
                    default:
                        return Material.System
                    }
    Material.accent: Material.Teal

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
