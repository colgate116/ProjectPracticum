import QtQuick 2.15
import QtQuick.Controls.Material
import "../Component"
import "../NavigationActivity/NavigationFrame"
import QtQuick.Layouts


Item {
    QuestionFrame {
        placeholderText: qsTr("Выбор ответа (один вариант)")
    }
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
                Material.accent: Material.Teal
                text: modelData
                font.pointSize: 14
                HoverHandler {
                    cursorShape: Qt.PointingHandCursor
                }
            }
        }
        Text {
            text: qsTr("Выбранный ответ:" )
            font.pointSize: 14
        }
    }
    SaveButton {

    }
}