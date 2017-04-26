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

#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickStyle>
#include <QQmlContext>
#include <QSettings>
#include <QtQml>
#include "src/utils/enigma.h"


int main(int argc, char *argv[])
{    
    QGuiApplication::setApplicationName("Enigma");
    QGuiApplication::setOrganizationName("0xdac");
    QGuiApplication::setOrganizationDomain("0xdac.org");
    QGuiApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);
    QQuickStyle::setStyle("Material");

    qmlRegisterType<Enigma>("org.dac.Enigma", 1, 0, "Enigma");

    QQmlApplicationEngine engine;
    engine.load(QUrl("qrc:/pages/main.qml"));
    if (engine.rootObjects().isEmpty())
        return -1;    

    return app.exec();
}
