private ["_retrieveVehicles", "_updateInfo", "_serverReply", "_vehicleInvulnerable", "_vehicleID", "_vehicleNamePrefix"];
vehLoadModule = compile (preprocessFile "CronosUSEC\vehicleSingletonLoad.sqf");

//Call server and get it to retrieve all vehicles
_retrieveVehicles = ["retrieveAllVehicles"] call invoke_java_method;

vehList = [];

if ( _retrieveVehicles == "ready" ) then {
		_updateInfo = true;
		
		while{_updateInfo} do
		{
			_serverReply = ["getVehicleList"] call invoke_java_method;
			
			//We have retrieved the ID of all vehicles
			if(_serverReply == "done") then {
				_updateInfo = false;
				
				{
					//_serverReply = ["argumentTest", "ID Retrieved", _x] call invoke_java_method;
					//Test with spawn instead
					[_x] spawn vehLoadModule;
					//[_x] call vehLoadModule;
					//sleep(2);
				} forEach vehList;
				
			} else {
				vehList = vehList + [_serverReply]
			};
		};
		
};



_vehicleInvulnerable = true;
//[]spawn {

	//waitUntil{
  while { _vehicleInvulnerable  } do {
		
    //_isThisAlive = ["argumentTest", "Is this method alive", _vehicleInvulnerable ] call invoke_java_method;
    _serverReply = ["isVehiclesAllLoaded"] call invoke_java_method;
    
    sleep(5);
      if (_serverReply == "true") then {
		
        for	[{_i = 0}, {_i < (count vehicles)}, {_i = _i + 1}] do
        {
           veh = (vehicles select _i);
           _vehicleID = veh getVariable ["vehicleChronosID","None"];
           _vehicleNamePrefix = _vehicleID select [0, 4];
          if (_vehicleNamePrefix == "USEC" ) then
          {
            veh allowDamage true;
          }
          
          //sleep (0.1);
        };
        _vehicleInvulnerable = false;
        
        ChronosLoaded = "true";
        publicVariable "ChronosLoaded";

        
      };
		
	//	not vehicleInvulnerable;
	};
//};




//vehList = ["tisttank", "tistcar", "tistheli", "tistship", "tank1", "tank2", "tank3", "tank4", "tank5"]; //todo: add call to pull and assign names



//{
//	[_x] spawn vehLoadModule;
//	
//} forEach vehList;