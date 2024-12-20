import QtQuick 2.15
import QtQuick.Layouts
import QtQuick.Controls.Material

Item {
    ColumnLayout {
        spacing: 20
        width: parent.width
        TextField {
            id: loginField
            placeholderText: qsTr("Логин")
            Layout.fillWidth: true
            font.pointSize: 16
            placeholderTextColor: focus ? Material.color( Material.BlueGrey ) : "Black"
            onAccepted: {
                passwordField.focus = true
            }
            Rectangle {
                anchors.fill: parent
                color: Material.color( Material.Grey )
                opacity: 0.6
                radius: 6
                z: -1
            }
        }
        TextField {
            id: passwordField
            placeholderText: qsTr("Пароль")
            Layout.fillWidth: true
            font.pointSize: 16
            placeholderTextColor: focus ? Material.color( Material.BlueGrey ) : "Black"
            echoMode: "Password"
            onAccepted: {
                focus = false
            }
            Rectangle {
                anchors.fill: parent
                color: Material.color( Material.Grey )
                opacity: 0.6
                radius: 6
                z: -1
            }
        }
        CheckBox {
            id: rememberMe
            text: qsTr("Запомнить меня")
            font.pointSize: 16
            Material.foreground: "White"
            HoverHandler {
                cursorShape: Qt.PointingHandCursor
            }
        }
        Button {
            Layout.fillWidth: true
            font.pointSize: 16
            text: qsTr("Вход")
            Material.foreground: "White"
            Material.background: Material.Teal
            HoverHandler {
                cursorShape: Qt.PointingHandCursor
            }
            onClicked: {
                //todo signal
                if ( db.signIn( loginField.text, passwordField.text ) )
                {
                    msgTxt.visible = false
                    settings.skipAutorization = rememberMe.checkState
                    settings.userName = loginField.text
                    loginField.text = ""
                    passwordField.text = ""
                    settings.saveSkipping()
                    stack.push( navigationActivity )
                }
                else {
                    msgTxt.visible = true
                    msgTxt.text = qsTr("Неверный логин или пароль")
                }
            }
        }
    }
}
