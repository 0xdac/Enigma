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
import org.dac.Enigma 1.0

Flickable {
            id: sendGUI
            objectName: "contactMessages"
            height: stackView.height
            contentWidth: stackView.width;
            contentHeight: smsText.y + smsText.height + 10

            function setContactInfo(name, number)
            {
                mainWindow.showContactInfoInToolBar(name, number)
            }

            Enigma {
                id: enigma
            }

        Pane {
            //id: pane
            anchors.fill: parent

            Column {
                width: parent.width
                spacing: 10

                ListView {
                    id: listView
                    height: stackView.height - 210
                    //model: enigma.contacts()
                    width: parent.width

                    delegate: MessagesDelegate {
                        onClicked:
                        {
                            /*stackView.push(Qt.resolvedUrl("ContactMessages.qml"));
                            stackView.currentItem.setModel(sqlSellModel.get(modelData.id));
                            stackView.currentItem.setDetailsText("Detalles de la venta")*/
                        }
                    }

                    //ScrollIndicator.vertical: ScrollIndicator { }
                }

                Rectangle {
                    width: parent.width
                    color: "transparent"
                    height: 40
                }

                /*TextField {
                        id: phoneNumber
                        width: parent.width - 60
                        height: 40
                        font.pixelSize: 12
                        placeholderText: "Phone number"
                        //anchors.horizontalCenter: parent.horizontalCenter
                        inputMethodHints: Qt.ImhDialableCharactersOnly
                        selectByMouse: true
                        persistentSelection: true

                        Menu {
                            id: amountMenu
                            width: 80
                            x: phoneNumber.x + 20
                            y: phoneNumber.y + phoneNumber.height

                            MenuItem {
                                text: "CORTAR"
                                font.pixelSize: 12
                                height: 30
                                enabled: phoneNumber.selectedText !== "" ? true : false
                                onTriggered: { phoneNumber.cut() }
                            }

                            MenuItem {
                                text: "COPIAR"
                                font.pixelSize: 12
                                height: 30
                                enabled: phoneNumber.selectedText !== "" ? true : false
                                onTriggered: { phoneNumber.copy() }
                            }

                            MenuItem {
                                text: "PEGAR"
                                font.pixelSize: 12
                                height: 30
                                enabled: phoneNumber.canPaste
                                onTriggered: { phoneNumber.paste() }
                            }
                        }

                        onPressAndHold: { amountMenu.open() }
                    }*/

                Row {
                    width: parent.width
                    //anchors.horizontalCenter: parent.horizontalCenter
                    spacing: 2                    

                    TextArea {
                          id: smsText
                          placeholderText: "Secret text"
                          wrapMode: TextArea.Wrap                          
                          font.pixelSize: 12
                          //anchors.fill: parent
                          selectByMouse: true
                          persistentSelection: true
                          width: stackView.width - 85
                          //wrapMode: TextEdit.WordWrap
                          height: 80
                    }

                    /*Flickable {
                          id: flickable
                          width: stackView.width - 85
                          //wrapMode: TextEdit.WordWrap
                          height: 80
                          //anchors.fill: parent

                          TextArea.flickable: TextArea {
                              //placeholderText: "Secret text"
                              wrapMode: TextArea.Wrap
                              id: smsText
                              anchors.fill: parent
                              selectByMouse: true
                              persistentSelection: true

                              Menu {
                                  id: editMenu
                                  width: 80
                                  x: smsText.x + 20
                                  y: smsText.y + smsText.height

                                  MenuItem {
                                      text: "CORTAR"
                                      font.pixelSize: 12
                                      height: 30
                                      enabled: smsText.selectedText !== "" ? true : false
                                      onTriggered: { smsText.cut() }
                                  }

                                  MenuItem {
                                      text: "COPIAR"
                                      font.pixelSize: 12
                                      height: 30
                                      enabled: smsText.selectedText !== "" ? true : false
                                      onTriggered: { smsText.copy() }
                                  }

                                  MenuItem {
                                      text: "PEGAR"
                                      font.pixelSize: 12
                                      height: 30
                                      enabled: smsText.canPaste
                                      onTriggered: { smsText.paste() }
                                  }
                              }

                              onPressAndHold: { editMenu.open() }




                          }

                          ScrollBar.vertical: ScrollBar { }
                          /*MouseArea {
                              anchors.fill: parent
                              onClicked: { smsText.focus = true }
                          }/
                      }*/

                    Button {
                        id: sendButton
                        text: "Send"
                        width: 60
                        height: 40
                        //anchors.horizontalCenter: parent.horizontalCenter
                        font.pixelSize: 10
                        highlighted: true
                        //Material.primary: Material.Blue
                        //Material.theme: Material.Light

                        onClicked:
                        {
                            if(phoneNumber.text !== "" && smsText.text !== "")
                            {
                                enigma.setDestiny(phoneNumber.text)
                                enigma.setText(smsText.text)
                                enigma.send()
                            }
                        }
                    }
                }
            }
    }
}
