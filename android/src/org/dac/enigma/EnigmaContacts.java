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

import android.database.Cursor;
import android.provider.ContactsContract;
import android.content.Context;
import java.util.ArrayList;

public class EnigmaContacts
{
    public EnigmaContacts()
    {

    }

    public static ContactInfo[] all(Context c)
    {
        String name = "";
        String phoneNumber = "";
        ArrayList<ContactInfo> contacts = new ArrayList<ContactInfo>();

        Cursor phones = c.getContentResolver().query(ContactsContract.CommonDataKinds.Phone.CONTENT_URI, null, null, null, null);

        while (phones.moveToNext())
        {
          name = phones.getString(phones.getColumnIndex(ContactsContract.CommonDataKinds.Phone.DISPLAY_NAME));
          phoneNumber = phones.getString(phones.getColumnIndex(ContactsContract.CommonDataKinds.Phone.NUMBER));
          ContactInfo cont = new ContactInfo();
          cont.name = name;
          cont.number = phoneNumber;
          contacts.add(cont);
          //System.out.println(name + "  " + phoneNumber);
        }

        phones.close();

        return contacts.toArray(new ContactInfo[0]);
    }
}
