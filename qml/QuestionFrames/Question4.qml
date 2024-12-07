import QtQuick 2.15
import QtQuick.Controls.Material
import "../Component"
import QtQuick.Layouts

/*
Под термином «аутсорсинг» обычно подразумевается передача тех или иных функций организации, сторонней компании, имеющей необходимые ресурсы для реализации этих функций.
*/

Item {
    property var answers: [
        qsTr("управление"),
        qsTr("интерференция"),
        qsTr("аутсорсинг"),
        qsTr("делегирование")
    ]
    property int answer: 3
    ColumnLayout {
        width: Math.min( 450, parent.width - 10)
        anchors {
            top: parent.top
            topMargin: 200
            horizontalCenter: parent.horizontalCenter
        }
        spacing: -2
        MaterialText {
            Layout.fillWidth: true
            wrapMode: Text.Wrap
            horizontalAlignment: Text.AlignJustify
            text: qsTr("Под термином «***» обычно подразумевается передача тех или иных функций организации, сторонней компании, имеющей необходимые ресурсы для реализации этих функций.")
        }
        RowLayout {
            MaterialText {
                text: qsTr("Пропущенно слово: ")
                maximumLineCount: 30
            }
            ComboBox {
                Layout.preferredWidth: 200
                Layout.preferredHeight: 50
                font.pointSize: 16
                model: answers
                HoverHandler {
                    cursorShape: Qt.PointingHandCursor
                }
            }
        }
    }
    SaveButton {

    }
}
