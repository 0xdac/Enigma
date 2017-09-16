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

package org.dac.enigma;

import android.app.Notification;
import android.app.NotificationManager;
import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.content.Intent;
import android.provider.Telephony;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;

public class NotificationClient extends org.qtproject.qt5.android.bindings.QtActivity
{
    private static NotificationManager m_notificationManager;
    private static Notification.Builder m_builder;
    private static NotificationClient m_instance;

    public NotificationClient()
    {
        m_instance = this;
    }

    public static void notify(String s)
    {
        if (m_notificationManager == null) {
            m_notificationManager = (NotificationManager)m_instance.getSystemService(Context.NOTIFICATION_SERVICE);
            m_builder = new Notification.Builder(m_instance);
            m_builder.setSmallIcon(R.drawable.icon);
            m_builder.setContentTitle("Enigma");
        }

        //String str = "";
        //str = m_instance.smsHistory();
        m_builder.setContentText(s);
        m_notificationManager.notify(1, m_builder.build());
    }

    private void notifyPrivate()
    {

    }

    /*public static SmsMsg[] getSMSs()
    {
        List<SmsMsg> messages = new List<SmsMsg>();

        return messages.toArray(new SmsMsg[0]);
    }*/

    public String smsHistory()
    {
        Cursor cur = getContentResolver().query(Uri.parse("content://sms/inbox"), null, null, null, null);

        String msgInfo = "Failed!!!";

        if (cur.moveToFirst()) { // false = no sms
            //do {
               msgInfo = "";

               for (int i = 0; i < cur.getColumnCount(); i++) {
                   msgInfo += " " + cur.getColumnName(i) + ":" + cur.getString(i);
               }

           System.out.println(msgInfo);

               //Toast.makeText(this, msgInfo, Toast.LENGTH_SHORT).show();
            //} while (cur.moveToNext());
        }

    /*Context context = this.getApplicationContext();
    final String myPackageName = getPackageName();
    Intent intent = new Intent(Telephony.Sms.Intents.ACTION_CHANGE_DEFAULT);
    intent.putExtra(Telephony.Sms.Intents.EXTRA_PACKAGE_NAME, myPackageName);
    startActivity(intent);

    String defaultSmsApp = Telephony.Sms.getDefaultSmsPackage(context);*/

    // msgInfo = defaultSmsApp;

    /*final String myPackageName = getPackageName();
            if (!Telephony.Sms.getDefaultSmsPackage(this).equals(myPackageName)) {
                // App is not default.
                // Show the "not currently set as the default SMS app" interface
                View viewGroup = findViewById(R.id.not_default_app);
                viewGroup.setVisibility(View.VISIBLE);

                // Set up a button that allows the user to change the default SMS app
                Button button = (Button) findViewById(R.id.change_default_app);
                button.setOnClickListener(new View.OnClickListener() {
                    public void onClick(View v) {
                        Intent intent =
                                new Intent(Telephony.Sms.Intents.ACTION_CHANGE_DEFAULT);
                        intent.putExtra(Telephony.Sms.Intents.EXTRA_PACKAGE_NAME,
                                myPackageName);
                        startActivity(intent);
                    }
                });
            }*/
        return msgInfo;

    }
}
