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

ApplicationWindow {
    id: mainWindow
    width: 360
    height: 520
    visible: true
    title: "Enigma"

    Material.theme: Material.Light
    Material.accent: Material.Blue
    Material.primary: "lightsteelblue"

    property bool visibleKeyBoard: false
    property int max_items: 7

    Enigma {
        id: enigma
    }

    MessageDialog {
        id: messageDialog
    }

    function showMainGUI()
    {
        if(stackView.currentItem.objectName === "contactMessages")
        {
            backButton.visible = true
            newMsgButton.visible = false
            contactInfo.visible = false
            titleLabel.visible = true
            titleLabel.text = qsTr("Choose Contact")
        }
        else
        {
            backButton.visible = false
            newMsgButton.visible = true
            titleLabel.text = "Enigma"
        }

        stackView.pop()
    }

    function showSetupGUI()
    {
        titleLabel.text = "Preferencias"
        stackView.push("qrc:/pages/AppSettings.qml")
        //rect.visible = false
        backButton.visible = true
    }

    function showContactInfoInToolBar(name, number)
    {
        newMsgButton.visible = false
        backButton.visible = true
        contactInfo.visible = true
        titleLabel.visible = false
        nameLabel.text = name
        numberLabel.text = number
    }


    Connections {
        target: Qt.inputMethod
        onVisibleChanged:
        {
            if(visibleKeyBoard == false)
            {
                sendGUI.bottomMargin = (stackView.height / 2) - 10;
                visibleKeyBoard = true;
            }
            else
            {
                sendGUI.bottomMargin = 0;
                visibleKeyBoard = false;
            }
        }
    }


    header: ToolBar {
        RowLayout {
            spacing: 20
            anchors.fill: parent

            ToolButton {
                id: newMsgButton

                Image {
                    anchors.centerIn: parent
                    source: "qrc:/images/msg.png"
                    sourceSize.width: 20
                    sourceSize.height: 20
                }

                onClicked:
                {
                    stackView.push(Qt.resolvedUrl("ChooseContact.qml"));
                    //stackView.currentItem.setDetailsText("Detalles de la venta")
                    newMsgButton.visible = false
                    backButton.visible = true
                    titleLabel.text = qsTr("Choose contact")
                }
            }

            ToolButton {
                id: backButton
                visible: false

                Image {
                    anchors.centerIn: parent
                    source: "qrc:/images/navigation_previous_item.png"
                    sourceSize.width: 20
                    sourceSize.height: 20
                }

                onClicked: { showMainGUI(); }
            }

            Label {
                id: titleLabel
                text: "Enigma"
                font.pixelSize: 20
                elide: Label.ElideRight
                horizontalAlignment: Qt.AlignHCenter
                verticalAlignment: Qt.AlignVCenter
                Layout.fillWidth: true
            }

            Column {
                id: contactInfo
                spacing: 1
                width: parent.width
                visible: false

                Label {
                    id: nameLabel
                    font.pixelSize: 10
                    elide: Label.ElideRight
                    horizontalAlignment: Qt.AlignLeft
                    Layout.fillWidth: true
                }

                Label {
                    id: numberLabel
                    font.pixelSize: 10
                    elide: Label.ElideRight
                    horizontalAlignment: Qt.AlignLeft
                    Layout.fillWidth: true
                }
            }

            ToolButton {
                Image {
                    anchors.centerIn: parent
                    source: "qrc:/images/menu.png"
                }
                //onClicked: optionsMenu.open()

                Menu {
                    id: optionsMenu
                    x: parent.width - width
                    y: parent.height
                    transformOrigin: Menu.TopRight

                    MenuItem {
                        text: "Preferencias"
                        font.pixelSize: 20

                        onTriggered:
                        {
                            if(stackView.currentItem.objectName == "sendGUI")
                            {
                                titleLabel.text = "Preferencias"
                                stackView.push("qrc:/pages/AppSettings.qml")
                                //rect.visible = false
                                backButton.visible = true
                            }
                        }
                    }
                }
            }
        }
    }

    StackView {
        id: stackView
        anchors.fill: parent

        initialItem: Flickable {
            id: sendGUI
            objectName: "sendGUI"
            height: stackView.height
            contentWidth: stackView.width;
            contentHeight: listView.y + listView.height + 5

            ListView {
                id: listView
                height: mainWindow.height
                //model: enigma.contacts()
                width: parent.width

                delegate: AndroidDelegate {
                    onClicked:
                    {
                        stackView.push(Qt.resolvedUrl("ContactMessages.qml"));
                        //stackView.currentItem.setModel(sqlSellModel.get(modelData.id));
                        stackView.currentItem.setDetailsText("Detalles de la venta")
                    }
                }
            }
        }
    }
}


