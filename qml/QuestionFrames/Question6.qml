import QtQuick 2.15
import QtQuick.Controls.Material
import "../Component"
import "../NavigationActivity/NavigationFrame"
import QtQuick.Layouts


Item {
    property var answersRB: [qsTr("Высокая стоимость услуги"),
        qsTr("Риск потери конфиденциаль-\nной информации"),
        qsTr("Появление возможности высо-\nкой динамики развития"),
        qsTr("Увелечение сложности техноло-\nгии производства")]
    property int answerRB: 1
    property int userAnswerRB: -1

    property var checkedArray: [0, 0, 0, 0]
    property var answersCh: [qsTr("Снижение численности\nперсонала предприятия"),
        qsTr("Снижение себестоимости\nза счет снижения издержек"),
        qsTr("Улучшение качества изделия"),
        qsTr("Уменьшение зависимости от\nсторонних исполнителей")]
    property var answerCh: [1, 1, 0, 0]

    TaskText {
        id: task
        text: qsTr("Преимущества и недостатки аутсорсинга")
        anchors {
            top: parent.top
            topMargin: 20
        }
    }
    SwipeView {
        id: view
        clip: true
        width: 350
        height: 360
        anchors {
            top: task.bottom
            topMargin: 20
            horizontalCenter: parent.horizontalCenter
        }
        ColumnLayout {
            MaterialText {
                font.pointSize: 15
                text: qsTr("Недостатки")
            }
            Repeater {
                model: answersRB
                RadioButton {
                    text: (model.index + 1) + ") " + modelData
                    font.pointSize: 14
                    HoverHandler {
                        cursorShape: Qt.PointingHandCursor
                    }
                    onReleased: {
                        if (userAnswerRB === model.index) {
                            return
                        }
                        answerNotSaved()
                        userAnswerRB = model.index
                        rbAnswer.text = modelData.replace('\n', ' ').replace("- ", '')
                    }
                }
            }
        }
        ColumnLayout {
            MaterialText {
                text: qsTr("Преимущества")
            }
            Repeater {
                model: answersCh
                CheckBox {
                    text: (model.index + 1) + ") " + modelData
                    font.pointSize: 15
                    HoverHandler {
                        cursorShape: Qt.PointingHandCursor
                    }
                    onCheckStateChanged: {
                        answerNotSaved()
                        if (checked) {
                            checkedArray[index] = 1
                        }
                        else {
                            checkedArray[index] = 0
                        }
                        cbAnswer.text = convertToAnswer()
                    }
                }
            }
        }
    }

    PageIndicator {
        id: indicator
        count: view.count
        currentIndex: view.currentIndex
        anchors.top: view.bottom
        anchors.horizontalCenter: parent.horizontalCenter
    }

    BoxFrame {
        width: Math.min( 600, parent.width - 10)
        anchors {
            top: indicator.bottom
            bottom: saveBtn.top
            margins: 10
            horizontalCenter: parent.horizontalCenter
        }
        ColumnLayout {
            anchors.left: parent.left
            anchors.leftMargin: 2
            width: parent.width
            MaterialText {
                text: qsTr("Недостатки аутсорсинга:")
            }
            MaterialText {
                id: rbAnswer
                wrapMode: Text.Wrap
                Layout.fillWidth: true
                clip: true
            }
            MaterialText {
                text: qsTr("Преимущества аутсорсинга:")
            }
            MaterialText {
                wrapMode: Text.Wrap
                id: cbAnswer
            }
        }
    }

    SaveButton {
        id: saveBtn
        onPushed: {
            if ( answerRB === userAnswerRB && compareAnswers() ) {
                rightAnswer()
                console.log(1)
            }
            else
            {
                console.log(2)
                wrongAnswer()
            }
        }
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
    function compareAnswers() {
        for (let i = 0; i < 4; i++) {
            if (answerCh[i] !== checkedArray[i]) {
                return false;
            }
        }
        return true;
    }
}
