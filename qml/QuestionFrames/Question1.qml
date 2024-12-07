import QtQuick 2.15
import QtQuick.Controls.Material
import "../Component"
import QtQuick.Layouts


Item {
    ColumnLayout {
        spacing: -2
        anchors {
            top: parent.top
            topMargin: 200
            horizontalCenter: parent.horizontalCenter
        }
        RowLayout {
            id: _row
            CustomTextField {
                Layout.preferredHeight: 38
                font.pointSize: 14
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
