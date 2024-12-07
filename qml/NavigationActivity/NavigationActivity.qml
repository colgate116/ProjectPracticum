import QtQuick 2.15
import QtQuick.Layouts
import QtQuick.Controls.Material

import "../Component"
import "NavigationFrame"


Item {    
    Pane {
        anchors.fill: parent
    }

    PropertyAnimation {
        id: bluring
        target: blur
        property: "opacity"
        from: 0
        to: 0.8
        duration: 20
    }

    NavigationSideBar {
        id: navigationSideBar
        anchors {
            left: parent.left
            top: parent.top
            bottom: parent.bottom
        }
    }

    Rectangle {
        id: blur
        z: 2
        color: "black"
        opacity: 0.8
        visible: false
        anchors.fill: parent
        onVisibleChanged: {
            if (visible) {
                bluring.start()
            }
        }
    }

    ImgButton {
        z: 2
        id: navigationSideBarBtn
        height: 40
        width: 40
        anchors {
            top: parent.top
            topMargin: 7
            left: parent.left
            leftMargin: 20
        }
        imgSource: "qrc:/path/imgs/navigationBarIcon.svg"
        onPushed: {
            navigationSideBar.visible = true
        }
    }

    MouseArea {
        anchors.fill: parent
        onReleased: {
            if ( navigationSideBar.visible ) {
                navigationSideBar.visible = false
            }
        }
    }

    Text {
        id: fragmentName
        anchors {
            top: parent.top
            right: parent.right
            margins: 15
        }
        font.pointSize: 16
        color: Material.color(Material.Grey)
        text: qsTr("Титульный лист")
    }
    Rectangle {
        id: line
        height: 2
        anchors {
            right: parent.right
            left: parent.left
            top: fragmentName.bottom
            topMargin: 15
        }
        color: Material.color(Material.Grey)
    }

    StackLayout {
        anchors {
            right: parent.right
            left: parent.left
            bottom: parent.bottom
            top: line.bottom
        }
        id: navigationStack
        Title {
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
        Theory {
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
        TestStartFrame {
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
        Item {
        }
    }
}
