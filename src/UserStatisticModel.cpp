#include "UserStatisticModel.h"

UserStatisticModel::UserStatisticModel( QObject* parent ): QAbstractListModel( parent )
{

}

int UserStatisticModel::rowCount( const QModelIndex& parent ) const
{
    if ( parent.isValid() )
    {
        return 0;
    }
    return modelData.size();
}

QVariant UserStatisticModel::data( const QModelIndex& index, int role ) const
{
    if (!(modelData[index.row()].contains("q1") && modelData[index.row()].contains("q2") && modelData[index.row()].contains("q3") &&
        modelData[index.row()].contains("q4") && modelData[index.row()].contains("q5") && modelData[index.row()].contains("q6") &&
        modelData[index.row()].contains("q7") && modelData[index.row()].contains("q8") && modelData[index.row()].contains("q9") &&
          modelData[index.row()].contains("q10") && modelData[index.row()].contains("date"))
        )
    {
        qDebug() << "Error: modelError";
        return QVariant();
    }
    int mark;
    int rightAnswers = 0;
    int wrongAnswers = 10;
    if ( modelData[index.row()]["q1"] == 1 ) {
        rightAnswers ++;
        wrongAnswers --;
    }
    if ( modelData[index.row()]["q2"] == 1 ) {
        rightAnswers ++;
        wrongAnswers --;
    }
    if ( modelData[index.row()]["q3"] == 1 ) {
        rightAnswers ++;
        wrongAnswers --;
    }
    if ( modelData[index.row()]["q4"] == 1 ) {
        rightAnswers ++;
        wrongAnswers --;
    }
    if ( modelData[index.row()]["q5"] == 1 ) {
        rightAnswers ++;
        wrongAnswers --;
    }
    if ( modelData[index.row()]["q6"] == 1 ) {
        rightAnswers ++;
        wrongAnswers --;
    }
    if ( modelData[index.row()]["q7"] == 1 ) {
        rightAnswers ++;
        wrongAnswers --;
    }
    if ( modelData[index.row()]["q8"] == 1 ) {
        rightAnswers ++;
        wrongAnswers --;
    }
    if ( modelData[index.row()]["q9"] == 1 ) {
        rightAnswers ++;
        wrongAnswers --;
    }
    if ( modelData[index.row()]["q10"] == 1 ) {
        rightAnswers ++;
        wrongAnswers --;
    }
    if ( rightAnswers > 9 )
        mark = 5;
    else if ( rightAnswers > 6 )
        mark = 4;
    else if ( rightAnswers > 5 )
        mark = 3;
    else
        mark = 2;
    if ( !index.isValid() )
    {
        return QVariant();
    }
    switch ( role )
    {
    case TestDate:
        return modelData[index.row()]["date"];
    case Mark:
        return mark;
    case Question1:
        return modelData[index.row()]["q1"];
    case Question2:
        return modelData[index.row()]["q2"];
    case Question3:
        return modelData[index.row()]["q3"];
    case Question4:
        return modelData[index.row()]["q4"];
    case Question5:
        return modelData[index.row()]["q5"];
    case Question6:
        return modelData[index.row()]["q6"];
    case Question7:
        return modelData[index.row()]["q7"];
    case Question8:
        return modelData[index.row()]["q8"];
    case Question9:
        return modelData[index.row()]["q9"];
    case Question10:
        return modelData[index.row()]["q10"];
    case RightAnswers:
        return rightAnswers;
    case WrongAnswers:
        return wrongAnswers;
    default:
        return QVariant();
    }
}

QHash<int, QByteArray> UserStatisticModel::roleNames() const
{
    QHash<int, QByteArray> roles = QAbstractListModel::roleNames();
    roles[TestDate] = "date";
    roles[Mark] = "mark";
    roles[Question1] = "question1";
    roles[Question2] = "question2";
    roles[Question3] = "question3";
    roles[Question4] = "question4";
    roles[Question5] = "question5";
    roles[Question6] = "question6";
    roles[Question7] = "question7";
    roles[Question8] = "question8";
    roles[Question9] = "question9";
    roles[Question10] = "question10";
    return roles;
}

QList<QVariantMap> UserStatisticModel::content()
{
    return modelData;
}

void UserStatisticModel::setContent( QList<QVariantMap> model )
{
    beginResetModel();
    modelData = model;
    endResetModel();
    emit contentChanged();
}

