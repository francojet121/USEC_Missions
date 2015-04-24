// Hide Garage bays if they exist
private ["_bays"];
_bays = ["LHA_bay1", "LHA_bay2", "LHA_bay3", "LHA_bay4", "LHA_bay5", "LHA_bay6", "LHA_bay7", "LHA_bay8", "LHA_bay9"];
{
  // Need to check isNil with variable in "" and then retrieve object through the variable through missionNamespace
  if (!isNil _x) then {hideObjectGlobal (missionNamespace getVariable [_x, objNull])};
} forEach _bays;




"playerFired" addPublicVariableEventHandler {

private ["_arg", "_playerFiring", "_playerName", "_playerID", "_unit", "_serverReply"];
	_arg = (_this select 1);
	_playerFiring = _arg select 1;
	_playerName = name _playerFiring;
	_playerID = getPlayerUID _playerFiring;

	_unit = (_this select 1);
	_serverReply = ["noFireZoneViolation", _playerName, _playerID] call invoke_java_method;
};

"storeVehicleGarage" addPublicVariableEventHandler {
private ["_args", "_playerID", "_playerName", "_vehicleObject", "_vehicleID", "_vehicleType", "_hitpoints", "_hitmx", "_configEntry", "_hitpointEntry", "_vehicleDamageVal", "_vehicleDamageStr", "_fuel", "_vehicleNamePretty", "_vehicleClass", "_serverReply"];
_args = (_this select 1);

_playerID = _args select 0;
_playerName = _args select 1;
_vehicleObject = _args select 2;

_vehicleID = _vehicleObject getVariable ["vehicleChronosID","None"];
_vehicleType = typeOf _vehicleObject;

_hitpoints = [];
_hitmx = (count (configFile >> "CfgVehicles" >> _vehicleType >> "HitPoints")) - 1;
		for "_i" from 0 to _hitmx do {
			_configEntry = (configFile >> "CfgVehicles" >> _vehicleType >> "HitPoints") select _i;
			_hitpointEntry = configName (_configEntry);
			_hitpointHealth = (_vehicleObject getHitPointDamage _hitpointEntry);
			_hitpoints = _hitpoints + [[_hitpointEntry, _hitpointHealth]];
		};
    
    
	_vehicleDamageVal = damage _vehicleObject;
	_vehicleDamageStr = str ((1.0 - _vehicleDamageVal )*100) ;
  
  _fuel = fuel _vehicleObject;
  
  _vehicleNamePretty = getText(configFile >> "CfgVehicles" >> _vehicleType >> "displayName");
  _vehicleClass = "Unknown";
  
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
  
  _serverReply = ["storeVehicleGarage", _playerID, _vehicleID, _vehicleType, _hitpoints, _playerName, _vehicleDamageStr, _fuel, _vehicleNamePretty, _vehicleClass] call invoke_java_method;

  if (_serverReply == "done") then {
    deleteVehicle _vehicleObject;
  };
  
};


"createVehicleGarage" addPublicVariableEventHandler {

private ["_args", "_playerID", "_vehicleID", "_vehiclePosition", "_direction", "_playerName", "_serverReply", "_responsePacket", "_updateInfo", "_code"];

  _args = (_this select 1);

  
  
   _playerID = _args select 0;
   _vehicleID = _args select 1;
   _vehiclePosition = _args select 2;
   _direction = _args select 3;
   _playerName  = _args select 4;
   
    _serverReply = ["prepareGarageVehicle", _playerID, _playerName, _vehicleID, _vehiclePosition, _direction] call invoke_java_method;
    
    
    
   if (_serverReply == "allowed") then {
    
     _responsePacket = [];
    //Load the vehicle stats
    _updateInfo = true;
      
    while{_updateInfo} do
    {
      _serverReply = ["retrieveGarageVehicle", _vehicleID] call invoke_java_method;	
      
      if(_serverReply == "done") then {
        _updateInfo = false;
        {	
          call _x;
        }
          forEach _responsePacket;		
        _responsePacket = [];
      } else {
          _code = (compile _serverReply);
          //call _code;
          
          _responsePacket = _responsePacket + [_code];
          };
    };

  };
   
};

"createGarageList" addPublicVariableEventHandler {

  private ["_unit", "_playerID", "_serverReply", "_LHA_garage", "_LHA_garageLog", "_updateInfo", "_currentCount", "_entry"];
  //Unit requesting it
	_unit = (_this select 1);
  _playerID = getPlayerUID _unit;
  
  openGarage = [];
  //Retrieve from database
  _serverReply = ["prepareGarage", _playerID] call invoke_java_method;	
  
  
  _LHA_garage = [];
  _LHA_garageLog = [];

  //Load the garage inventory
  _updateInfo = true;
    
    
  _currentCount = 0;
  _entry = ["","","","","",""];
    
  while{_updateInfo} do
  {
  
    _serverReply = ["retrieveGarageVehiclesList", _playerID] call invoke_java_method;	
    
    if(_serverReply == "done") then {
      _updateInfo = false;
      
      openGarage = [];
      //Garage list has been completed, time to retrieve the log
      openGarage set [0, _LHA_garage];
      
      
      //Send it to the owner of the playerObject
//      openGarage = _LHA_garage;
//      (owner _unit) publicVariableClient "openGarage";
      
    } else {
    
      //First ID
      //Then Type
      //then playername
      //Then date
      //Then health
      //Then fuel
    
       _entry set [_currentCount, _serverReply];
       _currentCount = _currentCount + 1;
    
      //Reset
      if(_serverReply == "next") then {
      
      _LHA_garage = _LHA_garage + [_entry];
      
       _currentCount = 0;
        _entry = ["","","","","", ""];
      }
    }
  };
    
    //Retrieve the log
    _serverReply = ["prepareLogRetrievalVehicles", _playerID] call invoke_java_method;	
    _updateInfo = true;
    
  while{_updateInfo} do
  {
  
    _serverReply = ["retrieveGarageLog", _playerID] call invoke_java_method;	
    
    if(_serverReply == "done") then {
      _updateInfo = false;
      
      //Garage list has been completed, time to retrieve the log
      openGarage set [1, _LHA_garageLog];
      
      //Send it to the owner of the playerObject
      (owner _unit) publicVariableClient "openGarage";
      
    } else {
      _LHA_garageLog = _LHA_garageLog + [_serverReply];
    }
  };
  
};

"getArmoryData" addPublicVariableEventHandler {

_codePacketTest = ["argumentTest", "Open Armory Called", "Open it I say!" ] call invoke_java_method;
/**
To use, call
  //Request Server to retrieve list from server
  getArmoryData = [player, "rifle"];
  publicVariableServer "getArmoryData";
**/

  //Unit requesting it
  _args = (_this select 1);
  
  _unit = (_args select 0);
  _type = (_args select 1);
	
  
  _codePacketTest = ["argumentTest", "Type is", _type ] call invoke_java_method;
  _playerID = getPlayerUID _unit;
  _codePacketTest = ["argumentTest", "Player ID is", _playerID ] call invoke_java_method;
  armoryData = [];
  //Retrieve from database
  _serverReply = ["prepareArmory", _playerID, _type] call invoke_java_method;	
  
  _armory = [];
  
  //Load the armory inventory
  _updateInfo = true;
    
    
  _currentCount = 0;
  _entry = ["","","",""];
    
  while{_updateInfo} do
  {
  
    _serverReply = ["retrieveArmoryList", _playerID] call invoke_java_method;	
    
    if(_serverReply == "done") then {
      _updateInfo = false;

      armoryData = [];
      armoryData set [0, _type];
      armoryData set [1, _armory];
      
    } else {
    
      //className
      //subcategory
      //description
      //quantity
    
       _entry set [_currentCount, _serverReply];
       _currentCount = _currentCount + 1;
    
      //Reset
      if(_serverReply == "next") then {
      
      _armory = _armory + [_entry];
      
       _currentCount = 0;
       _entry = ["","","",""];
      }
    }
  };
    
      //Send it to the owner of the playerObject
      (owner _unit) publicVariableClient "armoryData";
      

 };
