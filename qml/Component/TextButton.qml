import QtQuick 2.15
import QtQuick.Controls.Material

ItemDelegate {
    property string btnText: ""
    property var textColor: Material.color(Material.Grey)
    height: 40
    background: Rectangle {
        anchors.fill: parent
        Material.background: Material.Grey
        opacity: hovered ? 0.2 : 0
    }
    Text {
        text: btnText
        font.pointSize: 16
        color: textColor
        anchors {
            left: parent.left
            leftMargin: 10
        }
    }
    HoverHandler {
        cursorShape: Qt.PointingHandCursor
    }
}
