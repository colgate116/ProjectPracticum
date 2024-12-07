import QtQuick 2.15
import QtQuick.Controls.Material
import "../Component"
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
        width: 400
        spacing: 5
        anchors {
            top: parent.top
            topMargin: 200
            horizontalCenter: parent.horizontalCenter
        }
        MaterialText {
            Layout.fillWidth: true
            wrapMode: Text.Wrap
            maximumLineCount: 30
            text: qsTr("текст текст текст текст текст текст текст текст текст текст текст текст текст " +
                       "текст текст текст текст тексттекст текст текст текст текст текст текст текст текст текст текст текст " +
                       "текст текст текст текст тексттекст текст текст текст текст текст текст текст текст текст текст текст ")
        }
        Slider {
            Layout.fillWidth: true
            value: 50
            from: 1
            to: 100
            onMoved: {
                answer7.text = qsTr("Выбранный ответ: " ) + Math.round(value)
            }
        }
        MaterialText {
            id: answer7
            Layout.fillWidth: true
            text: qsTr("Выбранный ответ: " )
        }

    }
    SaveButton {

    }
}
