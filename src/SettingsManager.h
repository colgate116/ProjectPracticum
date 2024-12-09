#ifndef SETTINGSMANAGER_H
#define SETTINGSMANAGER_H

#include <QObject>
#include <QSettings>
#include <QDebug>
#include <QFile>

class SettingsManager: public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool skipAutorization READ skipAutorization WRITE setSkipAutorization NOTIFY skipAutorizationChanged FINAL)
    Q_PROPERTY(QString userName READ userName WRITE setUserName NOTIFY userNameChanged FINAL)
    Q_PROPERTY(int theme READ theme WRITE setTheme NOTIFY themeChanged FINAL)
public:
    explicit SettingsManager(QObject *parent = nullptr);
    void setSkipAutorization( const bool skip );
    bool skipAutorization() const noexcept;
    void setUserName( const QString name );
    QString userName() const noexcept;
    void setTheme( const int theme );
    int theme() const noexcept;
    void loadSettings();
    Q_INVOKABLE void saveTheme();
    Q_INVOKABLE void saveSkipping();
signals:
    void skipAutorizationChanged();
    void userNameChanged();
    void themeChanged();
private:
    bool skipAutorization_ = false;
    QString currentUser = "";
    int theme_ = 0;

};

#endif // SETTINGSMANAGER_H
