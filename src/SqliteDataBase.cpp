#include "SqliteDataBase.h"

#define USERS_TABLE_NAME "users"
#define USER_NAME "user_name"
#define PASSWORD "password"
#define TESTS_TABLE_NAME "tests"
#define QUESTION_1 "question_1"
#define QUESTION_2 "question_2"
#define QUESTION_3 "question_3"
#define QUESTION_4 "question_4"
#define QUESTION_5 "question_5"
#define QUESTION_6 "question_6"
#define QUESTION_7 "question_7"
#define QUESTION_8 "question_8"
#define QUESTION_9 "question_9"
#define QUESTION_10 "question_10"
#define USER_STATISTIC_TABLE "users_statistic"
#define TEST_ID "test_id"
#define DATE "date"
#define USER_ID "user_id"

SqliteDataBase::SqliteDataBase() {}

void SqliteDataBase::create()
{
    db = QSqlDatabase::addDatabase("QSQLITE");
    db.setDatabaseName("data_base.db");
    db.setUserName("Nikolya");
    db.setPassword("Shavrin");

    open();

    QString createUsersTable = "create table " + QString(USERS_TABLE_NAME)
                               + " (id int primary key, " + QString(USER_NAME) + " varchar(100) not null unique, "
                               + QString(PASSWORD) + " varchar(100) not null unique )";
    QString createTestsTable = "create table " + QString(TESTS_TABLE_NAME)
                               + "( id int primary key, "
                               + QString(QUESTION_1) + "bool not null, "
                               + QString(QUESTION_2) + "bool not null, "
                               + QString(QUESTION_3) + "bool not null, "
                               + QString(QUESTION_4) + "bool not null, "
                               + QString(QUESTION_5) + "bool not null, "
                               + QString(QUESTION_6) + "bool not null, "
                               + QString(QUESTION_7) + "bool not null, "
                               + QString(QUESTION_8) + "bool not null, "
                               + QString(QUESTION_9) + "bool not null, "
                               + QString(QUESTION_10) + "bool not null ) ";
    QString createStatisticTable = "create table " + QString(USER_STATISTIC_TABLE)
                                   + "( id int primary key, "
                                   + QString(TEST_ID) + "int not null, "
                                   + QString(DATE) + "bool , "
                                   + QString(USER_ID) + "int not null,"
                                   + "FOREIGN KEY ( " + TEST_ID + " ) REFERENCES " + TESTS_TABLE_NAME + " ( id )"
                                   + "FOREIGN KEY ( " + USER_ID + " ) REFERENCES " + USERS_TABLE_NAME + " ( id ) ) ";

    createTable( createUsersTable );
    createTable( createTestsTable );
    createTable( createStatisticTable );

    close();
}

void SqliteDataBase::createTable( const QString query )
{
    QSqlQuery sql_query;
    sql_query.prepare( query );
    if( sql_query.exec() )
    {
        qDebug() << "Table was created";
    }
}

void SqliteDataBase::open() {
    if (!db.open())
    {
        qWarning() << "Error: Failed to connect database." << db.lastError();
    }
    else
    {
        qDebug() << "DataBase is opened";
    }

}

void SqliteDataBase::close() {
    db.close();
}

