import QtQuick 2.15
import QtQuick.Layouts
import QtQuick.Controls.Material
import "../../Component"

Item {
    RowLayout {
        id: taskNumRow
        Repeater {
            model: 100
            TextButton {
                Layout.preferredHeight: 30
                btnText.text: index + 1
            }
        }
    }
    // Flickable {
    //     contentWidth: taskNumRow.width
    //     width: parent.width
    //     flickDeceleration: Flickable.HorizontalFlick
    // }

}
