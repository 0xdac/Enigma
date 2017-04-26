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

import Qt.labs.settings 1.0
import QtQuick.Layouts 1.3
import QtQuick 2.6
import QtQuick.Dialogs 1.2
import QtQuick.Controls 2.1
import QtQuick.Controls.Material 2.1
import org.dac.Enigma 1.0

Pane {
    id: pane
    objectName: "settingsGUI"

    property bool visibleKeyBoard: false

    MessageDialog {
        id: messageDialog
    }

    SwipeView {
        id: swipeview
        currentIndex: 0
        anchors.fill: parent

        //Connection
            Flickable {
                id: flickconnection
                height: swipeview.height
                contentWidth: swipeview.width;
                contentHeight: savebutton.y + savebutton.height + 40

                Connections {
                    target: Qt.inputMethod
                    onVisibleChanged:
                    {
                        if(visibleKeyBoard == false)
                        {
                            flickconnection.bottomMargin = (parent.height / 2) - 10;
                            visibleKeyBoard = true;
                        }
                        else
                        {
                            flickconnection.bottomMargin = 0;
                            visibleKeyBoard = false;
                        }
                    }
                }

                Column {
                    spacing: 20
                    width: parent.width

                    GroupBox {
                        title: "Configuración"
                        font.pixelSize: 20
                        width: pane.width - 40

                        Column {
                            spacing: 10
                            width: parent.width

                            TextField {
                                id: nautauser
                                width: parent.width - 60
                                height: 40
                                font.pixelSize: 18
                                anchors.margins: 20
                                placeholderText: "Usuario"
                                anchors.horizontalCenter: parent.horizontalCenter
                                text: settings.mailuser
                                selectByMouse: true
                                persistentSelection: true

                                Menu {
                                    id: nautauserMenu
                                    width: 80
                                    x: nautauser.x + 20
                                    y: nautauser.y + nautauser.height

                                    MenuItem {
                                        text: "CORTAR"
                                        font.pixelSize: 12
                                        height: 30
                                        enabled: nautauser.selectedText !== "" ? true : false
                                        onTriggered: { nautauser.cut() }
                                    }

                                    MenuItem {
                                        text: "COPIAR"
                                        font.pixelSize: 12
                                        height: 30
                                        enabled: nautauser.selectedText !== "" ? true : false
                                        onTriggered: { nautauser.copy() }
                                    }

                                    MenuItem {
                                        text: "PEGAR"
                                        font.pixelSize: 12
                                        height: 30
                                        enabled: nautauser.canPaste
                                        onTriggered: { nautauser.paste() }
                                    }
                                }

                                onPressAndHold: { nautauserMenu.open() }
                            }

                            TextField {
                                id: nautapass
                                width: parent.width - 60
                                height: 40
                                font.pixelSize: 18
                                anchors.margins: 20
                                echoMode: TextInput.Password
                                placeholderText: "Contraseña"
                                anchors.horizontalCenter: parent.horizontalCenter
                                //text: crypt.decrypt(settings.mailpassword)
                                //style: touchStyle
                            }
                        }
                    }

                    GroupBox {
                        title: "General"
                        font.pixelSize: 20
                        width: pane.width - 40

                        Column {
                            spacing: 10
                            width: parent.width

                            TextField {
                                id: subject
                                width: parent.width - 60
                                height: 40
                                font.pixelSize: 18
                                anchors.margins: 20
                                placeholderText: "Asunto"
                                anchors.horizontalCenter: parent.horizontalCenter
                                text: settings.subject
                                selectByMouse: true
                                persistentSelection: true

                                Menu {
                                    id: subjectMenu
                                    width: 80
                                    x: subject.x + 20
                                    y: subject.y + subject.height

                                    MenuItem {
                                        text: "CORTAR"
                                        font.pixelSize: 12
                                        height: 30
                                        enabled: subject.selectedText !== "" ? true : false
                                        onTriggered: { subject.cut() }
                                    }

                                    MenuItem {
                                        text: "COPIAR"
                                        font.pixelSize: 12
                                        height: 30
                                        enabled: subject.selectedText !== "" ? true : false
                                        onTriggered: { subject.copy() }
                                    }

                                    MenuItem {
                                        text: "PEGAR"
                                        font.pixelSize: 12
                                        height: 30
                                        enabled: subject.canPaste
                                        onTriggered: { subject.paste() }
                                    }
                                }

                                onPressAndHold: { subjectMenu.open() }
                            }

                            TextField {
                                id: token
                                width: parent.width - 60
                                height: 40
                                font.pixelSize: 18
                                anchors.margins: 20
                                placeholderText: "Token (16 caracteres)"
                                maximumLength: 16
                                anchors.horizontalCenter: parent.horizontalCenter
                                //text: crypt.decrypt(settings.token)
                                selectByMouse: true
                                persistentSelection: true

                                Menu {
                                    id: tokenMenu
                                    width: 80
                                    x: token.x + 20
                                    y: subject.y + subject.height

                                    MenuItem {
                                        text: "CORTAR"
                                        font.pixelSize: 12
                                        height: 30
                                        enabled: token.selectedText !== "" ? true : false
                                        onTriggered: { token.cut() }
                                    }

                                    MenuItem {
                                        text: "COPIAR"
                                        font.pixelSize: 12
                                        height: 30
                                        enabled: token.selectedText !== "" ? true : false
                                        onTriggered: { token.copy() }
                                    }

                                    MenuItem {
                                        text: "PEGAR"
                                        font.pixelSize: 12
                                        height: 30
                                        enabled: token.canPaste
                                        onTriggered: { token.paste() }
                                    }
                                }

                                onPressAndHold: { tokenMenu.open() }
                            }

                            TextField {
                                id: destinyemail
                                width: parent.width - 60
                                height: 40
                                font.pixelSize: 18
                                anchors.margins: 20
                                placeholderText: "Destinatario"
                                anchors.horizontalCenter: parent.horizontalCenter
                                text: settings.destinyemail
                                selectByMouse: true
                                persistentSelection: true

                                Menu {
                                    id: destinyMenu
                                    width: 80
                                    x: destinyemail.x + 20
                                    y: subject.y + subject.height

                                    MenuItem {
                                        text: "CORTAR"
                                        font.pixelSize: 12
                                        height: 30
                                        enabled: destinyemail.selectedText !== "" ? true : false
                                        onTriggered: { destinyemail.cut() }
                                    }

                                    MenuItem {
                                        text: "COPIAR"
                                        font.pixelSize: 12
                                        height: 30
                                        enabled: destinyemail.selectedText !== "" ? true : false
                                        onTriggered: { destinyemail.copy() }
                                    }

                                    MenuItem {
                                        text: "PEGAR"
                                        font.pixelSize: 12
                                        height: 30
                                        enabled: destinyemail.canPaste
                                        onTriggered: { destinyemail.paste() }
                                    }
                                }

                                onPressAndHold: { destinyMenu.open() }
                            }
                        }
                    }

                    Button {
                        id: savebutton
                        text: "Guardar"
                        font.pixelSize: 20
                        anchors.horizontalCenter: parent.horizontalCenter
                        highlighted: true
                        Material.primary: Material.Blue
                        Material.theme: Material.Light

                        onClicked:
                        {
                            if(token.text == "" || nautapass.text == "" || nautauser.text == "" || destinyemail.text == "" || subject.text == "")
                            {
                                messageDialog.title = "Enigma"
                                messageDialog.text = "Complete todos los datos."
                                messageDialog.visible = true;
                            }
                            else if(!settings.validateToken(token.text))
                            {
                                messageDialog.title = "Enigma"
                                messageDialog.text = "Token debe contener 16 caracteres. No use ';'."
                                messageDialog.visible = true;
                            }
                            else
                            {
                                settings.mailuser = nautauser.text
                                settings.mailpassword = crypt.encrypt(nautapass.text)
                                settings.destinyemail = destinyemail.text
                                settings.subject = subject.text
                                settings.token = crypt.encrypt(token.text)
                                topUpWindow.showSendGUI()
                            }
                        }

                    }
                }

          ScrollIndicator.vertical: ScrollIndicator { }
        }

    }
}


