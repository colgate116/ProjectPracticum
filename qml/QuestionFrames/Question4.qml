import QtQuick 2.15
import QtQuick.Controls.Material
import "../Component"
import QtQuick.Layouts


Item {
    QuestionFrame {
        placeholderText: qsTr("Впишите пропущенное слово")
    }

    ColumnLayout {
        anchors {
            centerIn: parent
        }
        spacing: -3
        RowLayout {
            id: _row
            ComboBox {
                Material.accent: Material.Teal
                Layout.preferredHeight: 50
                font.pointSize: 14
                model: [1,2,3,4,5]
                HoverHandler {
                    cursorShape: Qt.PointingHandCursor
                }
            }
            Text {
                text: qsTr("текст текст текст текст текст текст")
                font.pointSize: 14
                Layout.alignment: Qt.AlignBottom
            }
        }
        Text {
            Layout.preferredWidth: _row.width
            wrapMode: Text.Wrap
            text: qsTr("текст текст текст текст текст текст текст текст текст текст текст текст текст " +
                       "текст текст текст текст тексттекст текст текст текст текст текст текст текст текст текст текст текст " +
                       "текст текст текст текст тексттекст текст текст текст текст текст текст текст текст текст текст текст ")
            font.pointSize: 14
        }
    }
    SaveButton {

    }
}
