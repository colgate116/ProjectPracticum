import QtQuick 2.15
import QtQuick.Controls.Material
import QtQuick.Layouts
import "../Component"

Item {
    id: root

    property var checkedArray: [0, 0, 0, 0]

    TaskText {
        text: qsTr("В связи с санкционной политикой западных стран главной целью развитие российской экономики является:")
        anchors {
            top: parent.top
            topMargin: 50
        }
    }
    ColumnLayout {
        width: Math.min( 450, parent.width - 10)
        anchors {
            top: parent.top
            topMargin: 200
            horizontalCenter: parent.horizontalCenter
        }
        spacing: 10
        BoxFrame {
            Layout.fillWidth: true
            Layout.preferredHeight: 250
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
                            ans: "kldsfjnsekflm"
                        }
                        ListElement {
                            ans: "kldsfjnsekflm1"
                        }
                        ListElement {
                            ans: "kldsfjnsekflm2"
                        }
                        ListElement {
                            ans: "kldsfjnsekflm3"
                        }
                    }
                delegate: CheckBox {
                    height: 50
                    text: (model.index + 1) + ") " + model.ans
                    font.pointSize: 14
                    HoverHandler {
                        cursorShape: Qt.PointingHandCursor
                    }
                    onCheckStateChanged: {
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
}
