import QtQuick 2.15
import QtQuick.Controls.Material
import "../Component"
import QtQuick.Layouts

Item {
    MaterialText {
        id: txt
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: parent.top
            topMargin: 200
        }

        wrapMode: Text.Wrap
        text: qsTr("Желаете завершить тест? убедитесь, что вы сохранили все ответы верно.")
    }
    Button {
        anchors {
            top: txt.bottom
            horizontalCenter: parent.horizontalCenter
            topMargin: 10
        }
        font.bold: true
        Material.foreground: "White"
        Material.background: Material.Teal
        text: qsTr("Завершить тест")
        onReleased: {
            finishTest()
        }
    }
}
