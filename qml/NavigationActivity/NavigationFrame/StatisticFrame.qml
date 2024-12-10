import QtQuick 2.15
import QtQuick.Controls.Material
import "../../Component"
import QtCharts
import QtQuick.Layouts

Item {
    ListView {
        interactive: !navigationSideBar.visible
        z: -1
        id: listView
        anchors.fill: parent
        model: statModel
        clip: true
        delegate: Item {
            height: Qt.platform.os === "android" ? 800 : 500
            width: listView.width
            Rectangle {
                anchors {
                    fill: parent
                    margins: 10
                }
                color: "transparent"
                radius: 10
                border.color: Material.color( Material.Grey )
                MaterialText {
                    id: dateText
                    anchors.top: parent.top
                    anchors.left: parent.left
                    anchors.leftMargin: 7
                    text: qsTr("Дата прохождения теста: ") + date
                }
                MaterialText {
                    id: markText
                    anchors {
                        right: parent.right
                        bottom: parent.bottom
                        margins: 7
                    }
                    font.pointSize: 18
                    text: qsTr("Оценка: ") + mark
                }
                RowLayout {
                    width: parent.width
                    anchors {
                        horizontalCenter: parent.horizontalCenter
                        top: dateText.bottom
                        bottom: markText.top
                    }
                    visible: Qt.platform.os !== "android"
                    ColumnLayout {
                        Layout.preferredHeight: 300
                        Layout.leftMargin:  50
                        Layout.preferredWidth: 200
                        Repeater {
                            model: [question1, question2, question3, question4, question5, question6, question7, question8, question9, question10, rightAnswers]
                            RowLayout {
                                Layout.fillWidth: true
                                Rectangle {
                                    Layout.preferredHeight: 30
                                    Layout.preferredWidth: 150
                                    border.color: switch( window.Material.theme ) {
                                                  case Material.Dark:
                                                      return "white"
                                                  case Material.Light:
                                                      return "black"
                                                  default:
                                                      return "black"
                                                 }
                                    color: "transparent"
                                    MaterialText {
                                        text: index === 10 ? qsTr("Итого:") : qsTr("Вопрос № ") + (index + 1)
                                        horizontalAlignment: Text.AlignHCenter
                                        anchors.centerIn: parent
                                    }
                                }
                                Rectangle {
                                    Layout.preferredHeight: 30
                                    Layout.preferredWidth: 100
                                    border.color: switch( window.Material.theme ) {
                                                  case Material.Dark:
                                                      return "white"
                                                  case Material.Light:
                                                      return "black"
                                                  default:
                                                      return "black"
                                                 }
                                    color: "transparent"
                                        MaterialText {
                                            text: modelData
                                            anchors.centerIn: parent
                                        }
                                    }
                            }
                        }
                    }
                    ChartView {
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                        enabled: false
                        legend.alignment: Qt.AlignBottom
                        legend.font.pointSize: 16
                        legend.labelColor: switch( window.Material.theme ) {
                                           case Material.Dark:
                                               return "white"
                                           case Material.Light:
                                               return "black"
                                           default:
                                               return "black"
                                          }
                        antialiasing: true
                        backgroundColor: "transparent"
                        PieSeries {
                            PieSlice { label: qsTr("Правильные ответы"); value: rightAnswers; color: Material.color( Material.Lime ) }
                            PieSlice { label: qsTr("Неправильные ответы"); value: wrongAnswers; color: Material.color( Material.Teal ) }
                        }
                    }
                }
                ColumnLayout {
                    width: parent.width
                    anchors {
                        top: dateText.bottom
                        topMargin: 10
                        bottom: markText.top
                    }
                    visible: Qt.platform.os === "android"
                    ColumnLayout {
                        Layout.preferredHeight: 300
                        Layout.preferredWidth: 200
                        Layout.alignment: Qt.AlignHCenter
                        Repeater {
                            model: [question1, question2, question3, question4, question5, question6, question7, question8, question9, question10, rightAnswers]
                            RowLayout {
                                Layout.fillWidth: true
                                Rectangle {
                                    Layout.preferredHeight: 30
                                    Layout.preferredWidth: 150
                                    border.color: switch( window.Material.theme ) {
                                                  case Material.Dark:
                                                      return "white"
                                                  case Material.Light:
                                                      return "black"
                                                  default:
                                                      return "black"
                                                 }
                                    color: "transparent"
                                    MaterialText {
                                        text: index === 10 ? qsTr("Итого:") : qsTr("Вопрос № ") + (index + 1)
                                        horizontalAlignment: Text.AlignHCenter
                                        anchors.centerIn: parent
                                    }
                                }
                                Rectangle {
                                    Layout.preferredHeight: 30
                                    Layout.preferredWidth: 100
                                    border.color: switch( window.Material.theme ) {
                                                  case Material.Dark:
                                                      return "white"
                                                  case Material.Light:
                                                      return "black"
                                                  default:
                                                      return "black"
                                                 }
                                    color: "transparent"
                                        MaterialText {
                                            text: modelData
                                            anchors.centerIn: parent
                                        }
                                    }
                            }
                        }
                    }
                    ChartView {
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                        enabled: false
                        legend.alignment: Qt.AlignBottom
                        legend.font.pointSize: 16
                        legend.labelColor: switch( window.Material.theme ) {
                                           case Material.Dark:
                                               return "white"
                                           case Material.Light:
                                               return "black"
                                           default:
                                               return "black"
                                          }
                        antialiasing: true
                        backgroundColor: "transparent"
                        PieSeries {
                            PieSlice { label: qsTr("Правильные ответы"); value: rightAnswers; color: Material.color( Material.Lime ) }
                            PieSlice { label: qsTr("Неправильные ответы"); value: wrongAnswers; color: Material.color( Material.Teal ) }
                        }
                    }
                }
            }
        }
    }
}

