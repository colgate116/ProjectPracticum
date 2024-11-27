#include "SqliteDataBase.h"

#define USERS_TABLE_NAME QString("users")
#define USER_NAME QString("user_name")
#define PASSWORD QString("password")
#define TESTS_TABLE_NAME QString("tests")
#define QUESTION_1 QString("question_1")
#define QUESTION_2 QString("question_2")
#define QUESTION_3 QString("question_3")
#define QUESTION_4 QString("question_4")
#define QUESTION_5 QString("question_5")
#define QUESTION_6 QString("question_6")
#define QUESTION_7 QString("question_7")
#define QUESTION_8 QString("question_8")
#define QUESTION_9 QString("question_9")
#define QUESTION_10 QString("question_10")
#define USER_STATISTIC_TABLE QString("users_statistic")
#define TEST_ID QString("test_id")
#define DATE QString("date")
#define USER_ID QString("user_id")

SqliteDataBase::SqliteDataBase( QObject *parent ): QObject( parent )
{

}

void SqliteDataBase::create()
{
    db = QSqlDatabase::addDatabase("QSQLITE");
    db.setDatabaseName("data_base.db.sqlite");
    db.setUserName("Nikolya");
    db.setPassword("Shavrin");

    open();

    QString createUsersTable = "CREATE TABLE IF NOT EXISTS " + USERS_TABLE_NAME
                               + " (id INTEGER primary key, " + USER_NAME + " TEXT NOT NULL UNIQUE, "
                               + PASSWORD + " TEXT NOT NULL )";
    QString createTestsTable = "CREATE TABLE IF NOT EXISTS " + TESTS_TABLE_NAME
                               + "( id INTEGER primary key, "
                               + QUESTION_1 + " INTEGER NOT NULL, "
                               + QUESTION_2 + " INTEGER NOT NULL, "
                               + QUESTION_3 + " INTEGER NOT NULL, "
                               + QUESTION_4 + " INTEGER NOT NULL, "
                               + QUESTION_5 + " INTEGER NOT NULL, "
                               + QUESTION_6 + " INTEGER NOT NULL, "
                               + QUESTION_7 + " INTEGER NOT NULL, "
                               + QUESTION_8 + " INTEGER NOT NULL, "
                               + QUESTION_9 + " INTEGER NOT NULL, "
                               + QUESTION_10 + " INTEGER NOT NULL ) ";
    QString createStatisticTable = "CREATE TABLE IF NOT EXISTS " + USER_STATISTIC_TABLE
                                   + "( id INTEGER primary key, "
                                   + TEST_ID + " INTEGER NOT NULL, "
                                   + DATE + " TEXT, "
                                   + USER_ID + " INTEGER NOT NULL,"
                                   + "FOREIGN KEY ( " + TEST_ID + " ) REFERENCES " + TESTS_TABLE_NAME + " ( id )"
                                   + "FOREIGN KEY ( " + USER_ID + " ) REFERENCES " + USERS_TABLE_NAME + " ( id ) ) ";
    createTable( createUsersTable );
    createTable( createTestsTable );
    createTable( createStatisticTable );
}

bool SqliteDataBase::signIn( const QString& user, const QString& password )
{
    QString queryText = "SELECT " + PASSWORD + " FROM " + USERS_TABLE_NAME + " WHERE " + USER_NAME + " = '" + user + "'";
    QCryptographicHash hash( QCryptographicHash::Sha256 );
    hash.addData( password.toUtf8() );
    QString hashedPassword = hash.result().toHex();
    QSqlQuery query;
    query.prepare( queryText );
    if ( !query.exec() )
    {
        qDebug()<<"Error:" << db.lastError();
        return false;
    }
    query.next();
    qDebug() << query.value(0);
    qDebug() << hashedPassword;
    qDebug() << (query.value(0).toString() == hashedPassword);
    return query.value(0).toString() == hashedPassword;
}

void SqliteDataBase::insertNewUser( const QString& user, const QString& password )
{
    QString queryText = "INSERT INTO " + USERS_TABLE_NAME + "( " +
                        USER_NAME + ", " + PASSWORD + " ) VALUES (:user, :password);";
    QSqlQuery query;
    query.prepare( queryText );
    query.bindValue( ":user", user );
    QCryptographicHash hash( QCryptographicHash::Sha256 );
    hash.addData( password.toUtf8() );
    QByteArray hashed = hash.result();
    query.bindValue( ":password", hashed.toHex() );
    if ( isUserUnique( user ) )
    {
        qDebug() << "Такой пользователь уже существует";
        return;
    }
    if ( query.exec() )
    {
        qDebug() << "Пользователь добавлен";
    }
    else
    {
        qDebug() << db.lastError();
    }
}

void SqliteDataBase::createTable( const QString query )
{
    QSqlQuery sql_query;
    sql_query.prepare( query );
    if( sql_query.exec() )
    {
        qDebug() << "Success: Table was created or found";
    }
    else
    {
       qWarning() << "Error: Failed to create table" << db.lastError();
    }
}

void SqliteDataBase::open() {
    if (!db.open())
    {
        qWarning() << "Error: Failed to connect database" << db.lastError();
    }
    else
    {
        qDebug() << "Success: DataBase is opened";
    }

}

void SqliteDataBase::close() {
    db.close();
    qDebug() << "Success: DataBase is closed";
}

bool SqliteDataBase::isUserUnique( const QString& name )
{
    QString queryText = "SELECT EXISTS ( SELECT " +
                        USER_NAME + " FROM " + USERS_TABLE_NAME +
                        " WHERE " + USER_NAME + " = '" + name + "' )";
    QSqlQuery query;
    query.prepare( queryText );
    if ( !query.exec() ) {
        qDebug()<<"Error:" << db.lastError();
        return false;
    }
    query.next();
    return query.value(0) != 0;
}

