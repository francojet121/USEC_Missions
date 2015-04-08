/*--------------------------------------------------------------------
	Author: Unity Security Force (B.Knyte)

	vehicleLoadout.sqf
	Sets default vehicle loadouts at mission start

	Call from vehicleInit with:
		if (isServer) then {null = [this, [["",#],["",#],...,["",#]]]; execVM "USEC\vehicleLoadout.sqf";};
--------------------------------------------------------------------*/

private ["_vehc", "_kits", "_numLoops"];

// Passed Variables Handler
// Counts number of variables passed.  Sets number of loops to run

_vehc = _this select 0;			// This vehicle
_kits = _this select 1;			// Selects the array of gear arrays [["gearpack",#],...]
_numLoops = count _kits;		// Number of kits types requested

clearWeaponCargoGlobal _vehc;	// Clear weapons from vehicle cargo
ClearMagazineCargoGlobal _vehc;	// Clear magazines/grenades/charges from vehicle cargo
ClearItemCargoGlobal _vehc;		// Clear items from vehicle cargo
clearBackpackCargoGlobal _vehc;	// Clear backpacks/parachutes from vehicle cargo

waitUntil {!isNil "AGM_Logistics_loadedItemsDummy"}; // Wait for AGM Dummy Item to be present

for "_i" from 0 to (_numLoops-1) step 1 do {
	_numKits = (_kits select _i select 1);

	switch (_kits select _i select 0) do {
	    case "ammo": {
			_vehc addMagazineCargoGlobal ["30Rnd_65x39_caseless_mag",32*_numKits];
			_vehc addMagazineCargoGlobal ["30Rnd_65x39_caseless_mag_Tracer",4*_numKits];
			_vehc addMagazineCargoGlobal ["100Rnd_65x39_caseless_mag",4*_numKits];
			_vehc addMagazineCargoGlobal ["3Rnd_HE_Grenade_shell",4*_numKits];
			_vehc addMagazineCargoGlobal ["3Rnd_Smoke_Grenade_shell",2*_numKits];
			_vehc addMagazineCargoGlobal ["3Rnd_SmokeGreen_Grenade_shell",2*_numKits];
			_vehc addMagazineCargoGlobal ["3Rnd_SmokeRed_Grenade_shell",2*_numKits];
			_vehc addMagazineCargoGlobal ["NLAW_F",2*_numKits];
      _vehc addMagazineCargoGlobal ["rhs_fim92_mag",2*_numKits];
			_vehc addMagazineCargoGlobal ["HandGrenade",8*_numKits];
			_vehc addMagazineCargoGlobal ["SmokeShell",8*_numKits];
			_vehc addMagazineCargoGlobal ["SmokeShellGreen",8*_numKits];
			_vehc addMagazineCargoGlobal ["SmokeShellRed",8*_numKits];
			_vehc addItemCargoGlobal ["Chemlight_Green",8*_numKits];
			_vehc addItemCargoGlobal ["AGM_HandFlare_White",4*_numKits];
			_vehc addItemCargoGlobal ["AGM_HandFlare_Green",4*_numKits];
			_vehc addItemCargoGlobal ["AGM_CableTie",8*_numKits];
			_vehc addItemCargoGlobal ["AGM_UAVBattery",1*_numKits];
		};
		case "fuel": {
			for "_i" from 0 to 3 step 1 do {
				_item = ['AGM_JerryCan', [-1000, -1000, 100]] call AGM_Logistics_fnc_spawnObject;
				[_vehc, _item] call AGM_Logistics_fnc_initLoadedObject;
			};
		};
		case "kit": {
			_vehc addMagazineCargoGlobal ["30Rnd_65x39_caseless_mag",4*_numKits];
			_vehc addMagazineCargoGlobal ["100Rnd_65x39_caseless_mag",2*_numKits];
			_vehc addMagazineCargoGlobal ["SmokeShell",4*_numKits];
			_vehc addMagazineCargoGlobal ["SmokeShellGreen",2*_numKits];
			_vehc addMagazineCargoGlobal ["SmokeShellRed",2*_numKits];
			_vehc addItemCargoGlobal ["Chemlight_Green",2*_numKits];
			_vehc addItemCargoGlobal ["AGM_HandFlare_White",2*_numKits];
			_vehc addItemCargoGlobal ["AGM_HandFlare_Green",2*_numKits];
			_vehc addItemCargoGlobal ["AGM_Bandage",20*_numKits];
			_vehc addItemCargoGlobal ["AGM_Morphine",10*_numKits];
			_vehc addItemCargoGlobal ["AGM_CableTie",2*_numKits];
		};
		case "medical": {
			_vehc addItemCargoGlobal ["AGM_Epipen",20];
			_vehc addItemCargoGlobal ["AGM_Bandage",50*_numKits];
			_vehc addItemCargoGlobal ["AGM_Morphine",25*_numKits];
			_vehc addItemCargoGlobal ["AGM_Bloodbag",8*_numKits];
			_vehc addItemCargoGlobal ["AGM_CableTie",4*_numKits];
		};
		case "repair": {
			_vehc addItemCargoGlobal ["ToolKit",2];
			_vehc addItemCargoGlobal ["MineDetector",2];
			_vehc addItemCargoGlobal ["AGM_DefusalKit",2];
			for "_i" from 0 to 9 step 1 do {
				_item = ['AGM_SpareWheel', [-1000, -1000, 100]] call AGM_Logistics_fnc_spawnObject;
				[_vehc, _item] call AGM_Logistics_fnc_initLoadedObject;
			}; 
			for "_i" from 0 to 3 step 1 do {
				_item = ['AGM_SpareTrack', [-1000, -1000, 100]] call AGM_Logistics_fnc_spawnObject;
				[_vehc, _item] call AGM_Logistics_fnc_initLoadedObject;
			}; 
		};		
		case "truck": {
			_vehc addItemCargoGlobal ["ToolKit",1];
			for "_i" from 0 to 1 step 1 do {
				_item = ['AGM_SpareWheel', [-1000, -1000, 100]] call AGM_Logistics_fnc_spawnObject;
					[_vehc, _item] call AGM_Logistics_fnc_initLoadedObject;
			}; 
			_item = ['AGM_JerryCan', [-1000, -1000, 100]] call AGM_Logistics_fnc_spawnObject;
				[_vehc, _item] call AGM_Logistics_fnc_initLoadedObject;
		};	
		case "track": {
			_vehc addItemCargoGlobal ["ToolKit",1];
			_item = ['AGM_SpareTrack', [-1000, -1000, 100]] call AGM_Logistics_fnc_spawnObject;
				[_vehc, _item] call AGM_Logistics_fnc_initLoadedObject;
			_item = ['AGM_JerryCan', [-1000, -1000, 100]] call AGM_Logistics_fnc_spawnObject;
				[_vehc, _item] call AGM_Logistics_fnc_initLoadedObject;
		};	
		case "air": {
			_vehc addItemCargoGlobal ["ToolKit",1];
			_item = ['AGM_JerryCan', [-1000, -1000, 100]] call AGM_Logistics_fnc_spawnObject;
				[_vehc, _item] call AGM_Logistics_fnc_initLoadedObject;
		};
	};
};

/* Common VehicleInit Calls

if (isServer) then {null = [<code>] execVM "USEC\vehicleLoadout.sqf";};

Ammo Truck 		:	if (isServer) then {null = [this, [["kit",1],["ammo",1],["truck",1]]] execVM "USEC\vehicleLoadout.sqf";};

Fuel Truck 		: 	if (isServer) then {null = [this, [["kit",1],["fuel",1],["truck",1]]] execVM "USEC\vehicleLoadout.sqf";};

Medical Truck 	: 	if (isServer) then {null = [this, [["kit",1],["medical",1],["truck",1]]] execVM "USEC\vehicleLoadout.sqf";};

Repair Truck 	: 	if (isServer) then {null = [this, [["kit",1],["repair",1],["truck",1]]] execVM "USEC\vehicleLoadout.sqf";};

Repair Track 	: 	if (isServer) then {null = [this, [["kit",1],["repair",1],["track",1]]] execVM "USEC\vehicleLoadout.sqf";};

Transport Truck : 	if (isServer) then {null = [this, [["kit",4],["truck",1]]] execVM "USEC\vehicleLoadout.sqf";};

Transport Track	: 	if (isServer) then {null = [this, [["kit",4],["track",1]]] execVM "USEC\vehicleLoadout.sqf";};

Hunter			: 	if (isServer) then {null = [this, [["kit",2],["truck",1]]] execVM "USEC\vehicleLoadout.sqf";};

Heli/Plane		: 	if (isServer) then {null = [this, [["kit",1],["air",1]]] execVM "USEC\vehicleLoadout.sqf";};