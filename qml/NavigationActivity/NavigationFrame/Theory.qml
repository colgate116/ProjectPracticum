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
        Repeater {
            model: ["file:///path/1.html", "file:///path/2.html", "file:///path/3.html"]
                WebView {
                    id: webView
                    url: modelData
                }
        }
    }
    Rectangle {
        z: -1
        anchors.fill: theoryStack
        color: Material.color( Material.Grey )
    }
}


