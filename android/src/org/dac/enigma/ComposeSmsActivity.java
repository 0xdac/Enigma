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

import android.content.Intent;
import android.provider.Telephony;
import android.app.Activity;

public class ComposeSmsActivity extends Activity
{

    @Override
    protected void onResume()
    {
        super.onResume();
        //System.out.println("onResume ComposeSmsActivity");
        //

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
        } else {
            // App is the default.
            // Hide the "not currently set as the default SMS app" interface
            View viewGroup = findViewById(R.id.not_default_app);
            viewGroup.setVisibility(View.GONE);
        }

    final String myPackageName = getPackageName();
    Intent intent = new Intent(Telephony.Sms.Intents.ACTION_CHANGE_DEFAULT);
    intent.putExtra(Telephony.Sms.Intents.EXTRA_PACKAGE_NAME, myPackageName);
    startActivity(intent);*/
    }
}
