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
public:
    explicit SettingsManager(QObject *parent = nullptr);
    void setSkipAutorization( const bool skip );
    bool skipAutorization() const noexcept;
    void setUserName( const QString name );
    QString userName() const noexcept;
    void loadSettings();
    Q_INVOKABLE void saveSkipping();
signals:
    void skipAutorizationChanged();
    void userNameChanged();
private:
    bool skipAutorization_ = false;
    QString currentUser = "";
};

#endif // SETTINGSMANAGER_H
