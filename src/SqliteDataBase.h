#ifndef SQLITEDATABASE_H
#define SQLITEDATABASE_H

#include <QObject>
#include <QtSql/QSqlDatabase>
#include <QDebug>
#include <QSqlError>
#include <QSqlQuery>
#include <QObject>

class SqliteDataBase: public QObject
{
    Q_OBJECT
public:
    explicit SqliteDataBase(QObject *parent = nullptr);
    void create();
    Q_INVOKABLE void insertNewUser( const QString& user, const QString& password );
public slots:
    void close();
private:
    bool isUserUnique( const QString& name );
    void createTable( const QString query );
    void open();
    QSqlDatabase db;
};

#endif // SQLITEDATABASE_H
