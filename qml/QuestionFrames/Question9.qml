import QtQuick 2.15
import QtQuick.Controls.Material
import QtQuick.Layouts
import "../Component"

Item {
    id: root

    property var checkedArray: [0, 0, 0, 0]
    property var answer: [0,1,1,1]

    TaskText {
        id: taskText9
        text: qsTr("Для модернизации современных промышленных предприятий необходимо:")
        anchors {
            top: parent.top
            topMargin: 50
        }
    }
    ColumnLayout {
        width: Math.min( 450, parent.width - 10)
        anchors {
            top: taskText9.bottom
            topMargin: 70
            horizontalCenter: parent.horizontalCenter
        }
        spacing: 10
        BoxFrame {
            Layout.fillWidth: true
            Layout.preferredHeight: 400
            ListView {
                id: list
                header: TaskText {
                    text: qsTr("Варианты ответов:")
                }
                snapMode: ListView.SnapToItem
                anchors.margins: 2
                anchors.fill: parent
                interactive: false
                model: ListModel {
                        ListElement {
                            ans: "Покупка новейшего оборудования\nвысшего уровня"
                        }
                        ListElement {
                            ans: "Ввести проект согласование\nс иными планами работ"
                        }
                        ListElement {
                            ans: "Производить сопоставительную\nоценку расходов по модернизации\nс результатом от ввода оборудования"
                        }
                        ListElement {
                            ans: "Обеспечивать предприятие трудовыми\nресурсами"
                        }
                    }
                delegate: CheckBox {
                    clip: true
                    text: (model.index + 1) + ") " + model.ans
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
                        answer9.text = qsTr("Выбранный ответ: " ) + convertToAnswer()
                    }
                }
            }
        }
        MaterialText {
            id: answer9
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
