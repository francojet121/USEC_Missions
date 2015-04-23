private ["_vehicleObject", "_vehicleID", "_vehicleType", "_vehicleNamePrefix", "_vehicleLoaded", "_agmVars", "_serverReply", "_hitpoints", "_hitmx", "_configEntry", "_hitpointEntry", "_hitpointHealth", "_vehiclePos", "_vehicleDir", "_vehicleAlive", "_vehicleClass", "_vehicleDamage", "_vehicleCrew", "_driver", "_id", "_name", "_vehicleClass", "_vehicleFuel", "_vehicleAmmo", "_vehicleMagazineCargo", "_vehicleItemCargo", "_vehicleWeapons", "_vehicleBackPacks", "_vehicleVests", "_vehicleUniforms", "_vehicleBackpackItems", "_vehicleBackpackMagazines", "_vehicleBackpackWeapons", "_everyVehicleContainer", "_vehicleNamePretty", "_serverReply"]; 
_vehicleObject = (_this select 0);
//_vehicleID = vehicleVarName _vehicleObject;
_vehicleID = _vehicleObject getVariable ["vehicleChronosID","None"];
_vehicleType = typeOf _vehicleObject;
_vehicleNamePrefix = _vehicleID select [0, 4];

if (_vehicleNamePrefix == "USEC" ) then
{

/**
_vehicleLoaded = [_vehicleObject] call AGM_Logistics_fnc_hasLoadedItems;
  if (_vehicleLoaded) then {
    _agmVars = _vehicleObject getVariable ["AGM_Logistics_loadedItems", []];
    _serverReply = ["argumentTest", "AGM Vars", _agmVars] call invoke_java_method;
  };
  
  **/

		//see http://browser.six-projects.net/cfg_vehicles
		//and https://community.bistudio.com/wiki/configFile

		_hitpoints = [];
		_hitmx = (count (configFile >> "CfgVehicles" >> _vehicleType >> "HitPoints")) - 1;
		for "_i" from 0 to _hitmx do {
			_configEntry = (configFile >> "CfgVehicles" >> _vehicleType >> "HitPoints") select _i;
			_hitpointEntry = configName (_configEntry);
			_hitpointHealth = (_vehicleObject getHitPointDamage _hitpointEntry);
			_hitpoints = _hitpoints + [[_hitpointEntry, _hitpointHealth]];
		};
 
	_vehiclePos = (getPosATL _vehicleObject);
	_vehicleDir = (getDir _vehicleObject);
	_vehicleAlive = (alive _vehicleObject);
	_vehicleClass = "Unknown";
	_vehicleDamage = damage _vehicleObject;					
	
	
	_vehicleCrew = [];
  _driver = "";
   if (_vehicleObject isKindOf "AllVehicles") then {
   	_driver = name (driver _vehicleObject);
    _vehicleCrewList = (crew _vehicleObject);
    {
      _id = getPlayerUID _x;
      _name = name _x;
      _vehicleCrew = _vehicleCrew + [[_id, _name]];
    } forEach _vehicleCrewList;
  };
  
	if(_vehicleObject isKindOf "Car") then
	{
		_vehicleClass = "Car";
	};

	if(_vehicleObject isKindOf "Plane") then
	{
		_vehicleClass = "Plane";
	};

	if(_vehicleObject isKindOf "Helicopter") then
	{
		_vehicleClass = "Helicopter";
	};

	if(_vehicleObject isKindOf "Tank") then
	{
		_vehicleClass = "Tank";
	};
	
	
	if(_vehicleObject isKindOf "Motorcycle") then
	{
		_vehicleClass = "Motorcycle";
	};
	
	
	if(_vehicleObject isKindOf "Ship") then
	{
		_vehicleClass = "Ship";
	};
	
	if(_vehicleObject isKindOf "ReammoBox_F") then
	{
		_vehicleClass = "Storage Container";
	};
	
					
	_vehicleFuel = fuel _vehicleObject;
		
	_vehicleAmmo = [];
	_vehicleMagazineCargo = [];
	_vehicleItemCargo = [];		
	_vehicleWeapons = [];		
	_vehicleBackPacks = [];
	_vehicleVests = [];
	_vehicleUniforms = [];
	
	_vehicleBackpackItems = [];
	_vehicleBackpackMagazines = [];
	_vehicleBackpackWeapons = [];
	
					
	if(_vehicleAlive) then
	{
		_vehicleAmmo = (magazinesAmmo _vehicleObject);
		_vehicleMagazineCargo =  (getMagazineCargo _vehicleObject);
		_vehicleItemCargo =  (itemCargo _vehicleObject);
		_vehicleWeapons = weaponsItemsCargo _vehicleObject;
		_vehicleBackPacks = (getBackpackCargo _vehicleObject);
	
		_everyVehicleContainer = everyContainer _vehicleObject;
	

		{
			_container = _x select 1;
			_vehicleBackpackItems = _vehicleBackpackItems + (itemCargo _container);
			_vehicleBackpackMagazines = _vehicleBackpackMagazines + (getMagazineCargo _container);
			_vehicleBackpackWeapons = _vehicleBackpackWeapons + (weaponsItems _container);
			
		} forEach _everyVehicleContainer;
	
	};
	

	_vehicleNamePretty = getText(configFile >> "CfgVehicles" >> _vehicleType >> "displayName");
	
	_serverReply = ["storeVehicle", _vehicleID, _vehiclePos, _vehicleDir, _vehicleType, _vehicleClass, _vehicleAlive, _vehicleDamage, _hitpoints, _vehicleFuel, _vehicleAmmo, _vehicleMagazineCargo, _vehicleItemCargo, _vehicleWeapons, _vehicleCrew, _vehicleBackPacks, _vehicleBackpackItems, _vehicleBackpackMagazines, _vehicleBackpackWeapons, _driver, _vehicleNamePretty] call invoke_java_method;
	

	
	
	//Test for retrieving backpack items

	
//		_serverReply = ["argumentTest", "Backpack Items", _vehicleBackpackItems ] call invoke_java_method;
//		_serverReply = ["argumentTest", "Backpack Magazines", _vehicleBackpackMagazines ] call invoke_java_method;
//		_serverReply = ["argumentTest", "Backpack Weapons", _vehicleBackpackWeapons ] call invoke_java_method;
	
	
	
} else {
	//_serverReply = ["argumentTest", "Vehicle Var name is empty", _vehicleType ] call invoke_java_method;
};
