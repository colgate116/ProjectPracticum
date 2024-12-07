import QtQuick 2.15
import QtQuick.Controls.Material

Button {
    text: qsTr("Сохранить ответ")
    font.bold: true
    Material.foreground: "White"
    Material.background: Material.Teal
    anchors {
        bottom: parent.bottom
        right: parent.right
        margins: 10
    }
    onReleased: {
        saveAnswer()
    }
    HoverHandler {
        cursorShape: Qt.PointingHandCursor
    }
}
