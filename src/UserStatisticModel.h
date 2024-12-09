#ifndef USERSTATISTICMODEL_H
#define USERSTATISTICMODEL_H

#include <QObject>
#include <QDebug>
#include <QAbstractListModel>

class UserStatisticModel: public QAbstractListModel
{
    Q_OBJECT
    Q_PROPERTY(QList<QVariantMap> content READ content WRITE setContent NOTIFY contentChanged FINAL)
public:

    enum Roles {
        TestDate = Qt::UserRole + 1,
        Mark,
        Question1,
        Question2,
        Question3,
        Question4,
        Question5,
        Question6,
        Question7,
        Question8,
        Question9,
        Question10,
        RightAnswers,
        WrongAnswers
    };
    explicit UserStatisticModel( QObject* parent = nullptr );
    virtual int rowCount(const QModelIndex &parent) const override;
    virtual QVariant data(const QModelIndex &index, int role) const override;
    virtual QHash<int, QByteArray> roleNames() const override;
    QList<QVariantMap> content();
    void setContent( QList<QVariantMap> model );
signals:
    void contentChanged();
private:
    QList<QVariantMap> modelData;
};

#endif // USERSTATISTICMODEL_H
