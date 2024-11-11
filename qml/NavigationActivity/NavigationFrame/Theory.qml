import QtQuick 2.15
import QtWebView

Item {
    WebView {
        id: webView
        url: Qt.resolvedUrl("C:/Users/Kolya/Documents/QtProjects/projectPracticum/html.html")
        anchors.fill: parent
    }
}
