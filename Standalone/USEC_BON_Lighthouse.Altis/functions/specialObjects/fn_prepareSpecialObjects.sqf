/*
	BONYO_fnc_prepareSpecialObjects
	
	DESCRIPTION:
		This function adds the actions and loops to all special objects in Bonyo
		This function should never be called explicitly as it is called postInit by description.ext
		
	PARAMETERS:
		nothing
			
	RETURNS
		nothing
		
	EXAMPLE
		call BONYO_fnc_prepareSpecialObjects
*/

BONYO_obj_atm call BONYO_fnc_setupATM;

BONYO_obj_locker call BONYO_fnc_setupLocker;

BONYO_obj_sellArea call BONYO_fnc_setupSellArea;