import QtQuick 2.15
import QtQuick.Controls.Material
import "../Component"
import QtQuick.Layouts


Item {
    property bool answer: true
    property bool userAnswer: false

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
            text: qsTr("В условиях новой экономики усиливается научно-исследовательский компонент, что обеспечивает новое качество экономического роста, скорость которого определяется факторами государственно-политической природы.")
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
                ScrollBar.horizontal: ScrollBar {
                    anchors.centerIn: parent
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
                flickDeceleration: Flickable.HorizontalFlick
                contentWidth: width * 2
                onContentXChanged: {
                    answerNotSaved()
                    if (atXEnd) {
                        userAnswer = true
                        answer7.text = qsTr("Выбранный ответ: " ) + trueText.text
                        falseText.color = Material.color(Material.Grey)
                        trueText.color = Material.color(Material.Teal)
                        return
                    }
                    if (atXBeginning) {
                        userAnswer = false
                        answer7.text = qsTr("Выбранный ответ: " ) + falseText.text
                        falseText.color = Material.color(Material.Teal)
                        trueText.color = Material.color(Material.Grey)
                        return

                    }
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
            text: qsTr("Выбранный ответ: " ) + falseText.text
        }

    }
    SaveButton {
        onPushed: {
            if ( answer === userAnswer ) {
                rightAnswer()
            }
            else
            {
                wrongAnswer()
            }
        }
    }
}
