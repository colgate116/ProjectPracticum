import QtQuick 2.15
import QtQuick.Controls.Material
import QtQuick.Layouts
import "../Component"

Item {
    id: root
    property var answer: [1,0,2]
    property var userAnswer: [-1,-1,-1]

    TaskText {
        id: taskText5
        text: qsTr("Сопоставьте тип инфроструктуры с её описанием")
        anchors {
            top: parent.top
            topMargin: 20
        }
    }
    ColumnLayout {
        anchors {
            top: taskText5.bottom
            topMargin: 20
            left: parent.left
            leftMargin: 20
            right: parent.right
            rightMargin: 20
        }
        BoxFrame {
            Layout.fillWidth: true
            Layout.preferredHeight: 140
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
                            ansId: 0
                            ans: qsTr("Организационная инфраструктура")
                        }
                        ListElement {
                            ansId: 1
                            ans: qsTr("Экономическая инфраструктура")
                        }
                        ListElement {
                            ansId: 2
                            ans: qsTr("Общегосударственная инфраструктура")
                        }
                    }
                delegate:
                    MaterialText {
                        clip: true
                        height: 30
                        width: list.width
                        font.pointSize: 16
                        anchors.leftMargin: 5
                        text: ans
                        Rectangle {
                            id: bckGrnd
                            anchors.fill: parent
                            color: list.currentIndex === index ? Material.color(  Material.Teal ) : "transparent"
                            opacity: 0.2
                        }
                        MouseArea {
                            anchors.fill: parent
                            onReleased: {
                                list.currentIndex = index
                            }
                            HoverHandler {
                                cursorShape: Qt.PointingHandCursor
                            }
                        }
                    }
            }
        }
        Repeater {
            model: [
                qsTr("Развитие рыночных отношений, активизация предпринимательства, разработка выходных условий в налоговой политике для бизнеса"),
                qsTr("Государственное содействие развитию инноваций в целом и оказание кадровой поддержки в частности"),
                qsTr("Развитие инноваций на всех уровнях и для всех участников инновационного процесса")
            ]
            ColumnLayout {
                spacing: -2
                Layout.preferredWidth: parent.width
                MaterialText {
                    wrapMode: Text.Wrap
                    Layout.fillWidth: true
                    text: modelData
                }
                RowLayout {
                    CustomTextField {
                        id: answerField
                        Layout.preferredHeight: 38
                        Layout.fillWidth: true
                        readOnly: true
                    }
                    Button {
                        property int selectedId: -1
                        text: qsTr("Внести")
                        HoverHandler {
                            cursorShape: Qt.PointingHandCursor
                        }
                        onReleased: {
                            answerNotSaved()
                            if ( selectedId === -1 )
                            {
                                answerField.text = list.model.get( list.currentIndex ).ans
                                selectedId = list.model.get( list.currentIndex ).ansId
                                text = qsTr("Убрать")
                                list.model.remove( list.currentIndex )
                            }
                            else
                            {
                                list.model.append( {"ansId": selectedId, "ans": answerField.text} )
                                answerField.text = ""
                                text = qsTr("Внести")
                                selectedId = -1
                            }
                            userAnswer[model.index] = selectedId

                        }
                    }
                }
            }
        }

    }
    SaveButton {
        id: saveButton5
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
    function compareAnswers() {
        for (let i = 0; i < 3; i++) {
            if (answer[i] !== userAnswer[i]) {
                return false;
            }
        }
        return true;
    }
}
