import QtQuick 2.15
import QtQuick.Layouts
import QtQuick.Controls.Material

ItemDelegate {
    ColumnLayout {
        spacing: 40
        width: parent.width
        TextField {
            id: loginReg
            placeholderText: qsTr("Придумайте логин")
            Layout.fillWidth: true
            font.pointSize: 16
            placeholderTextColor: focus ? Material.color( Material.BlueGrey ) : "Black"
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
            placeholderTextColor: focus ? Material.color( Material.BlueGrey ) : "Black"
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
            placeholderTextColor: focus ? Material.color( Material.BlueGrey ) : "Black"
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
            Material.background: Material.Teal
            HoverHandler {
                cursorShape: Qt.PointingHandCursor
            }
            onReleased: {
                if ( passwordCreateField.text === passwordRepeatField.text && passwordCreateField.text.trim() !== "" )
                {
                    if (db.isUserExists(loginReg.text)) {
                        msgTxt.visible = true
                        msgTxt.text = qsTr("Такой пользователь уже есть")
                        return;
                    }
                    if (db.insertNewUser( loginReg.text, passwordCreateField.text ))
                    {
                        msgTxt.visible = false
                        loginReg.text = ""
                        passwordCreateField.text = ""
                        passwordRepeatField.text = ""
                        signInBtn.Material.background = Material.Grey
                        signInBtn.Material.foreground = "White"
                        registrationBtn.Material.foreground = Material.Grey
                        registrationBtn.Material.background = "transparent"
                        autorizationFrame.currentIndex = 0
                    }
                }
                else
                {
                    msgTxt.visible = true
                    msgTxt.text = qsTr("Пароли не совпали")
                }
            }
        }
    }
}
