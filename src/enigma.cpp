/**
 * Copyright (C) 2017 Darien Alonso Camacho (http://0xdac.org)
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

#include "enigma.h"
#include <QDesktopServices>
#include <QUrl>
#include <QNetworkInterface>
#include <QDateTime>
#include <QCryptographicHash>
#include <QFile>
#include <QAndroidJniObject>
#include <QAndroidJniEnvironment>
#include <QDebug>
#include "src/dataaccess/dbconnection.h"
#include "src/utils/jni/androidjni.h"

Enigma::Enigma()
{
    this->sender = "";
    this->password = "";
    this->subject = "";
    this->destiny = "";
    this->userToken = "";
    this->phones = QStringList();

    //DBConnection::connect();
}

Enigma::~Enigma()
{

}

QList<QObject*> Enigma::contacts()
{
    AndroidJni android;
    return android.contacts();
}

void Enigma::add(QString phone, QString amount)
{
    if(!phone.isEmpty() && !amount.isEmpty())
    {
        QString value = phone.append("x").append(amount);
        phones.append(value);
    }
}

/*QStringList TopUpMail::model()
{
    return this->phones;
}*/



void Enigma::setSender(QString sender)
{
    this->sender = sender;
}

void Enigma::setPassword(QString pass)
{
    this->password = pass;
}

void Enigma::setSubject(QString subject)
{
    this->subject = subject;
}

void Enigma::setToken(QString token)
{
    this->userToken = token;
}

void Enigma::setDestiny(QString destiny)
{
    this->destiny = destiny;
}

void Enigma::setText(QString text)
{
    this->text = text;
}

void Enigma::send()
{
    /*QAndroidJniObject activity =  QAndroidJniObject::callStaticObjectMethod("org/qtproject/qt5/android/QtNative",
                                                                                "activity",
                                                                                "()Landroid/app/Activity;");
    if (activity.isValid())
    {
        // get the default SmsManager
        QAndroidJniObject mySmsManager = QAndroidJniObject::callStaticObjectMethod("android/telephony/SmsManager",
                                                                                   "getDefault",
                                                                                   "()Landroid/telephony/SmsManager;" );
        if (mySmsManager.isValid())
        {
            qDebug() << "SMS Manager OK";
            // get phone number & text from UI and convert to Java String
            QString phone = this->destiny;
            QString text = this->text;
            QAndroidJniObject myPhoneNumber = QAndroidJniObject::fromString(phone);
            QAndroidJniObject myTextMessage = QAndroidJniObject::fromString(text);
            QAndroidJniObject scAddress = NULL;
            //QAndroidJniObject sentIntent = NULL;
            //QAndroidJniObject deliveryIntent = NULL;

            mySmsManager.callMethod<void>("sendTextMessage",
                                          "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/app/PendingIntent;Landroid/app/PendingIntent;)V",
                                          myPhoneNumber.object<jstring>(),
                                          scAddress.object<jstring>(),
                                          myTextMessage.object<jstring>(), NULL, NULL );
        }
        else
            qDebug() << "No SmsManager";
    }
    else
        qDebug() << "No QtNative";*/
}

void Enigma::deletePhone(int index)
{
    if(index >= 0 && index < this->phones.size())
    {
        this->phones.removeAt(index);
    }
}

void Enigma::deleteAll()
{
    this->phones = QStringList();
}

