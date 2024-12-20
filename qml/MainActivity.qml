import QtQuick 2.15
import QtQuick.Controls.Material
import app
import "NavigationActivity"
import "EnteryActivity"

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

    signal testFinished

    StackView {
        id: stack
        anchors.fill: parent
        initialItem: settings.skipAutorization && settings.userName.trim() !== ""  &&  db.isUserExists(settings.userName) ? navigationActivity : enteryActivity
    }
    Component {
        id: navigationActivity
        NavigationActivity {
        }
    }
    Component {
        id: enteryActivity
        EnteryActivity {
            id: ea
        }
    }
    Component {
        id: testActivity
        TestFrame {
        }
    }
    DataBase {
        id: db
        onTestSaved: {
            statModel.content = db.getUsetStat( settings.userName )
        }
    }
    SettingsManager {
        id: settings
        onUserNameChanged: {
            statModel.content = db.getUsetStat( userName )
        }
    }
    StatModel {
        id: statModel
        content: db.getUsetStat( settings.userName )
    }
    Component.onDestruction: {
        db.close()
    }
}
