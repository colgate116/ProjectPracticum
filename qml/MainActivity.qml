import QtQuick 2.15
import QtQuick.Controls.Material

Window {
    height: 1200
    width: 900
    minimumHeight: 650
    minimumWidth: 700
    id: window
    visible: true
    visibility: Window.Maximized
    title: qsTr("Программа для тестирования")

    StackView {
        id: stack
        anchors.fill: parent
        initialItem: "qrc:/path/qml/EnteryActivity/EnteryActivity.qml"
    }
}
