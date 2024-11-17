#ifndef SQLITEDATABASE_H
#define SQLITEDATABASE_H

#include <QObject>
#include <QtSql/QSqlDatabase>
#include <QDebug>
#include <QSqlError>
#include <QSqlQuery>

class SqliteDataBase
{
public:
    SqliteDataBase();

    void create();
    void open();
    void close();
private:
    void createTable( const QString query );
    QSqlDatabase db;


};

#endif // SQLITEDATABASE_H
