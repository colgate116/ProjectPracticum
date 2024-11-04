import QtQuick 2.15
import QtQuick.Controls

import "EnteryActivity"


Window {
    height: 1200
    width: 900
    minimumHeight: 650
    minimumWidth: 700
    id: window
    visible: true
    visibility: Window.Maximized
    title: qsTr("Программа для тестирования")

    EnteryActivity {

    }

    // SwipeView{
    //     id: view// для связи с PageIndicator
    //     focus: true
    //     anchors.fill:parent

    //     onCurrentIndexChanged: {
    //             if (currentIndex === 1) {
    //                 interactive = false;
    //                 indicator.visible = false
    //             }
    //         }

    //     //страница 1
    //     Item{
    //         Title{
    //             anchors.fill: parent
    //             anchors.margins: 17
    //             anchors.bottomMargin: 23
    //         }
    //     }

    //     //страница 2
    //     Item{
    //     }
    // }

    // PageIndicator {
    //    anchors.bottomMargin: 5
    //    id: indicator
    //    count: view.count       // количество страниц
    //    currentIndex: view.currentIndex // текущая страница
    //    anchors.bottom: view.bottom
    //    anchors.horizontalCenter: parent.horizontalCenter
    // }
}
