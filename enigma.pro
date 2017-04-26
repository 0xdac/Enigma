TARGET = Enigma
QT += qml quick quickcontrols2 core network sql androidextras

SOURCES += \
    main.cpp \
    src/utils/enigma.cpp \
    src/dataaccess/dbconnection.cpp


OTHER_FILES += \
    pages/main.qml \
    android/src/org/dac/enigma/NotificationClient.java \
    android/src/org/dac/enigma/SmsReceiver.java \
    android/src/org/dac/enigma/MmsReceiver.java \
    android/src/org/dac/enigma/ComposeSmsActivity.java

RESOURCES += \
    enigma.qrc
	
DISTFILES += \
    content/AppSettings.qml \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/AndroidManifest.xml \
    android/res/values/libs.xml \
    android/build.gradle \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradlew \
    android/gradlew.bat


ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android

HEADERS += \
    src/utils/enigma.h \
    src/dataaccess/dbconnection.h
