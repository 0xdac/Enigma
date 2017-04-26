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

#include "dbconnection.h"
#include <QDebug>
#include <QtSql>

DBConnection::DBConnection()
{

}

DBConnection::~DBConnection()
{

}

void DBConnection::connect()
{
    //QSqlDatabase db = QSqlDatabase::addDatabase("SQLITECIPHER");
    // Open database file. The driver creates a new file if it doesn't exist yet.

    /*QSettings settings;
    QString fileName = settings.value("database").toString();

        //File systems are different from one platform to another
#ifdef Q_OS_WIN
    fileName.remove("file:///");
#endif

#ifdef Q_OS_ANDROID
    fileName.remove("file://");
#endif

    //Just an obscure string before the real password in case someone open the .exe
    //with a hex editor
    QString obs(" QGeoPositionInfo @nauta.cu text/html 0 1 bit7");*/

    //db.setDatabaseName("enigmadb.db3");

    //This characters are found many times inside the binary file (.exe)
    //db.setPassword("charset=?utf-8?Q?<>_MIME-Version:1.0 base32 Android");

    /*if (!db.open())
    {
        qDebug()<< db.lastError().text();
    }
    else
    {
        qDebug()<< "Connection OK";
    }*/
}
