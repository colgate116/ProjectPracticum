import QtQuick 2.15
import QtQuick.Controls.Material

Text {
    font.pointSize: 20
    font.bold: true
    wrapMode: Text.Wrap
    horizontalAlignment: Text.AlignHCenter
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.leftMargin: 40
    anchors.rightMargin: 40
    color: switch( window.Material.theme ) {
            case Material.Dark:
                return "white"
            case Material.Light:
                return "black"
            default:
                return "black"
           }
}
