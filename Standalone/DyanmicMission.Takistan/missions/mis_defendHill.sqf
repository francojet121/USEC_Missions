/*
*/
if (isServer) then {
	//Variables
	MissionNumber = MissionNumber + 1;

	_objectType = USEC_MissionDefendHill select (floor(random (count USEC_MissionDefendHill))); 
	_location = ["Hill"] call usec_mission_findLocation;
	_pos = [(position _location select 0),(position _location select 1),0];
	_pos = [_pos,0,200,10,1,0.1,0,[],[]] call BIS_fnc_findSafePos;
	player sideChat format ["Pos: %1",_pos];
	if (count _pos > 2) then {
		USEC_MissionDefendHill = USEC_MissionDefendHill - ["US_WarfareBUAVterminal_EP1"];
		_objectType = USEC_MissionDefendHill select (floor(random (count USEC_MissionDefendHill))); 
		_pos = [(position _location select 0),(position _location select 1),0];
		_pos = [_pos,0,200,10,0.8,1,0,[],[]] call BIS_fnc_findSafePos;
		player sideChat format ["New Pos: %1",_pos];
	};
	
	//_objectType = "US_WarfareBUAVterminal_EP1"
	_object = _objectType createVehicle _pos;
	_object setpos _pos;
	[_object,0,0] call BIS_fnc_setPitchBank;
	_object setVariable ["status",0,true];
	
	if (_objectType isKindOf "Land_telek1")  then {
		_base = "Land_ConcreteBlock" createVehicle _pos;
		_base setpos _pos;
		[_base,0,0] call BIS_fnc_setPitchBank;
		_base attachTo [_object,[0,0,-16.5]];
	};

	//Publish Mission
		USEC_MissionPublisher = [6,MissionNumber,_location,_object];
		publicVariable "USEC_MissionPublisher";
	
	[_object] spawn {
		while {alive _object} do {
			if (damage _object > 0.3) then {_object setDamage 1};
			sleep 0.5;
		};
	};
	
	//player setCaptive true;
	
//Wait till player nearby
	_dis = 50;
	_nearbyBlue = {(side _x == west)} count nearestObjects [_object, ["Man"], _dis];
	_loop = true;
	while {_loop} do {
		_nearbyBlue = {(side _x == west)} count nearestObjects [_object, ["Man"], _dis];
		_targetAlive = alive _object;
		if (_nearbyBlue > 0) then {_loop = false};
		if (!_targetAlive) then {_loop = false};
		sleep 1;
	};
	
	sleep 120;
	
	_object setVariable ["status",1,true];
	_missionGo = true;
	_stime = time;
	
	sleep 10;
	
//Send to Destroy
	_playersNo =  ((playersNumber west) + 1);
	if (_playersNo < 2) then {_playersNo = 2};
	if (_playersNo > 30) then {_playersNo = 30};
	_qty = ceil(_playersNo * 2.5);
	_disMin = 700;
	_disMax = 1200;
	for "_i" from 1 to _qty do {
		[_pos,_object,[_disMin,_disMax]] spawn usec_mission_sabotageTeam;
		[_pos,_object,[_disMin,_disMax]] spawn usec_mission_attackTeam;
		sleep 15;
	};
	_nearbyOpfor = {(side _x == east) and (alive _x)} count nearestObjects [_object, ["Man"], _disMax];

	while {_missionGo} do {
		_stillAlive = alive _object;
		_ctime = ((time - _stime) / 60);
		if (!_stillAlive) then {
			//Failed: Killed
			_missionGo = false;
		};
		if (_ctime > 20) then {
			//Win: Destroyed
			_missionGo = false;
		};
		_nearbyOpforNew = {(side _x == east) and (alive _x)} count nearestObjects [_object, ["Man"], (_disMax + 500)];
		if (_nearbyOpforNew < (_nearbyOpfor - 4)) then {
			[_pos,_object,[_disMin,_disMax]] spawn usec_mission_sabotageTeam;
		};
		sleep 15;
	};
	_object setVariable ["status",2,true];
	sleep (60 * 5);
	deleteVehicle _object;
	deleteVehicle _base;
};