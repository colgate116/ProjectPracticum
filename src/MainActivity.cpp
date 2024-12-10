#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QCoreApplication>
#include <QApplication>

#include "SqliteDataBase.h"
#include "SettingsManager.h"
#include "UserStatisticModel.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute( Qt::AA_ShareOpenGLContexts );
    //QGuiApplication app(argc, argv);
    QApplication app(argc, argv);
    QQmlApplicationEngine engine;

    qmlRegisterType<SqliteDataBase>( "app", 1, 0, "DataBase" );
    qmlRegisterType<SettingsManager>( "app", 1, 0, "SettingsManager" );
    qmlRegisterType<UserStatisticModel>( "app", 1, 0, "StatModel" );

    const QUrl url("qrc:/path/qml/MainActivity.qml"); // ссылка на файл qml
    engine.load(url);   // загружаем файл qml
    const int exec = QCoreApplication::exec();
    return exec;
}
