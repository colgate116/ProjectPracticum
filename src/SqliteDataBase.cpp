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
    create();
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
    query.last();
    return query.value(0).toString() == hashedPassword;
}

bool SqliteDataBase::insertNewUser( const QString& user, const QString& password )
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
    if ( isUserExists( user ) )
    {
        qDebug() << "Такой пользователь уже существует";
        emit userAlreadyExists();
        return false;
    }
    if ( query.exec() )
    {
        qDebug() << "Пользователь добавлен";
        return true;
    }
    else
    {
        qDebug() << db.lastError();
    }
    return false;
}

void SqliteDataBase::close() {
    db.close();
    qDebug() << "Success: DataBase is closed";
}

int SqliteDataBase::getUserIdByName( const QString& name )
{
    QString queryText = "SELECT id FROM " + USERS_TABLE_NAME + " WHERE " + USER_NAME + " = '" + name + "'";
    QSqlQuery query;
    query.prepare( queryText );
    query.exec();
    query.last();
    return query.value(0).toInt();
}

void SqliteDataBase::connectUserWithTest( const QString user, const int testId )
{
    int userId = getUserIdByName( user );
    QString queryText = "INSERT INTO " + USER_STATISTIC_TABLE + "( " +
                        TEST_ID + ", " + DATE + ", " + USER_ID +
                        " ) VALUES (:testId, :date, :userId);";
    QSqlQuery query;
    QString dateTime = QDateTime::currentDateTime().toString("hh:mm dd.MM.yyyy");
    query.prepare( queryText );
    query.bindValue( ":testId", testId );
    query.bindValue( ":date",  dateTime );
    query.bindValue( ":userId", userId );
    if ( query.exec() )
    {
        qDebug() << "Информация о пользователе дополнена";
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

bool SqliteDataBase::isUserExists( const QString& name )
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
    query.last();
    return query.value(0) != 0;
}

void SqliteDataBase::saveTest( const QVariantList& answers, const QString name )
{
    QString queryText = "INSERT INTO " + TESTS_TABLE_NAME + "( " +
                        QUESTION_1 + ", " + QUESTION_2 + ", " + QUESTION_3 + ", " + QUESTION_4 + ", " + QUESTION_5 + ", " + QUESTION_6 + ", " + QUESTION_7 + ", " + QUESTION_8 + ", " + QUESTION_9 + ", " + QUESTION_10 +
                        " ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
    QSqlQuery query;
    query.prepare( queryText );
    for ( int i = 0; i < 10; i++ )
    {
        query.bindValue( i, answers[i] );
    }
    query.exec();
    connectUserWithTest( name, query.lastInsertId().toInt() );
    emit testSaved();
}

QList<QVariantMap> SqliteDataBase::getUsetStat( const QString& user )
{
    int userId = getUserIdByName( user );
    QString queryText = "SELECT " + DATE + ", " + QUESTION_1 + ", " + QUESTION_2 + ", " + QUESTION_3 + ", " + QUESTION_4 + ", " + QUESTION_5
                        + ", " + QUESTION_6 + ", " + QUESTION_7 + ", " + QUESTION_8 + ", " + QUESTION_9 + ", " + QUESTION_10
                        + " FROM " + USER_STATISTIC_TABLE + " JOIN " + TESTS_TABLE_NAME + " ON " + USER_STATISTIC_TABLE + "." + TEST_ID
                        + " = " + TESTS_TABLE_NAME + ".id WHERE " + USER_ID + " = " + QString::number(userId);
    QSqlQuery query;
    query.prepare( queryText );
    if ( !query.exec() )
    {
        qDebug() << db.lastError();
        return QList<QVariantMap>();
    }
    QList<QVariantMap> statList;
    while ( query.next() )
    {
        QVariantMap stat;
        stat["date"] = query.value(0).toString();
        stat["q1"] = query.value(1).toInt();
        stat["q2"] = query.value(2).toInt();
        stat["q3"] = query.value(3).toInt();
        stat["q4"] = query.value(4).toInt();
        stat["q5"] = query.value(5).toInt();
        stat["q6"] = query.value(6).toInt();
        stat["q7"] = query.value(7).toInt();
        stat["q8"] = query.value(8).toInt();
        stat["q9"] = query.value(9).toInt();
        stat["q10"] = query.value(10).toInt();
        statList.push_front( stat );
    }
    return statList;
}

