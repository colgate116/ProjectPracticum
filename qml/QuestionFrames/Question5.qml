import QtQuick 2.15
import QtQuick.Controls.Material
import QtQuick.Layouts
import "../Component"

Item {
    id: root

    ColumnLayout {
        anchors {
            top: parent.top
            topMargin: 50
            left: parent.left
            leftMargin: 20
            right: parent.right
            rightMargin: 20
        }
        BoxFrame {
            Layout.fillWidth: true
            Layout.preferredHeight: 160
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
                delegate:
                    MaterialText {
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
            model: 4
            ColumnLayout {
                spacing: -5
                MaterialText {
                    text: qsTr("Текст текст текст текст")
                }
                RowLayout {
                    CustomTextField {
                        id: answerField
                        Layout.preferredHeight: 38
                        Layout.fillWidth: true
                        readOnly: true
                    }
                    Button {
                        property bool selected: false
                        text: qsTr("Внести")
                        HoverHandler {
                            cursorShape: Qt.PointingHandCursor
                        }
                        onReleased: {
                            selected = !selected
                            if ( selected )
                            {
                                answerField.text = list.model.get( list.currentIndex ).ans
                                text = qsTr("Убрать")
                                list.model.remove( list.currentIndex )
                            }
                            else
                            {
                                list.model.append( {"ans": answerField.text} )
                                answerField.text = ""
                                text = qsTr("Внести")
                            }

                        }
                    }
                }
            }
        }

    }
    SaveButton {

    }
}
