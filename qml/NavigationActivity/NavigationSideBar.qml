import QtQuick 2.15
import QtQuick.Layouts
import QtQuick.Controls.Material
import "../Component"

ItemDelegate {
    id: sideBar

    signal sideBarOpened
    signal sideBarClosed

    onSideBarOpened: {
        blur.visible = true
        openAnimation.start()
    }

    onSideBarClosed: {
        blur.visible = false
    }

    onVisibleChanged: {
        if ( visible ) {
            sideBarOpened()
        }
        else {
            sideBarClosed()
        }
    }

    z: 5
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

    PropertyAnimation {
        id: openAnimation
        target: sideBar
        properties: "width"
        from: 0
        to: width
        duration: 100
    }
    Text {
        id: userName
        text: settings.userName
        font.pointSize: 16
        wrapMode: Text.Wrap
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
                    navigationStack.currentIndex = index
                    fragmentName.text = modelData
                    sideBar.visible = false
                }
            }
        }
    }
    RowLayout {
        anchors {
            bottom: exitBtn.top
            bottomMargin: 15
            horizontalCenter: parent.horizontalCenter
        }
        Image {
            Layout.preferredHeight: 30
            Layout.preferredWidth: 30
            source: "qrc:/path/imgs/sun.png"
        }
        Switch {
            Layout.preferredHeight: 20
            Material.accent: Material.Indigo
            checked: window.Material.theme === Material.Dark
            onReleased: {
                if (checked) {
                    window.Material.theme = Material.Dark
                    settings.theme = 1
                }
                else {
                    window.Material.theme = Material.Light
                    settings.theme = 0
                }
                settings.saveTheme()
            }
            HoverHandler {
                cursorShape: Qt.PointingHandCursor
            }
        }
        Image {
            Layout.preferredHeight: 30
            Layout.preferredWidth: 30
            source: "qrc:/path/imgs/moon.png"
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
            settings.skipAutorization = false
            settings.saveSkipping()
            if ( stack.depth === 1 )
            {
                stack.replace( "qrc:/path/qml/EnteryActivity/EnteryActivity.qml" )
            }
            else
            {
                stack.pop()
            }
        }
    }
}
