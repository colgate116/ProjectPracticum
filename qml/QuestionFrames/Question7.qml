import QtQuick 2.15
import QtQuick.Controls.Material
import "../Component"
import QtQuick.Layouts


Item {
    ColumnLayout {
        width: Math.min( 450, parent.width - 10)
        spacing: 10
        anchors {
            top: parent.top
            topMargin: 200
            horizontalCenter: parent.horizontalCenter
        }
        MaterialText {
            Layout.fillWidth: true
            wrapMode: Text.Wrap
            horizontalAlignment: Text.AlignJustify
            text: qsTr("текст текст текст текст текст текст текст текст текст текст текст текст текст " +
                       "текст текст текст текст тексттекст текст текст текст текст текст текст текст текст текст текст текст " +
                       "текст текст текст текст тексттекст текст текст текст текст текст текст текст текст текст текст текст ")
        }
        RowLayout {
            spacing: 7
            Text {
                id: falseText
                font.pointSize: 16
                color: Material.color(Material.Teal)
                text: qsTr("Ложь")
            }
            Flickable {
                Layout.preferredHeight: falseText.height
                Layout.fillWidth: true
                ScrollBar {
                    width: parent.width
                    orientation: Qt.Horizontal
                    size: 0.5
                    policy: ScrollBar.AlwaysOn
                    snapMode: ScrollBar.SnapOnRelease
                    stepSize: 1
                    HoverHandler {
                        cursorShape: Qt.SizeHorCursor
                    }
                }
                onFlickEnded: {

                }
            }
            Text {
                id: trueText
                font.pointSize: 16
                color: Material.color(Material.Grey)
                text: qsTr("Правда")
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
