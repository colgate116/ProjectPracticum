import QtQuick 2.15
import QtQuick.Layouts
import QtQuick.Controls.Material

import "../Component"

ItemDelegate {
    id: sideBar
    z: 3
    visible: false
    width: 250
    background: Image {
        source: "qrc:/path/imgs/MTUCI.jpg"
        anchors.fill: parent
        fillMode: Image.PreserveAspectCrop
        Rectangle {
            anchors.fill: parent
            opacity: 0.9
            gradient: Gradient {
                GradientStop { position: 0.0; color: "#252D40" }
                GradientStop { position: 1.0; color: "Black" }
            }
        }
    }
    Text {
        id: userName
        text: "userName"
        font.pointSize: 16
        color: Material.color(Material.Grey)
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: parent.top
            topMargin: 20

        }
    }
    Rectangle {
        color: Material.color(Material.Grey)
        height: 2
        radius: 10
        anchors {
            top: userName.bottom
            topMargin: 10
            left: parent.left
            leftMargin: 10
            right: parent.right
        }
    }
    ColumnLayout {
        width: sideBar.width
        anchors.top: userName.bottom
        anchors.topMargin: 20
        Repeater {
            model: [
                qsTr("Титульный лист"),
                qsTr("Теоретическая часть"),
                qsTr("Тестовая часть"),
                qsTr("Статистика")

            ]
            TextButton {
                Layout.fillWidth: true
                Layout.preferredHeight: 40
                btnText {
                    text: modelData
                }
                onReleased: {
                    //todo signal
                    navigationStack.currentIndex = index
                    fragmentName.text = modelData
                    sideBar.visible = false
                }
            }
        }
    }
    Rectangle {
        color: Material.color(Material.Grey)
        height: 2
        radius: 10
        anchors {
            bottom: exitBtn.top
            bottomMargin: 7
            left: parent.left
            leftMargin: 10
            right: parent.right
            rightMargin: 10
        }
    }
    TextButton {
        id: exitBtn
        btnText {
            text: qsTr("Выход из аккаунта")
            color: Material.color(Material.Red)
        }
        anchors {
            bottom: parent.bottom
            bottomMargin: 20
            right: parent.right
            left: parent.left
        }
        onReleased: {
            stack.pop()
        }
    }
}
