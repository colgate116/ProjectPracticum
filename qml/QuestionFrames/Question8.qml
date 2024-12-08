import QtQuick 2.15
import QtQuick.Controls.Material
import "../Component"
import QtQuick.Layouts


Item {
    property int answer: 2014
    property int userAnswer: slider.value

    ColumnLayout {
        width: Math.min( 450, parent.width - 10)
        spacing: 5
        anchors {
            top: parent.top
            topMargin: 200
            horizontalCenter: parent.horizontalCenter
        }
        MaterialText {
            Layout.fillWidth: true
            wrapMode: Text.Wrap
            horizontalAlignment: Text.AlignJustify
            text: qsTr("Укажите год, начала санкционной политики запада в сторону РФ, согласно которой Bloomberg составило экономическую модель, которая демонстрирует разницу фактического и потенциального роста ВВП РФ в 10%, начиная с переода санкционных мер по настоящее время.")
        }
        Slider {
            id: slider
            Layout.fillWidth: true
            value: 2017
            from: 2010
            to: 2024
            snapMode: Slider.SnapAlways
            stepSize: 1
            onMoved: {
                answerNotSaved()
                answer8.text = qsTr("Выбранный ответ: " ) + Math.round(value)
            }
        }
        MaterialText {
            id: answer8
            Layout.fillWidth: true
            text: qsTr("Выбранный ответ: " ) + slider.value
        }

    }
    SaveButton {
        onPushed: {
            if ( answer === userAnswer ) {
                rightAnswer()
            }
            else
            {
                wrongAnswer()
            }
        }
    }
}
