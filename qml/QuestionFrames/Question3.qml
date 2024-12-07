import QtQuick 2.15
import QtQuick.Controls.Material
import "../Component"
import "../NavigationActivity/NavigationFrame"
import QtQuick.Layouts


Item {
    property var checkedArray: [0, 0, 0, 0]
    property var answers: [qsTr("Риск развития"),
        qsTr("Риск дефолта"),
        qsTr("Риск природной катастрофы"),
        qsTr("Финансовый риск")]
    property var answer: [1, 0, 0, 1]

    TaskText {
        text: qsTr("На сегодняшний день каждый российский бизнес сталкивается с рисками:")
        anchors {
            top: parent.top
            topMargin: 50
        }
    }
    ColumnLayout {
        width: 280
        spacing: 5
        anchors {
            top: parent.top
            topMargin: 200
            horizontalCenter: parent.horizontalCenter
        }
        Repeater {
            model: answers
            CheckBox {
                text: (model.index + 1) + ") " + modelData
                font.pointSize: 16
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
                    answer3.text = qsTr("Выбранный ответ: " ) + convertToAnswer()
                }
            }
        }
        MaterialText {
            id: answer3
            Layout.leftMargin: 8
            text: qsTr("Выбранный ответ: " )
        }

    }
    SaveButton {
        onPushed: {
            if ( compareAnswers() ) {
                rightAnswer()
            }
            else
            {
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
            if (answer[i] !== checkedArray[i]) {
                return false;
            }
        }
        return true;
    }
}
