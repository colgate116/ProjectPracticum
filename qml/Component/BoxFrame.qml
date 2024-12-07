import QtQuick 2.15
import QtQuick.Controls.Material

Rectangle {
    color: switch (parent.Material.theme) {
           case Material.Dark:
               return "black"
           case Material.Light:
               return "#ccc9ca"
           default:
               return "#ccc9ca"
           }
    radius: 5
    border.color: Material.color( Material.Grey )
}
