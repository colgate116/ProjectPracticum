import QtQuick 2.15
import QtQuick.Controls.Material
import "../Component"
import QtQuick.Layouts


Item {
    ColumnLayout {
        anchors {
            top: parent.top
            topMargin: 200
            horizontalCenter: parent.horizontalCenter
        }
        spacing: -2
        RowLayout {
            id: _row
            ComboBox {
                Layout.preferredHeight: 50
                font.pointSize: 14
                model: [1,2,3,4,5]
                HoverHandler {
                    cursorShape: Qt.PointingHandCursor
                }
            }
            MaterialText {
                text: qsTr("текст текст текст текст текст")
                maximumLineCount: 30
                Layout.alignment: Qt.AlignBottom
            }
        }
        MaterialText {
            Layout.preferredWidth: _row.width
            wrapMode: Text.Wrap
            maximumLineCount: 30
            text: qsTr("текст текст текст текст текст текст текст текст текст текст текст текст текст " +
                       "текст текст текст текст тексттекст текст текст текст текст текст текст текст текст текст текст текст " +
                       "текст текст текст текст тексттекст текст текст текст текст текст текст текст текст текст текст текст ")
        }
    }
    SaveButton {

    }
}
