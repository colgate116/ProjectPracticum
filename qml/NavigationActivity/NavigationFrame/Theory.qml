import QtQuick 2.15
import QtQuick.Controls.Material
import QtQuick.Layouts

Item {
    id: root
    enabled: !navigationSideBar.visible
    TabBar {
        id: theoryBar
        width: parent.width
        Repeater {
            model: [qsTr("Первая глава"), qsTr("Вторая глава"), qsTr("Третья глава")]
            TabButton {
                text: modelData
            }
        }
    }
    StackLayout {
        id: theoryStack
        anchors {
            top: theoryBar.bottom
        }
        width: parent.width
        height: parent.height
        currentIndex: theoryBar.currentIndex
        Repeater {
            model: 3
            Flickable {
                id: flick
                clip: true
                contentHeight: column.height + 50
                contentWidth: column.width
                ColumnLayout {
                    id: column
                    Repeater {
                        model: switch (index)
                                {
                                case 0:
                                    return   [
                                "qrc:/path/imgs/theory/1/1.jpg",
                                "qrc:/path/imgs/theory/1/2.jpg",
                                "qrc:/path/imgs/theory/1/3.jpg",
                                "qrc:/path/imgs/theory/1/4.jpg",
                                "qrc:/path/imgs/theory/1/5.jpg",
                                "qrc:/path/imgs/theory/1/6.jpg",
                                "qrc:/path/imgs/theory/1/7.jpg",
                                "qrc:/path/imgs/theory/1/8.jpg",
                                "qrc:/path/imgs/theory/1/9.jpg",
                                "qrc:/path/imgs/theory/1/10.jpg",
                                "qrc:/path/imgs/theory/1/11.jpg"
                                ]
                                case 1:
                                    return [
                                "qrc:/path/imgs/theory/2/1.jpg",
                                "qrc:/path/imgs/theory/2/2.jpg",
                                "qrc:/path/imgs/theory/2/3.jpg",
                                "qrc:/path/imgs/theory/2/4.jpg",
                                "qrc:/path/imgs/theory/2/5.jpg",
                                "qrc:/path/imgs/theory/2/6.jpg",
                                "qrc:/path/imgs/theory/2/7.jpg",
                                "qrc:/path/imgs/theory/2/8.jpg",
                                "qrc:/path/imgs/theory/2/9.jpg"
                                            ]
                                default:
                                    return [
                                "qrc:/path/imgs/theory/3/1.jpg",
                                "qrc:/path/imgs/theory/3/2.jpg",
                                "qrc:/path/imgs/theory/3/3.jpg"
                                            ]
                                }

                        Image {
                            Layout.preferredHeight: root.width < 600 ? root.width * 10 / 6 : 1000
                            Layout.preferredWidth: Math.min(600, root.width)
                            source: modelData
                        }
                    }
                }
            }
        }
    }
    Rectangle {
        z: -1
        anchors.fill: theoryStack
        color: Material.color( Material.Grey )
    }
}


