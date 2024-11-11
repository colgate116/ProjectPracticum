import QtQuick 2.15
import QtQuick.Layouts
import QtQuick.Controls.Material

ItemDelegate {
    background:
        Rectangle {
            anchors.fill: parent
            opacity: 0.65
            gradient: Gradient {
                GradientStop { position: 0.0; color: "purple" }
                GradientStop { position: 1.0; color: "darkBlue" }
            }
        }

    Item {
        height: parent.height - 160
        width: 350
        anchors.centerIn: parent
        RowLayout {
            id: btnRow
            anchors {
                left: parent.left
                leftMargin: 5
            }
            spacing: 30
            Button {
                id: signInBtn
                text: qsTr("Вход")
                font.pointSize: 20
                Material.foreground: "White"
                Material.background: Material.Grey
                background.opacity: 0.4
                onReleased: {
                    Material.background = Material.Grey
                    Material.foreground = "White"
                    registrationBtn.Material.foreground = Material.Grey
                    registrationBtn.Material.background = "transparent"
                    autorizationFrame.currentIndex = 0
                }
                HoverHandler {
                    cursorShape: Qt.PointingHandCursor
                }
            }
            Button {
                id: registrationBtn
                text: qsTr("Регистрация")
                font.pointSize: 20
                Material.foreground: Material.Grey
                Material.background: "transparent"
                background.opacity: 0.4
                onReleased: {
                    Material.background = Material.Grey
                    Material.foreground = "White"
                    signInBtn.Material.foreground = Material.Grey
                    signInBtn.Material.background = "transparent"
                    autorizationFrame.currentIndex = 1
                }
                HoverHandler {
                    cursorShape: Qt.PointingHandCursor
                }
            }
        }
        StackLayout {
            id: autorizationFrame
            currentIndex: 0
            anchors {
                left: parent.left
                right: parent.right
                top: btnRow.bottom
                topMargin: 80
            }
            SignInFragment {
                Layout.fillWidth: true
            }
            RegistrationFragment {
                Layout.fillWidth: true
            }
        }
    }
}
