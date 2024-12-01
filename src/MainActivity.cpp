#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QCoreApplication>

#include "SqliteDataBase.h"
#include "SettingsManager.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute( Qt::AA_ShareOpenGLContexts );
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;

    qmlRegisterType<SqliteDataBase>( "app", 1, 0, "DataBase" );
    qmlRegisterType<SettingsManager>( "app", 1, 0, "SettingsManager" );

    const QUrl url("qrc:/path/qml/MainActivity.qml"); // ссылка на файл qml
    engine.load(url);   // загружаем файл qml

    return app.exec();
}
