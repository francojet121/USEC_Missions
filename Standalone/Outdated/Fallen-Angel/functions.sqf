f_SideChat = {
    (_this select 0) sideChat (_this select 1);
};

f_Hint = {
    if (player in (_this select 0)) then {
        hint (_this select 1);
    };
};

f_AddAction = {
    {
        _id = _x addAction [(_this select 1), missionNamespace getVariable (_this select 2), (_this select 3), 2, true, true, "", "((_this distance _target) < 3)"];
        _x setVariable ["Zen_Action_" + (_this select 1), _id];
    } forEach (_this select 0);
};

f_RemoveAction = {
    {
        _x removeAction (_x getVariable ["Zen_Action_" + (_this select 1), 0]);
    } forEach (_this select 0);
};

/////////////////////////////////////////////////

f_HandleFire = {
    if (time > (Last_Fire_Event_Time_Local + 5)) then {
        if !(isServer) then {
            Zen_MP_Closure_Packet = ["f_AlertPatrols",  (_this select 0)];
            publicVariableServer "Zen_MP_Closure_Packet";
        } else {
            (_this select 0) call f_AlertPatrols;
        };
    };

    Last_Fire_Event_Time_Local = time;
};

f_AlertPatrols = {
    {
        if !(isNull (leader _x)) then {
            _distance = [leader _x, _this] call Zen_Find2dDistance;
            if (_distance < 1000) then {
                _x reveal [_this, (250 / _distance) min 2];
            };
        };
    } forEach ([] call Zen_ConvertToGroupArray);
};

/*f_PatrolThread = {
    _group = _this select 0;
    _AISkill = _this select 1;
    _AISquadRange = _this select 2;
    _maxIndfor = _this select 3;
    _IndforPatrolGroups = [];
    waitUntil {
        sleep 2;
        !(isNil "Cur_Supply_Point")
    };

    while {true} do {
        _dirToSupply = [_group, Cur_Supply_Point] call Zen_FindDirection;
        _spawnPos = [_group, [400, 1200], 0, 1, 0, [_dirToSupply - 100, _dirToSupply + 100, "trig"]] call Zen_FindGroundPosition;
        _IndforGroup = [_spawnPos, resistance, _AISkill, _AISquadRange] call Zen_SpawnInfantry;
        if (random 1 > 0.5) then {
            null = [_IndforGroup] call Zen_GiveLoadoutIndfor;
        };

        {
            if (random 1 > 0.3) then {
                _x unlinkItem "NVGoggles_INDEP";
                _x unassignItem "NVGoggles_INDEP";
                _x removeItem "NVGoggles_INDEP";
            };
        } forEach (units _IndforGroup);

        null = [allUnits, true] call Zen_MultiplyDamage;
        null = [_IndforPatrolGroups, _IndforGroup] call Zen_ArrayAppend;
        null = [_IndforPatrolGroups] call Zen_ArrayRemoveDead;
        _patrolThread = [_IndforPatrolGroups, ([Cur_Supply_Point, _group] call Zen_FindAveragePosition), [1, 700], 0, "limited", "safe"] spawn Zen_OrderInfantryPatrol;

        waitUntil {
            sleep 10;
            (({side _x == resistance} count allUnits) < _maxIndfor)
        };

        terminate _patrolThread;
    };
};


f_TownPatrolThread = {
	_defZones = _this select 0;
	_ratioInf = _this select 1;
	_ratioVeh = _this select 2;
	
	// building garrisons and local patrols.  Forts?
};

f_RoadPatrolThread = {
	// spawn convoy at one or more of the road based "d" markers
	// assign them one of the other "d" points as a waypoint.
	// on arrival, wait then new assignment.
};
*/

/////////////////////////////////////////////////

f_CrashSite = {
    private ["_pos", "_crashedHeli", "_pilotClass", "_pilot", "_passengerClass", "_passenger", "_missionObject"];

    _pos = _this select 0;
	_crashedHeli = [["b_heli_light_01_f","B_Heli_Attack_01_F","B_Heli_Transport_01_F","B_Heli_Transport_03_F"]] call Zen_ArrayGetRandom; 
	_pilotClass = "b_helipilot_F"; 
	
    _crashedHeli = [_pos, _crashedHeli, 0, random 360] call Zen_SpawnVehicle;
    _crashedHeli setDamage 0.9;
    _crashedHeli setVehicleAmmo 0;
    _crashedHeli setFuel 0;
    _crashedHeli lock 2;
	
	// Smoke on the wreck
	_smoke = "#particlesource" createVehicle _pos;
	_smoke setParticleClass "AirObjectDestructionSmoke";
	_smoke attachTo [_crashedHeli, [0,0,1.5]];
	
	// Dead pilot in the helicopter
    _pilot = units ([([_pos, 10, random 360] call Zen_ExtendPosition), _pilotClass] call Zen_SpawnGroup) select 0;
    null = [_pilot, _crashedHeli, "All"] call Zen_MoveInVehicle;
    _pilot setDamage 1;

	// Wounded Pilot.  Spawn, Strip, SetCaptive 
    _pilot = units ([([_pos, 10, random 360] call Zen_ExtendPosition), _pilotClass] call Zen_SpawnGroup) select 0;
    null = [_pilot, "crew"] call Zen_SetAISkill;
    _pilot setDamage 0.9;
    _pilot setCaptive true;
    _pilot setUnitPos "down";
    _pilot disableAI "Move";
    _pilot allowDamage false;
    removeAllWeapons _pilot;
    removeAllItems _pilot;
    removeHeadgear _pilot;
    removeAllAssignedItems _pilot;
	
	// Debris field?  Fire?
	
    (_pilot)
};

f_CrashMarker = {
	_crashpos = _this select 0;
	hint format ["%1",_crashpos];
	
	[_crashpos, "Crash is Here", "ColorBlufor", [.6,.6],"mil_dot"] call Zen_SpawnMarker;
	
	
	_flightpath = [_crashpos, random 1000, random 360] call Zen_ExtendPosition;
	_dir = random 360;
	_flightpath = [_flightpath, "Flight Path", "ColorWhite", [1500,20],"rectangle",_dir] call Zen_SpawnMarker;
	
	_searcharea = [_crashpos, "AI Search Area", "ColorOpfor", [1500,1000],"rectangle", _dir] call Zen_SpawnMarker;
	
	(_searcharea)
};


f_CrashSiteTrigger = {
	_pilot = _this select 0;
	_blu = _this select 1;
	
	waitUntil {
	// possible script crash error out when no blufor alive.
		sleep 20;
		_friendlyUnits = [_blu] call Zen_ConvertToObjectArray; 
		_nearestFriendly = [_friendlyUnits, _pilot] call Zen_FindMinDistance;
		(([_nearestFriendly, _pilot] call Zen_Find2dDistance) < 10)
	};
	
	Hint "You found the pilot!";
	
	// Update Task
	// AddAction to heli to recover the body
	// AddAction to heli to recover the encryption module
		// Start a 10 minute timer?
	// Release the injured pilot so he can be moved.  Keep setcaptive, but enable simulation
	// Redirect Search parties
		// Helicopter to ruin their day. (if fog < x)?
};

/////////////////////////////////////////////////

f_RoadBlock = {
    private ["_center", "_side", "_skill", "_roads", "_road", "_roadDir", "_vehicleTypes", "_vehicleArray", "_vehicle", "_guardGroup"];

    _center = _this select 0;
    _side = _this select 1;
    _skill = _this select 2;

    _roads = _center nearRoads 300;

    if (count _roads == 0) then {
        throw "Zen_NoRoads_Exception";
    };

    _road = [_roads] call Zen_ArrayGetRandom;
    _roadDir = [_road] call Zen_FindRoadDirection;

    switch (_side) do {
        case west: {
            _vehicleTypes = ["B_MRAP_01_hmg_F", "B_MRAP_01_F"];
        };
        case east: {
            _vehicleTypes = ["O_MRAP_02_hmg_F", "O_MRAP_02_F"];
        };
        case resistance: {
            _vehicleTypes = ["I_MRAP_03_hmg_F", "I_MRAP_03_F"];
        };
    };

    _vehicleArray = [];
    for "_i" from 1 to 2 do {
        _vehicle = [([_road, 4, _roadDir + (90 * -1^_i), "trig"] call Zen_ExtendPosition), ([_vehicleTypes] call Zen_ArrayGetRandom), 0, 90 - (_roadDir + (90 * -1^_i))] call Zen_SpawnVehicle;
        _vehicle lock 2;
        _vehicle addMagazineCargoGlobal ["SatchelCharge_Remote_Mag", 1];
        0 = [_vehicleArray, _vehicle] call Zen_ArrayAppend;
    };

    _guardGroup = [([_road, 10, random 360] call Zen_ExtendPosition), _side, _skill, [3,4]] call Zen_SpawnInfantry;
    0 = [_guardGroup, _side, OPFOR_LOADOUTS] call Zen_GiveLoadout;
    (units _guardGroup + _vehicleArray)
};

f_AASite = {
    private ["_center", "_side", "_skill", "_vehicleType", "_netType", "_vehicle", "_net", "_guardGroup"];

    _center = _this select 0;
    _side = _this select 1;
    _skill = _this select 2;

    switch (_side) do {
        case west: {
            _vehicleType = "B_APC_Tracked_01_AA_F";
            _netType = "CamoNet_Blufor_open_F";
        };
        case east: {
            _vehicleType = "O_APC_Tracked_02_AA_F";
            _netType = "CamoNet_Opfor_open_F";
        };
        case resistance: {
            _vehicleType = "I_APC_tracked_03_cannon_F";
            _netType = "CamoNet_INDP_open_F";
        };
    };

    _vehicle = [_center, _vehicleType, 0, random 360] call Zen_SpawnVehicle;
    _net = [_center, _netType, 0, (getDir _vehicle)] call Zen_SpawnVehicle;
    _net allowDamage false;

    _guardGroup = [([_center, 10, random 360] call Zen_ExtendPosition), _side, _skill, [3, 4]] call Zen_SpawnInfantry;
    //0 = [_guardGroup, _side, OPFOR_LOADOUTS] call Zen_GiveLoadout;
    (units _guardGroup + [_vehicle])
};
