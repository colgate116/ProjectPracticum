import QtQuick 2.15

Rectangle{
    id: frame
    border.color: "black"
    border.width: 2

    Column{
        id: uniInfo
        anchors.right: frame.right
        anchors.left: frame.left
        anchors.top: frame.top
        anchors.topMargin: 10
        spacing: 10

        Repeater{
            model: [
                qsTr("МИНИСТЕРСТВО ЦИФРОВОГО РАЗВИТИЯ, СВЯЗИ И МАССОВЫХ КОММУНИКАЦИЙ РОССИЙСКОЙ ФЕДЕРАЦИИ"),
                qsTr("Ордена Трудового Красного Знамени федеральное государственное бюджетное образовательное учреждение высшего образования"),
                qsTr("«Московский технический университет связи и информатики»"),
                qsTr("Кафедра «Информатика»"),
                qsTr("Дисциплина \"Проектный практикум\""),
                qsTr("Практическая работа №1"),
                qsTr("Вариант 34")
            ]
            Text{
                width: parent.width
                horizontalAlignment:Text.AlignHCenter
                anchors.horizontalCenter:parent.horizontalCenter
                font.pointSize: 14
                font.family: "Calibri"
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
                qsTr("Проверил: доцент каф. \"Информатика\"\nГуриков.С.Р")
            ]
            Text{
                anchors.right: parent.right
                horizontalAlignment: Text.AlignRight
                font.pointSize: 14
                font.family: "Calibri"
                text: modelData
            }
        }
    }


    Text{
        anchors.bottomMargin: 7
        width:parent.width
        anchors.bottom: parent.bottom
        anchors.horizontalCenter:parent.horizontalCenter
        horizontalAlignment:Text.AlignHCenter
        text:qsTr("Москва, 2024")
        font.family: "Calibri"
        font.pointSize: 14
    }
}
