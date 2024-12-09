#ifndef SQLITEDATABASE_H
#define SQLITEDATABASE_H

#include <QObject>
#include <QtSql/QSqlDatabase>
#include <QDebug>
#include <QSqlError>
#include <QSqlQuery>
#include <QObject>
#include <QCryptographicHash>
#include <QDateTime>

class SqliteDataBase: public QObject
{
    Q_OBJECT
public:
    explicit SqliteDataBase(QObject *parent = nullptr);
    void create();
    Q_INVOKABLE bool signIn( const QString& user, const QString& password );
    Q_INVOKABLE bool insertNewUser( const QString& user, const QString& password );
    Q_INVOKABLE bool isUserExists( const QString& name );
    Q_INVOKABLE void saveTest( const QVariantList& answers, const QString name );
    Q_INVOKABLE void close();
private:
    void createTable( const QString query );
    void open();
    int getUserIdByName( const QString name );
    void connectUserWithTest( const QString user, const int testId );
    QSqlDatabase db;
};

#endif // SQLITEDATABASE_H
