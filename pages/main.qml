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
        id: mailer
    }

    MessageDialog {
        id: messageDialog
    }

    Settings {
        id: settings
        property string mailuser: ""
        property string mailpassword: ""
        property string destinyemail: ""
        property string token: ""
        property string subject: ""

        function validateToken(token)
        {
            if(token.search(';') !== -1)
                return false;

            //16 characters to encrypt the email body, see topupmail.cpp, send() function
            if(token.length === 16)
                return true;

            return false;
        }
    }

    function showSendGUI()
    {
        backButton.visible = false
        newMsgButton.visible = true
        //rect.visible = true
        titleLabel.text = "Enigma"
        stackView.pop()
    }

    function showSetupGUI()
    {
        titleLabel.text = "Preferencias"
        stackView.push("qrc:/pages/AppSettings.qml")
        rect.visible = false
        backButton.visible = true
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

            /*Rectangle {
                id: rect
                width: backButton.width
                height: 20
                color: "transparent"
            }*/

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
                    stackView.push(Qt.resolvedUrl("ContactMessages.qml"));
                    //stackView.currentItem.setDetailsText("Detalles de la venta")
                    newMsgButton.visible = false
                    backButton.visible = true
                    titleLabel.text = "Secure message"
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

                onClicked:
                {
                    /*if(settings.mailuser != "" && settings.mailpassword != "" && settings.token != "" && settings.destinyemail != "" && settings.subject != "")
                    {
                        if(!settings.validateToken(crypt.decrypt(settings.token)))
                        {
                            messageDialog.title = "TopUp"
                            messageDialog.text = "Token debe contener 16 caracteres. No use ';'."
                            messageDialog.visible = true;
                        }
                        else showSendGUI();
                    }*/
                    showSendGUI();
                }
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
                //type = 1 = Ventas
                /*model: ListModel {
                    ListElement {
                        index: 1
                        name: "Bill Smith"
                        number: "555 3264"
                    }
                    ListElement {
                        index: 2
                        name: "John Brown"
                        number: "555 8426"
                    }
                    ListElement {
                        index: 3
                        name: "Sam Wise"
                        number: "555 0473"
                    }
                    ListElement {
                        index: 4
                        name: "Bill Smith"
                        number: "555 3264"
                    }
                    ListElement {
                        index: 5
                        name: "John Brown"
                        number: "555 8426"
                    }
                    ListElement {
                        index: 6
                        name: "Sam Wise"
                        number: "555 0473"
                    }
                    ListElement {
                        index: 7
                        name: "Bill Smith"
                        number: "555 3264"
                    }
                    ListElement {
                        index: 8
                        name: "John Brown"
                        number: "555 8426"
                    }
                    ListElement {
                        index: 9
                        name: "Sam Wise"
                        number: "555 0473"
                    }
                }*/
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


        Component.onCompleted:
        {
            if(settings.token === "" || settings.mailpassword === "" || settings.mailuser === "" || settings.destinyemail === "" || settings.subject === "")
            {
                //showSetupGUI();
            }
        }
    }
  }
}


