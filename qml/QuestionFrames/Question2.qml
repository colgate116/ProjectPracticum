import QtQuick 2.15
import QtQuick.Controls.Material
import "../Component"
import "../NavigationActivity/NavigationFrame"
import QtQuick.Layouts


Item {
    property var answers: [qsTr("Увеличение добычи и экспорта\nуглеводородов"),
        qsTr("Рост российского несырьевого\nэкспорта"),
        qsTr("Привлечение иностранных\nинвестиций"),
        qsTr("Увелечение импорта товаров\nдружественных стран")]
    property int answer: 1
    property int userAnswer: -1
    TaskText {
        id: task2
        text: qsTr("В связи с санкционной политикой западных стран главной целью развитие российской экономики является:")
        anchors {
            top: parent.top
            topMargin: 50
        }
    }
    ColumnLayout {
        width: 300
        spacing: 5
        anchors {
            top: task2.bottom
            topMargin: 50
            horizontalCenter: parent.horizontalCenter
        }
        Repeater {
            model: answers
            RadioButton {
                text: (model.index + 1) + ") " + modelData
                font.pointSize: 16
                HoverHandler {
                    cursorShape: Qt.PointingHandCursor
                }
                onReleased: {
                    if (userAnswer === model.index) {
                        return
                    }
                    answerNotSaved()
                    userAnswer = model.index
                    answer2.text = qsTr("Выбранный ответ: " ) + (model.index + 1)
                }
            }
        }
        MaterialText {
            id: answer2
            Layout.leftMargin: 10
            text: qsTr("Выбранный ответ: " )
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
