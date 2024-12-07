import QtQuick 2.15
import QtQuick.Layouts
import QtQuick.Controls.Material
import "Component"
import "QuestionFrames"

Pane {
    id: testFrame

    signal saveAnswer
    property int selectedQuestion: 0

    Material.accent: Material.Teal

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
                        anchors.fill: parent
                        color: Material.color( Material.Teal )
                        opacity: if (hovered)
                                    return 0.4
                                else if (index === selectedQuestion)
                                    return 0.3
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
        // todo поменять цвет
        id: timeLine
        width: parent.width
        from: 0
        to: 60*30 // 30 min
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
    }
    Component.onCompleted: {
        timer.start()
    }

    onSaveAnswer: {
        swipeView.currentIndex ++
        selectedQuestion = swipeView.currentIndex
    }
}
