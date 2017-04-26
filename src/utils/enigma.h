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

#ifndef ENIGMA
#define ENIGMA
#include <QObject>
#include <QVariant>
#include <QStringList>

class Enigma: public QObject
{
    Q_OBJECT

public:
    Enigma();
    ~Enigma();
    Q_INVOKABLE void add(QString phone, QString amount);
    //Q_INVOKABLE QStringList model();
    Q_INVOKABLE void send();
    Q_INVOKABLE void deletePhone(int index);
    Q_INVOKABLE void deleteAll();
    Q_INVOKABLE void setSender(QString sender);
    Q_INVOKABLE void setPassword(QString pass);
    Q_INVOKABLE void setSubject(QString subject);
    Q_INVOKABLE void setDestiny(QString destiny);
    Q_INVOKABLE void setText(QString text);
    Q_INVOKABLE void setToken(QString token);

private:
    QString destiny;
    QString text;

    QStringList phones;
    QString sender;
    QString password;
    QString subject;    
    QString userToken;
};

#endif //ENIGMA
