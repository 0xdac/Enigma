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

#ifndef ANDROIDJNI_H
#define ANDROIDJNI_H
#include <QObject>
#include <QVariant>
#include <QList>
#include "../contact.h"

class AndroidJni
{

public:
    AndroidJni();
    ~AndroidJni();

    //get all contacts of an android device
    QList<QObject*> contacts();    
};

#endif //ANDROIDJNI_H
