import QtQuick 2.15
import QtQuick.Controls.Material
import "../Component"
import QtQuick.Layouts


Item {
    QuestionFrame {
        id: ps
        placeholderText: qsTr("Впишите пропущенное слово")
    }

    ColumnLayout {
        spacing: -2
        anchors {
            top: parent.top
            topMargin: 200
            horizontalCenter: parent.horizontalCenter
        }
        RowLayout {
            id: _row
            TextField {
                Material.accent: Material.Teal
                Layout.preferredHeight: 38
                font.pointSize: 14
                Rectangle {
                    anchors.fill: parent
                    color: Material.color( Material.Grey )
                    opacity: 0.6
                    radius: 6
                    z: -1
                }
                onAccepted: {
                    focus = false
                }
            }
            Text {
                text: qsTr("текст текст текст текст текст")
                font.pointSize: 14
                maximumLineCount: 30
                Layout.alignment: Qt.AlignBottom
            }
        }
        Text {
            Layout.preferredWidth: _row.width
            wrapMode: Text.Wrap
            maximumLineCount: 30
            text: qsTr("текст текст текст текст текст текст текст текст текст текст текст текст текст " +
                       "текст текст текст текст тексттекст текст текст текст текст текст текст текст текст текст текст текст " +
                       "текст текст текст текст тексттекст текст текст текст текст текст текст текст текст текст текст текст ")
            font.pointSize: 14
        }
    }
    SaveButton {

    }
}
