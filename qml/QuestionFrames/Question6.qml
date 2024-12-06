import QtQuick 2.15
import QtQuick.Controls.Material
import "../Component"
import "../NavigationActivity/NavigationFrame"
import QtQuick.Layouts


Item {
    QuestionFrame {
        placeholderText: qsTr("Выбор ответа")
    }
    TaskText {
        id: task
        text: qsTr("Текст задания Текст задания Текст задания Текст задания")
        anchors {
            top: parent.top
            topMargin: 50
        }
    }
    RowLayout {
        id: row
        spacing:50
        anchors {
            top: parent.top
            topMargin: 100
            horizontalCenter: parent.horizontalCenter
        }
        ColumnLayout {
            spacing: 5
            Text {
                font.pointSize: 14
                text: qsTr("Текст текст")
            }
            Repeater {
                model: ["1Текст Текст Текст Текст","2Текст Текст Текст Текст","3Текст Текст Текст Текст","4Текст Текст Текст Текст"]
                RadioButton {
                    Material.accent: Material.Teal
                    text: (model.index + 1) + ") " + modelData
                    font.pointSize: 14
                    HoverHandler {
                        cursorShape: Qt.PointingHandCursor
                    }
                }
            }
        }
        ColumnLayout {
            spacing: 5
            Text {
                font.pointSize: 14
                text: qsTr("Текст текст")
            }
            Repeater {
                model: ["a","b","c","d"]
                CheckBox {
                    Material.accent: Material.Teal
                    text: (model.index + 1) + ") " + modelData
                    font.pointSize: 14
                    HoverHandler {
                        cursorShape: Qt.PointingHandCursor
                    }
                }
            }
        }
    }
    Rectangle {
        anchors {
            top: row.bottom
            topMargin: 50
            left: parent.left
            leftMargin: 50
            right: parent.right
            rightMargin: 50
        }
        radius: 5
        border.color: Material.color( Material.Grey )
    }

    SaveButton {
        id: saveBtn
    }
}
