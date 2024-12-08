import QtQuick 2.15
import QtQuick.Controls.Material
import "../Component"
import QtQuick.Layouts

/*
Несмотря на статус России как сырьевой державы, санкции затронули и нефтяную отрасль отечественной экономики. Проблемы, связанные с иностранным инвестированием нефтедобывающих предприятий в будущем: могут повлечь за собой сокращение добычи нефти.
*/

Item {
    property var answers: [
        qsTr("увелечение добычи"),
        qsTr("увелечение импорта"),
        qsTr("увелечение экспорта"),
        qsTr("сокращение добычи")
    ]
    property int answer: 3
    property int userAnswer: 0
    ColumnLayout {
        width: Math.min( 450, parent.width - 10)
        anchors {
            top: parent.top
            topMargin: 200
            horizontalCenter: parent.horizontalCenter
        }
        spacing: -2
        MaterialText {
            Layout.fillWidth: true
            wrapMode: Text.Wrap
            horizontalAlignment: Text.AlignJustify
            text: qsTr("Несмотря на статус России как сырьевой державы, санкции затронули и нефтяную отрасль отечественной экономики. Проблемы, связанные с иностранным инвестированием нефтедобывающих предприятий в будущем: могут повлечь за собой *** нефти.")
        }
        RowLayout {
            MaterialText {
                text: qsTr("Пропущенно слово: ")
                maximumLineCount: 30
            }
            ComboBox {
                Layout.fillWidth: true
                Layout.preferredHeight: 50
                font.pointSize: 16
                model: answers
                HoverHandler {
                    cursorShape: Qt.PointingHandCursor
                }
                onCurrentIndexChanged: {
                    if (userAnswer === currentIndex) {
                        return
                    }
                    userAnswer = currentIndex
                    answerNotSaved()
                }
            }
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
