QT += widgets

HEADERS       = mainwindow.h
SOURCES       = main.cpp \
                mainwindow.cpp
#! [0]
RESOURCES     = application.qrc
#! [0]

# install
target.path = /bin
INSTALLS += target
