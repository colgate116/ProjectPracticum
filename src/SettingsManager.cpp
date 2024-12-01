#include "SettingsManager.h"

SettingsManager::SettingsManager( QObject *parent ): QObject( parent )
{
    loadSettings();
}

void SettingsManager::setSkipAutorization( const bool skip )
{
    skipAutorization_ = skip;
    emit skipAutorizationChanged();
}

bool SettingsManager::skipAutorization() const noexcept
{
    return skipAutorization_;
}

void SettingsManager::setUserName( const QString user )
{
    currentUser = user;
    emit userNameChanged();
}

QString SettingsManager::userName() const noexcept
{
    return currentUser;
}

void SettingsManager::loadSettings()
{
    QSettings settings( "Settings.ini", QSettings::Format::IniFormat );
    settings.beginGroup( "autorization" );
    setSkipAutorization( settings.value( "skip_autoriztion" ).toBool() );
    setUserName( settings.value( "user_name" ).toString() );
    settings.endGroup();
}

void SettingsManager::saveSkipping()
{
    QSettings settings( "Settings.ini", QSettings::Format::IniFormat );
    settings.beginGroup( "autorization" );
    settings.setValue( "skip_autoriztion", skipAutorization_ );
    settings.setValue( "user_name", currentUser );
    settings.endGroup();
}
