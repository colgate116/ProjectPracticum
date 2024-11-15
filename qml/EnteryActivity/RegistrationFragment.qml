import QtQuick 2.15
import QtQuick.Layouts
import QtQuick.Controls.Material

ItemDelegate {
    ColumnLayout {
        spacing: 40
        width: parent.width
        TextField {
            placeholderText: qsTr("Придумайте логин")
            Layout.fillWidth: true
            font.pointSize: 16
            placeholderTextColor: focus ? Material.color( Material.Pink ) : "Black"
            onAccepted: {
                passwordCreateField.focus = true
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
            id: passwordCreateField
            placeholderText: qsTr("Придумайте пароль")
            Layout.fillWidth: true
            font.pointSize: 16
            placeholderTextColor: focus ? Material.color( Material.Pink ) : "Black"
            echoMode: "Password"
            onAccepted: {
                passwordRepeatField.focus = true
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
            id: passwordRepeatField
            placeholderText: qsTr("Подтвердите пароль")
            Layout.fillWidth: true
            font.pointSize: 16
            placeholderTextColor: focus ? Material.color( Material.Pink ) : "Black"
            echoMode: "Password"
            onAccepted: {
                passwordRepeatField.focus = false
            }
            Rectangle {
                anchors.fill: parent
                color: Material.color( Material.Grey )
                opacity: 0.6
                radius: 6
                z: -1
            }
        }
        Button {
            Layout.fillWidth: true
            font.pointSize: 16
            text: qsTr("Создать аккаунт")
            Material.foreground: "White"
            Material.background: Material.DeepPurple
            HoverHandler {
                cursorShape: Qt.PointingHandCursor
            }
        }
    }
}
