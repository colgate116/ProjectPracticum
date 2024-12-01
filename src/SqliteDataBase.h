#ifndef SQLITEDATABASE_H
#define SQLITEDATABASE_H

#include <QObject>
#include <QtSql/QSqlDatabase>
#include <QDebug>
#include <QSqlError>
#include <QSqlQuery>
#include <QObject>
#include <QCryptographicHash>

class SqliteDataBase: public QObject
{
    Q_OBJECT
public:
    explicit SqliteDataBase(QObject *parent = nullptr);
    ~SqliteDataBase();
    void create();
    Q_INVOKABLE bool signIn( const QString& user, const QString& password );
    Q_INVOKABLE bool insertNewUser( const QString& user, const QString& password );
    Q_INVOKABLE bool isUserExists( const QString& name );
private:
    void createTable( const QString query );
    void open();
    void close();
    QSqlDatabase db;
};

#endif // SQLITEDATABASE_H
