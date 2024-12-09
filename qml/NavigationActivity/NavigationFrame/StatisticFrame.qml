import QtQuick 2.15
import QtQuick.Controls.Material
import "../../Component"

Item {
    ListView {
        id: listView
        anchors.fill: parent
        model: statModel
        clip: true
        delegate: ItemDelegate {
            height: 300
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
                    anchors.top: parent.top
                    anchors.left: parent.left
                    text: qsTr("Время прохождения теста: ") + date
                }
            }
        }
    }
}

