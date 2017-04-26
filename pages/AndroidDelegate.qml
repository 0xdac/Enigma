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

import QtQuick 2.2

Item {
    id: offersDelegate
    width: parent.width
    height: 70


    //property alias name: name.text
    //property alias cost: cost.text
    signal clicked

    Rectangle {
        anchors.topMargin: 2
        anchors.rightMargin: 2
        anchors.leftMargin: 2
        anchors.fill: parent
        color: "lightsteelblue";
        radius: 7
        visible: true
    }

    Rectangle {
        anchors.topMargin: 2
        anchors.rightMargin: 2
        anchors.leftMargin: 2
        anchors.fill: parent
        color: "lightblue"
        radius: 7
        visible: mouse.pressed
    }

    Column {
        spacing: 5
        anchors.verticalCenter: parent.verticalCenter

        Text {
            //id: name
            color: "black"
            //font.pixelSize: 12
            //text: modelData.name
            text: name
            //anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 30
        }

        Text {
            //id: cost
            color: "black"
            //font.pixelSize: 12
            //text: "$" + modelData.number
            text: number
            //anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 30
        }
    }

    /*Rectangle {
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.margins: 15
        height: 1
        //color: "#424246"
        color: "lightsteelblue";
        radius: 5
    }*/

    /*Image {
        anchors.right: parent.right
        anchors.rightMargin: 20
        anchors.verticalCenter: parent.verticalCenter
        source: "../images/navigation_next_item.png"
    }*/

    MouseArea {
        id: mouse
        anchors.fill: parent
        onClicked: offersDelegate.clicked()

    }
}
