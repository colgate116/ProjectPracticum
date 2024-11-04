import QtQuick 2.15
import QtQuick.Controls.Material

ItemDelegate {
    id: btn
    property var imgSource
    property alias hoveredArea: mouseArea
    Image {
        id: navigationSideBarBtn
        anchors.fill: parent
        source: imgSource
        MouseArea {
            id: mouseArea
            anchors.fill: parent
            onReleased: {
                navigationSideBar.visible = true
            }
            cursorShape: Qt.PointingHandCursor
        }
    }
    Rectangle {
        anchors.fill: parent
        Material.background: Material.Grey
        opacity: btn.hovered ? 0.2 : 0
        radius: 8
    }
}
