import QtQuick 2.15
import QtQuick.Controls.Material
import "../Component"
import "../NavigationActivity/NavigationFrame"
import QtQuick.Layouts


Item {
    property var answersRB: [qsTr("Увеличение добычи и экспорта\nуглеводородов"),
        qsTr("Рост российского несырьевого\nэкспорта"),
        qsTr("Привлечение иностранных\nинвестиций"),
        qsTr("Увелечение импорта товаров\nдружественных стран")]
    property int answerRB: 1
    property int userAnswerRB: -1

    property var checkedArray: [0, 0, 0, 0]
    property var answersCh: [qsTr("Риск развития"),
        qsTr("Риск дефолта"),
        qsTr("Риск природной катастрофы"),
        qsTr("Финансовый риск")]
    property var answerCh: [1, 1, 1, 1]

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
                        rbAnswer.text = modelData.replace('\n', ' ')
                    }
                }
            }
        }
        ColumnLayout {
            MaterialText {
                text: qsTr("Преимущества")
            }
            Repeater {
                model: answerCh
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
                        cbAnswer.text = "kmfklmsdkvlv;"
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
    }
}
