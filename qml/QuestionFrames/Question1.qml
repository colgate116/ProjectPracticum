import QtQuick 2.15
import QtQuick.Controls.Material
import "../Component"
import QtQuick.Layouts

/*
Введение санкций, несмотря на ряд отрицательных последствий для экономики страны,
в отношении которой они вводятся, позволяет выявить скрытый экономический потенциал
в различных ее отраслях, мобилизовать имеющиеся ресурсы и направить их на развитие
национальной конкурентоспособной экономики. В этой связи становится весьма актуальной
политика импортозамещения, т.е. производство отечественных аналогов зарубежных товаров.
*/


Item {
    property string answer: "импортозамещения"
    property string userAnswer: ""
    ColumnLayout {
        width: Math.min( 450, parent.width - 10)
        spacing: -2
        anchors {
            top: parent.top
            topMargin: 130
            horizontalCenter: parent.horizontalCenter
        }
        MaterialText {
            Layout.fillWidth: true
            wrapMode: Text.Wrap
            horizontalAlignment: Text.AlignJustify
            text: qsTr("Введение санкций, несмотря на ряд отрицательных последствий для экономики страны,в отношении которой они вводятся, позволяет выявить скрытый экономический потенциал в различных ее отраслях, мобилизовать имеющиеся ресурсы и направить их на развитие национальной конкурентоспособной экономики. В этой связи становится весьма актуальной политика ***, т.е. производство отечественных аналогов зарубежных товаров.")
        }
        RowLayout {
            MaterialText {
                wrapMode: Text.Wrap
                text: qsTr("Пропущенное слово: ")
            }
            CustomTextField {
                id: answerField
                Layout.preferredHeight: 50
                Layout.fillWidth: true
                font.pointSize: 14
                onTextChanged: {
                    answerNotSaved()
                }
            }
        }
    }
    SaveButton {
        onPushed: {
            userAnswer = answerField.text.trim().toLowerCase()
            if ( answer === answerField.text.trim().toLowerCase() ) {
                rightAnswer()
            }
            else
            {
                wrongAnswer()
            }
        }
    }
}
