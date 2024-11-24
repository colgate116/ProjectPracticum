#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QCoreApplication>

#include "SqliteDataBase.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute( Qt::AA_ShareOpenGLContexts );

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    const QUrl url("qrc:/path/qml/MainActivity.qml"); // ссылка на файл qml
    engine.load(url);   // загружаем файл qml

    SqliteDataBase db;
    db.create();
    QObject::connect(&app, SIGNAL( aboutToQuit() ), &db, SLOT ( close() ) );
    return app.exec();
}
