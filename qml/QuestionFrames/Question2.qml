import QtQuick 2.15
import QtQuick.Controls.Material
import "../Component"
import "../NavigationActivity/NavigationFrame"
import QtQuick.Layouts


Item {
    property var answers: [qsTr("Увеличение добычи и экспорта\nуглеводородов"),
        qsTr("Рост российского несырьевого\nэкспорта"),
        qsTr("Привлечение иностранных\nинвестиций"),
        qsTr("Увелечение импорта товаров\nдружественных стран")]
    property int rightAnswer: 2
    TaskText {
        text: qsTr("В связи с санкционной политикой западных стран главной целью развитие российской экономики является:")
        anchors {
            top: parent.top
            topMargin: 50
        }
    }
    ColumnLayout {
        width: 300
        spacing: 5
        anchors {
            top: parent.top
            topMargin: 200
            horizontalCenter: parent.horizontalCenter
        }
        Repeater {
            model: answers
            RadioButton {
                text: (model.index + 1) + ") " + modelData
                font.pointSize: 16
                HoverHandler {
                    cursorShape: Qt.PointingHandCursor
                }
                onFocusChanged: {
                    answer2.text = qsTr("Выбранный ответ: " ) + (model.index + 1)
                }
            }
        }
        MaterialText {
            id: answer2
            Layout.leftMargin: 10
            text: qsTr("Выбранный ответ: " )
        }
    }
    SaveButton {

    }
}
