import QtQuick 2.15
import QtQuick.Controls.Material

ItemDelegate {
    property alias btnText: txt
    height: 40
    background: Rectangle {
        anchors.fill: parent
        Material.background: Material.Grey
        opacity: hovered ? 0.2 : 0
    }
    Text {
        id: txt
        font.pointSize: 16
        color: Material.color(Material.Grey)
        anchors.centerIn: parent
    }
    HoverHandler {
        cursorShape: Qt.PointingHandCursor
    }
}
