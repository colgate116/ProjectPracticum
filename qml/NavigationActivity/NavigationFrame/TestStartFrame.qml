import QtQuick 2.15
import QtQuick.Controls.Material
import "../../Component"
import QtQuick.Layouts

Item {
    MaterialText {
        width: Math.min( 800, parent.width )
        id: txt
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: parent.top
            topMargin: 200
        }
        horizontalAlignment: Text.AlignHCenter
        wrapMode: Text.Wrap
        text: qsTr("Перед выполнением ознакомьтись с теорией, во время выполнения она будет не доступна. Время отведенное на выполненте теста - 15 минут.")
    }
    Button {
        anchors {
            top: txt.bottom
            horizontalCenter: parent.horizontalCenter
            topMargin: 10
        }
        font.bold: true
        Material.foreground: "White"
        Material.background: Material.Teal
        text: qsTr("Начать")
        onReleased: {
            navigationStack.currentIndex = 3
            stack.push( "qrc:/path/qml/TestFrame.qml" )
        }
    }
}
