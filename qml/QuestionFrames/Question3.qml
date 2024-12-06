import QtQuick 2.15
import QtQuick.Controls.Material
import "../Component"
import "../NavigationActivity/NavigationFrame"
import QtQuick.Layouts


Item {
    property var checkedArray: [0, 0, 0, 0]
    QuestionFrame {
        placeholderText: qsTr("Выбор ответа (возможно несколько вариантов)")
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
            model: ["a","b","c","d"]
            CheckBox {
                Material.accent: Material.Teal
                text: (model.index + 1) + ") " + modelData
                font.pointSize: 14
                HoverHandler {
                    cursorShape: Qt.PointingHandCursor
                }
                onCheckStateChanged: {
                    if (checked) {
                        checkedArray[index] = 1
                    }
                    else {
                        checkedArray[index] = 0
                    }
                    answer3.text = qsTr("Выбранный ответ: " ) + convertToAnswer()
                }
            }
        }
        Text {
            id: answer3
            Layout.leftMargin: 8
            text: qsTr("Выбранный ответ: " )
            font.pointSize: 14
        }

    }
    SaveButton {

    }

    function convertToAnswer()
    {
        let ans = ""
        for ( let i = 0; i < checkedArray.length; i++ )
        {
            if ( checkedArray[i] === 1 )
                ans += (i + 1) + " "
        }
        return ans
    }
}
