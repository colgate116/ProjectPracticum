import QtQuick 2.15
import QtQuick.Layouts
import QtQuick.Controls.Material
import "Component"
import "QuestionFrames"
import "NavigationActivity"

Item {
    id: testFrame

    property var answeredQuestions: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    property var answerRes: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

    signal rightAnswer()
    signal wrongAnswer()

    signal saveAnswer()
    signal answerNotSaved()

    signal finishTest()

    property int selectedQuestion: 0

    Pane {
        anchors.fill: parent
    }

    Flickable {
        id: flickable
        width: contentWidth <= parent.width ? contentWidth : parent.width
        height: 40
        clip: true
        contentWidth: taskNumRow.width
        flickDeceleration: Flickable.HorizontalFlick
        boundsBehavior: Flickable. StopAtBounds
        anchors.horizontalCenter: parent.horizontalCenter
        RowLayout {

            id: taskNumRow
            Repeater {
                model: 10
                TextButton {
                    Layout.preferredWidth: 40
                    Layout.preferredHeight: 40
                    btnText.text: index + 1
                    btnText.font.pointSize: 20
                    btnText.color: selectedQuestion === index ? "White" : Material.color(Material.Grey)
                    background: Rectangle {
                        radius: 5
                        anchors.fill: parent
                        color: Material.color( Material.Teal )
                        opacity: if (hovered)
                                    return 0.4
                                else if (index === selectedQuestion)
                                    return 0.3
                                else
                                     if (answeredQuestions[index] === 1)
                                         return 0.1
                                    else
                                        return 0
                    }
                    onReleased: {
                        selectedQuestion = index
                        swipeView.currentIndex = selectedQuestion
                    }
                }
            }
        }
    }
    ProgressBar {
        id: timeLine
        width: parent.width
        from: 0
        to: 60*15 // 15 min
        anchors.top: flickable.bottom
    }
    Timer {
        id: timer
        interval: 1000
        running: true
        repeat: true
        onTriggered: {
            timeLine.value += 1
        }
    }
    StackLayout {
        id: swipeView
        anchors {
            right: parent.right
            left: parent.left
            bottom: parent.bottom
            top: timeLine.bottom
        }
        Question1 {
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
        Question2 {
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
        Question3 {
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
        Question4 {
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
        Question5 {
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
        Question6 {
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
        Question7 {
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
        Question8 {
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
        Question9 {
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
        Question10 {
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
        EndTestFrame {
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
    }
    Component.onCompleted: {
        timer.start()
    }
    onAnswerNotSaved: {
        testFrame.answeredQuestions[swipeView.currentIndex] = 0
    }
    onSaveAnswer: {
        testFrame.answeredQuestions[swipeView.currentIndex] = 1
        swipeView.currentIndex ++
        selectedQuestion = swipeView.currentIndex
    }
    onRightAnswer: {
        answerRes[swipeView.currentIndex] = 1
    }
    onWrongAnswer: {
        answerRes[swipeView.currentIndex] = 0
    }
    onFinishTest: {
        stack.pop()
        testFinished()
    }
}
