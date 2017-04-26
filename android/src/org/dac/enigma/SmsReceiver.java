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

import android.os.Bundle;
import android.content.Intent;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.telephony.SmsMessage;
import android.widget.Toast;

public class SmsReceiver extends BroadcastReceiver
{
    @Override
    public void onReceive(Context context, Intent intent)
    {
        Bundle intentExtras = intent.getExtras();

        if (intentExtras != null) {
            /* Get Messages */
            Object[] sms = (Object[]) intentExtras.get("pdus");

            for (int i = 0; i < sms.length; ++i) {
                /* Parse Each Message */
                SmsMessage smsMessage = SmsMessage.createFromPdu((byte[]) sms[i]);

                String phone = smsMessage.getOriginatingAddress();
                String message = smsMessage.getMessageBody().toString();

                NotificationClient.notify(phone + ": " + message);
                //Toast.makeText(context, phone + ": " + message, Toast.LENGTH_SHORT).show();
            }
        }
    }
}
