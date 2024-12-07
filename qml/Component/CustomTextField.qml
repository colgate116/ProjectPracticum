import QtQuick 2.15
import QtQuick.Controls.Material

TextField {
    font.pointSize: 14
    Rectangle {
        anchors.fill: parent
        opacity: 0.6
        radius: 6
        z: -1
        color: switch (parent.Material.theme) {
               case Material.Dark:
                   return "black"
               case Material.Light:
                   return "#ccc9ca"
               default:
                   return "#ccc9ca"
               }
    }
    onAccepted: {
        focus = false
    }
}
