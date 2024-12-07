import QtQuick 2.15
import QtQuick.Controls.Material


Item {
    Text {
        text: qsTr("Перед выполнением ознакомьтись с теорией, во время выполнения она будет не доступна. Время выполнения 0 минут")
    }
    Button {
        text: qsTr("start")
        onReleased: {
            stack.push( "qrc:/path/qml/TestFrame.qml" )
        }
    }
}
