import QtQuick 2.15
import QtQuick.Controls.Material
import "../Component"
import "../NavigationActivity/NavigationFrame"
import QtQuick.Layouts


Item {
    TaskText {
        text: qsTr("Текст задания Текст задания Текст задания Текст задания")
        anchors {
            top: parent.top
            topMargin: 50
        }
    }
    ColumnLayout {
        spacing: 5
        anchors {
            top: parent.top
            topMargin: 200
            horizontalCenter: parent.horizontalCenter
        }
        Repeater {
            model: ["1Текст Текст Текст Текст","2Текст Текст Текст Текст","3Текст Текст Текст Текст","4Текст Текст Текст Текст"]
            RadioButton {
                text: (model.index + 1) + ") " + modelData
                font.pointSize: 14
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
