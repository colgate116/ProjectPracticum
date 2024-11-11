import QtQuick 2.15
import QtWebView
import QtQuick.Controls.Material
import QtQuick.Layouts

Item {
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
        anchors.top: theoryBar.bottom
        width: parent.width
        height: parent.height
        currentIndex: theoryBar.currentIndex
        WebView {
            id: webView
            url: Qt.resolvedUrl("C:/Users/Kolya/Documents/QtProjects/projectPracticum/html.html")
        }
        Rectangle {
            width: 100
            height: 100
            color: "red"

        }
        Item {

        }
    }
    Rectangle {
        z: -1
        anchors.fill: theoryStack
        color: Material.color( Material.Grey )
    }
}


