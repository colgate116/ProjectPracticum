import QtQuick 2.15
import QtQuick.Controls.Material
import "../Component"
import QtQuick.Layouts

Item {
    property string msgText: qsTr("Желаете завершить тест? Убедитесь, что вы сохранили все ответы верно.")
    property string btnText: qsTr("Завершить тест")

    MaterialText {
        width: Math.min( 800, parent.width )
        id: txt
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: parent.top
            topMargin: 200
        }
        horizontalAlignment: Text.AlignHCenter
        wrapMode: Text.Wrap
        text: msgText
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
        text: btnText
        onReleased: {
            finishTest()
        }
    }
}
