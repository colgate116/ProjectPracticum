import QtQuick 2.15
import QtQuick.Controls.Material
import "../../Component"

Item {
    Column{
        id: uniInfo
        anchors.right: parent.right
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.topMargin: 40
        spacing: 10

        Repeater{
            model: [
                qsTr("МИНИСТЕРСТВО ЦИФРОВОГО РАЗВИТИЯ, СВЯЗИ И МАССОВЫХ КОММУНИКАЦИЙ РОССИЙСКОЙ ФЕДЕРАЦИИ"),
                qsTr("Ордена Трудового Красного Знамени федеральное государственное бюджетное образовательное учреждение высшего образования"),
                qsTr("«Московский технический университет связи и информатики»"),
                qsTr("Кафедра «Информатика»"),
                qsTr("Дисциплина \"Проектный практикум\""),
                qsTr("Проектная работа"),
                qsTr("по теме: "),
                qsTr("\n«Инновационно-технологическая трансформация промышленности в"),
                qsTr("в регионах России как инструмент достижения стратегических целей на пути"),
                qsTr("становления цифровой экономики»")
            ]
            MaterialText{
                width: parent.width
                horizontalAlignment:Text.AlignHCenter
                anchors.horizontalCenter:parent.horizontalCenter
                text: modelData
                wrapMode: Text.WordWrap
            }
        }
    }

    Column{
        anchors.top: uniInfo.bottom
        anchors.topMargin: (parent.height-uniInfo.height)/5
        anchors.right: parent.right
        anchors.rightMargin: parent.width/20
        spacing: 10
        Repeater{
            model:[
                qsTr("Выполнил: студент гр.БЭИ2301\nШаврин Н.Д."),
                qsTr("Проверил: доцент кафедры \"Информатика\"\nГуриков.С.Р")
            ]
            MaterialText{
                anchors.right: parent.right
                horizontalAlignment: Text.AlignRight
                text: modelData
            }
        }
    }


    MaterialText{
        anchors.bottomMargin: 7
        width:parent.width
        anchors.bottom: parent.bottom
        anchors.horizontalCenter:parent.horizontalCenter
        horizontalAlignment:Text.AlignHCenter
        text:qsTr("Москва, 2024")
    }

}
