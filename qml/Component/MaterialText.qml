import QtQuick 2.15
import QtQuick.Controls.Material
import ".."

Text {
    color: switch( window.Material.theme ) {
            case Material.Dark:
                return "white"
            case Material.Light:
                return "black"
            default:
                return "black"
           }
    font.pointSize: 16
}
