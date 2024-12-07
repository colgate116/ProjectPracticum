cmake_minimum_required(VERSION 3.16)

project(projectPracticum LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Добавляем пакет Quick
find_package(Qt6 6.5 REQUIRED COMPONENTS Quick)
find_package(Qt6 6.5 REQUIRED COMPONENTS WebView)
find_package(Qt6 REQUIRED COMPONENTS Sql)

qt_standard_project_setup()

# Определяем компилируемые файлы
qt_add_executable(projectPracticum
    src/MainActivity.cpp
)

# Добавляем файлы qml
qt_add_qml_module(projectPracticum
    URI path      # ссылка, по которой будут загружаться файлы qml
    VERSION 1.0

    SOURCES
    src/SettingsManager.h src/SettingsManager.cpp
    src/SqliteDataBase.h src/SqliteDataBase.cpp

    QML_FILES
    qml/Component/BoxFrame.qml
    qml/Component/CustomTextField.qml
    qml/Component/ImgButton.qml
    qml/Component/MaterialText.qml
    qml/Component/SaveButton.qml
    qml/Component/TaskText.qml
    qml/Component/TextButton.qml

    qml/EnteryActivity/EnteryActivity.qml
    qml/EnteryActivity/RegistrationFragment.qml
    qml/EnteryActivity/SignInFragment.qml

    qml/NavigationActivity/NavigationActivity.qml
    qml/NavigationActivity/NavigationSideBar.qml

    qml/NavigationActivity/NavigationFrame/TestStartFrame.qml
    qml/NavigationActivity/NavigationFrame/Theory.qml
    qml/NavigationActivity/NavigationFrame/Title.qml

    qml/QuestionFrames/Question1.qml
    qml/QuestionFrames/Question2.qml
    qml/QuestionFrames/Question3.qml
    qml/QuestionFrames/Question4.qml
    qml/QuestionFrames/Question5.qml
    qml/QuestionFrames/Question6.qml
    qml/QuestionFrames/Question7.qml
    qml/QuestionFrames/Question8.qml
    qml/QuestionFrames/Question9.qml
    qml/QuestionFrames/Question10.qml

    qml/MainActivity.qml
    qml/TestFrame.qml

    RESOURCES
    imgs/MTUCI.jpg
    imgs/navigationBarIcon.svg
)

target_link_libraries(projectPracticum
    PRIVATE Qt6::Quick
    PRIVATE Qt6::WebView
    PRIVATE Qt6::Sql
)

include(GNUInstallDirs)
install(TARGETS projectPracticum
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
