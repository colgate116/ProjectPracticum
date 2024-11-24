import QtQuick 2.15
import QtQuick.Layouts
import QtQuick.Controls.Material

import "../Component"
import "NavigationFrame"


ItemDelegate {
    background: Rectangle {
        id: background
        color: "#252D40"
    }

    NavigationSideBar {
        id: navigationSideBar
        anchors {
            left: parent.left
            top: parent.top
            bottom: parent.bottom
        }
    }

    ImgButton {
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
    }

    onReleased: {
        if ( navigationSideBar.visible ) {
            navigationSideBar.visible = false
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
        TestFrame {
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
        Item {
        }
    }
}
