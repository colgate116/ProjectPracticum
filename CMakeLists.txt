cmake_minimum_required(VERSION 3.16)

project(projectPracticum LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Добавляем пакет Quick
find_package(Qt6 6.5 REQUIRED COMPONENTS Quick)
find_package(Qt6 6.5 REQUIRED COMPONENTS WebView)

qt_standard_project_setup()

# Определяем компилируемые файлы
qt_add_executable(projectPracticum
    src/MainActivity.cpp
)

# Добавляем файлы qml
qt_add_qml_module(projectPracticum
    URI path      # ссылка, по которой будут загружаться файлы qml
    VERSION 1.0

    QML_FILES
    qml/Component/ImgButton.qml
    qml/Component/TextButton.qml

    qml/EnteryActivity/EnteryActivity.qml
    qml/EnteryActivity/RegistrationFragment.qml
    qml/EnteryActivity/SignInFragment.qml

    qml/NavigationActivity/NavigationActivity.qml
    qml/NavigationActivity/NavigationSideBar.qml

    qml/NavigationActivity/NavigationFrame/Theory.qml
    qml/NavigationActivity/NavigationFrame/Title.qml

    qml/MainActivity.qml

    RESOURCES
    1.html
    2.html
    3.html
    imgs/MTUCI.jpg
    imgs/navigationBarIcon.svg
)

target_link_libraries(projectPracticum
    PRIVATE Qt6::Quick
    PRIVATE Qt6::WebView
)

include(GNUInstallDirs)
install(TARGETS projectPracticum
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
