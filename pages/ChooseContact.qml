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

import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.2
import QtQuick.Controls 2.1
import QtQuick.Controls.Material 2.1
import Qt.labs.settings 1.0
import org.dac.Enigma 1.0

Pane {
    id: chooseContact
    objectName: "chooseContact"
    anchors.fill: parent

    Flickable {
        height: parent.height
        contentWidth: parent.width;
        contentHeight: listView.y + listView.height + 5

        ListView {
            id: listView
            height: parent.height
            model: enigma.contacts()
            width: parent.width

            delegate: AndroidDelegate {
                onClicked:
                {
                    stackView.push(Qt.resolvedUrl("ContactMessages.qml"));
                    stackView.currentItem.setContactInfo(modelData.name, modelData.number);
                    //stackView.currentItem.setDetailsText("Detalles de la venta")
                }
            }
        }
    }
}



