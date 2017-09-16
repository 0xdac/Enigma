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

#include "androidjni.h"
#include <QAndroidJniObject>
#include <QAndroidJniEnvironment>

AndroidJni::AndroidJni()
{

}

AndroidJni::~AndroidJni()
{

}

QList<QObject*> AndroidJni::contacts()
{
    QList<QObject*> _contacts;

    //Retrieve all phone contacts
    QAndroidJniObject activity =  QAndroidJniObject::callStaticObjectMethod("org/qtproject/qt5/android/QtNative",
                                                                                "activity",
                                                                                "()Landroid/app/Activity;");
    if (activity.isValid())
    {
        const QAndroidJniObject contacts = QAndroidJniObject::callStaticObjectMethod("org/dac/enigma/EnigmaContacts",
                                                      "all",
                                                      "(Landroid/content/Context;)[Lorg/dac/enigma/ContactInfo;",
                                                      activity.object());
        if(contacts.isValid())
        {
            const jobjectArray contactsArray = contacts.object<jobjectArray>();
            QAndroidJniEnvironment qjniEnv;
            const int n = qjniEnv->GetArrayLength(contactsArray);
            jobject item, field;
            jfieldID fieldID;
            jclass clazz;

            QAndroidJniObject contactName, contactNumber;

            for (int i = 0; i < n; i ++)
            {
                //Get array item
                item = qjniEnv->GetObjectArrayElement(contactsArray, i);
                //Get item class
                clazz = qjniEnv->GetObjectClass(item);

                //Get field id for name attribute of class ContactInfo
                fieldID = qjniEnv->GetFieldID(clazz, "name", "Ljava/lang/String;");
                //Get jobject for field name
                field = qjniEnv->GetObjectField(item, fieldID);
                //Get final QAndroidJniObject to be used in Qt code
                contactName = QAndroidJniObject::fromLocalRef(field);

                //Get field id for number attribute of class ContactInfo
                fieldID = qjniEnv->GetFieldID(clazz, "number", "Ljava/lang/String;");
                //Get jobject for field number
                field = qjniEnv->GetObjectField(item, fieldID);
                //Get final QAndroidJniObject to be used in Qt code
                contactNumber = QAndroidJniObject::fromLocalRef(field);

                Contact* c = new Contact();
                c->setName(contactName.toString());
                c->setNumber(contactNumber.toString());

                _contacts.append(c);
            }

        }
    }

    return _contacts;
}
