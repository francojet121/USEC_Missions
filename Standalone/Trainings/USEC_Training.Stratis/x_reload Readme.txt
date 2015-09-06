
Vehicle Repair, Refuel, Rearm Pad

CREATED BY: =7Cav=CW2.Iher.I
VERSION: v1
RELEASE DATE: March 3, 2013
WEBSITE: www.7thcavalry.us


-------------------------------
ABOUT THE SCRIPT
-------------------------------

The vehicle pad script included here is a script that instantly facilitates the ability to rearm, repair, and refuel any vehicle in ArmA III.

Originally, the vehicle pad script was considered a private script used only in 7th Cavalry training servers.
I decided that due to the lack of support trucks in the ArmA III Alpha, the public might benefit from a script that lets them service their vehicles.
This script is an adaptation of the script we use on our training servers.
Eventually I will release an ArmA III adapted version of our aircraft failure scripts for use by the public.

I hope you enjoy this script.


-------------------------------
FEATURES
-------------------------------

- NO MODS REQUIRED!

- Can be tweaked by the mission developer to included longer repair, refuel, and rearm times.

- The script is multiplayer friendly!

- Simple 2-step intallation to get your mission up and running in no time.

- Ability to make ANY trigger area a refuel, rearm, repair area.


-------------------------------
INSTALLATION
-------------------------------

1) REQUIRED - Place a trigger on your map. The defined area of the trigger in the editor translates to the area a vehicle must enter to be serviced.

2) REQUIRED - Ensure that the trigger is set to be activated repeatedly and may be activated by anyone or whomever you wish it to be activated by.

3a) REQUIRED - FOR LAND VEHICLES, PLACE THIS IN THE TRIGGER CONDITION.

                ("LandVehicle" countType thislist  > 0) && ((getpos (thislist select 0)) select 2 < 1)

3b) REQUIRED - FOR AIR VEHICLES, PLACE THIS IN THE TRIGGER CONDITION AND REPLACE TRIGGERNAME WITH THE NAME OF THE TRIGGER.

                (getPos ((list triggername) select 0) select 2) <= 1
		
4) REQUIRED - Place the following into the Trigger On Act field.

	_xhandle= (thislist select 0) execVM "x_reload.sqf";

		- This ensures that the script fires upon trigger activation.

5) REQUIRED - Copy & Paste the included x_reload.sqf into your mission file.

6) REQUIRED - Export your mission to pack it into a PBO. Enjoy!


-------------------------------
TECHNICAL / MODIFICATIONS
-------------------------------

To change the speed at which the pad performs repair, rearm, and refuel services:
	
	1) OPEN FILE: x_reload.sqf
	
	2) FIND LINE OF CODE (x_reload_time_factor = 0.01;):  This controls how fast the script runs
	
	3) CHANGE TO DESIRED VALUE.


-------------------------------
VERSION CHANGE LOG
-------------------------------

1.1     - New conditions to increase reliability, especially with air vehicles. Included sample mission and changed readme.

1.0	- Initial release