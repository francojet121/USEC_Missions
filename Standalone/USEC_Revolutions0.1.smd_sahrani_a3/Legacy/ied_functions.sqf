if (isServer) then {
	"iedEnemySpawn" addPublicVariableEventHandler {[_this select 1] spawn fnc_iedSpawnEnemy;};
	
	fnc_iedSpawnEnemy = {
		_loc=_this select 0;
		_ranX=0;
		_ranY=0;
		
		// Get random direction for location of spawners
		switch (floor(random 2)) do {
			case 0: {_ranX=(_loc select 0)-(floor(random 50)+100);};
			case 1: {_ranX=(_loc select 0)+(floor(random 50)+100);};
		};
		switch (floor(random 2)) do {
			case 0: {_ranY=(_loc select 1)-(floor(random 50)+100);};
			case 1: {_ranY=(_loc select 1)+(floor(random 50)+100);};
		};
		sleep floor(random 60);
		_newpos=[[_ranX,_ranY,0],0,50,1,0,10,0] call BIS_fnc_findSafePos;
		
		_units=[_newpos,floor(random 9)+1] call usec_mission_spawnGroup;
		_group=group (_units select 0);
		[_group,_loc] call BIS_fnc_taskAttack;
		_group setCombatMode "RED";
		
		while {{alive _x} count units _group>0} do {
			sleep 10;
		};
		
		sleep (10*60);
		{deleteVehicle _x;}forEach _units;
		deleteGroup _group;
	};
};

fnc_iedDetonate = {
	_thisied=_this select 0;
	_thisied removeEventHandler ["Hit",(_thisied getVariable "IEDHandler")];
	_thisied setVariable ["IEDStatus",0,true];// Unset
	_type=_thisied getVariable ["IEDType",false];
	_pos=[(getPosATL _thisied) select 0,(getPosATL _thisied) select 1,((getPosATL _thisied) select 2)+0.1];
	deleteVehicle (_thisied);
	_bomb=_type createVehicle _pos;
	
	_chance=floor(random 100);
	if (_chance>25) then {// They had a 25% chance, and lost
		if (isServer) then {
			[_pos] spawn fnc_iedSpawnEnemy;
		} else {
			iedEnemySpawn=_pos;
			publicVariableServer "iedEnemySpawn";
		};
	};
};