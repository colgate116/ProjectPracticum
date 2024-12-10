cmake_minimum_required(VERSION 3.16)

project(projectPracticum LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Добавляем пакет Quick
find_package(Qt6 6.5 REQUIRED COMPONENTS Quick)
find_package(Qt6 REQUIRED COMPONENTS Sql)
find_package(Qt6 6.5 REQUIRED COMPONENTS Widgets)

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
    src/UserStatisticModel.h src/UserStatisticModel.cpp

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

    qml/NavigationActivity/NavigationFrame/StatisticFrame.qml
    qml/NavigationActivity/NavigationFrame/TestStartFrame.qml
    qml/NavigationActivity/NavigationFrame/Theory.qml
    qml/NavigationActivity/NavigationFrame/Title.qml

    qml/QuestionFrames/EndTestFrame.qml
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
    imgs/sun.png
    imgs/moon.png
    imgs/theory/1/1.jpg
    imgs/theory/1/2.jpg
    imgs/theory/1/3.jpg
    imgs/theory/1/4.jpg
    imgs/theory/1/5.jpg
    imgs/theory/1/6.jpg
    imgs/theory/1/7.jpg
    imgs/theory/1/8.jpg
    imgs/theory/1/9.jpg
    imgs/theory/1/10.jpg
    imgs/theory/1/11.jpg
    imgs/theory/2/1.jpg
    imgs/theory/2/2.jpg
    imgs/theory/2/3.jpg
    imgs/theory/2/4.jpg
    imgs/theory/2/5.jpg
    imgs/theory/2/6.jpg
    imgs/theory/2/7.jpg
    imgs/theory/2/8.jpg
    imgs/theory/2/9.jpg
    imgs/theory/3/1.jpg
    imgs/theory/3/2.jpg
    imgs/theory/3/3.jpg
)

target_link_libraries(projectPracticum
    PRIVATE Qt6::Quick
    PRIVATE Qt6::Sql
    PRIVATE Qt6::Widgets
)

include(GNUInstallDirs)
install(TARGETS projectPracticum
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
