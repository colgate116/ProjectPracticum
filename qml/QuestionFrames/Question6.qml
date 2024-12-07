import QtQuick 2.15
import QtQuick.Controls.Material
import "../Component"
import "../NavigationActivity/NavigationFrame"
import QtQuick.Layouts


Item {
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
            MaterialText {
                font.pointSize: 14
                text: qsTr("Текст текст")
            }
            Repeater {
                model: ["1Текст Текст Текст Текст","2Текст Текст Текст Текст","3Текст Текст Текст Текст","4Текст Текст Текст Текст"]
                RadioButton {
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
            MaterialText {
                text: qsTr("Текст текст")
            }
            Repeater {
                model: ["a","b","c","d"]
                CheckBox {
                    text: (model.index + 1) + ") " + modelData
                    font.pointSize: 14
                    HoverHandler {
                        cursorShape: Qt.PointingHandCursor
                    }
                }
            }
        }
    }
    BoxFrame {
        anchors {
            top: row.bottom
            bottom: saveBtn.top
            right: task.right
            left: task.left
            margins: 10
        }
    }

    SaveButton {
        id: saveBtn
    }
}
