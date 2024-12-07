import QtQuick 2.15
import QtQuick.Controls.Material
import QtQuick.Layouts

Item {
    id: root
    property string rbText
    height: contentItem_.height + 20
    RowLayout {
        RadioButton {
            id: rb
        }
        MaterialText {
            id: contentItem_
            text: rbText
        }
    }
    MouseArea {
        anchors.fill: parent
        onReleased: {
            rb.focusChanged()
            root.focusChanged()
        }
        HoverHandler {
            cursorShape: Qt.PointingHandCursor
        }
    }
}
