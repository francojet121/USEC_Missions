//Setup all out static variables

//These need to be modified for each different map
BONYO_var_enemySpawn_inf = ["enemyspawn_ei_1","enemyspawn_ei_2","enemyspawn_ei_3","enemyspawn_ei_4","enemyspawn_ei_5"];
BONYO_var_enemySpawn_vic = ["enemyspawn_vic_1","enemyspawn_vic_2"];

//These are only so the variables are defined
BONYO_var_wave = 0;
BONYO_var_enemyList = [];
BONYO_var_objectList = [];

BONYO_info_saveVar = "bonyo_save_altis_lighthouse";


//Commands that should only load on the server
if (isServer) then {
	//Saving loop
	[] spawn {
		sleep 120;
		call BONYO_fnc_save;
	};
	
	//Load saved objects
	call BONYO_fnc_load;
};