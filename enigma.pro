TARGET = Enigma
QT += qml quick quickcontrols2 core network sql androidextras

SOURCES += \
    main.cpp \
    src/enigma.cpp \
    src/utils/contact.cpp \
    src/utils/jni/androidjni.cpp \
    src/dataaccess/dbconnection.cpp


OTHER_FILES += \
    pages/main.qml \
    android/src/org/dac/enigma/NotificationClient.java \
    android/src/org/dac/enigma/SmsReceiver.java \
    android/src/org/dac/enigma/MmsReceiver.java \
    android/src/org/dac/enigma/ComposeSmsActivity.java \
    android/src/org/dac/enigma/SmsMsg.java \
    android/src/org/dac/enigma/EnigmaContacts.java

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
    android/gradlew.bat \
    android/src/org/dac/enigma/ContactInfo.java


ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android

HEADERS += \
    src/enigma.h \
    src/utils/contact.h \
    src/utils/jni/androidjni.h \
    src/dataaccess/dbconnection.h
