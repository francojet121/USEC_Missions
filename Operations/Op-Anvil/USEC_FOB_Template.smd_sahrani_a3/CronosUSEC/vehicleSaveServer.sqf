running = true;
clientVehicleObject = objNull;
vehicleSaveModule = compile preprocessFile "CronosUSEC\vehicleSingletonSave.sqf";


"vehObj" addPublicVariableEventHandler {
	private ["_args", "_vehicleVarName", "_vehicleNum", "_clientVehicleObject", "_vehName"];
  _args = (_this select 1);

	_clientVehicleObject = _args select 0;
  _vehicleVarName  = _args select 1;
  _vehicleNum = _args select 2;
  
  
  (vehicles select _vehicleNum) setVehicleVarName _vehicleVarName;
  _clientVehicleObject setVehicleVarName _vehicleVarName;
  
  
  _vehName = vehicleVarName _clientVehicleObject;
	[_clientVehicleObject] spawn vehicleSaveModule;
};

_vehiclesNotLoaded = true;

//Block until ready
  while{_vehiclesNotLoaded} do
  {

  _serverReply = ["isVehiclesAllLoaded"] call invoke_java_method;
    if (_serverReply == "true") then {
      _vehiclesNotLoaded = false;
    };
    sleep(5);

  };

hHandle = []spawn {
	waitUntil{
		sleep(10);
		

    
		for	[{_i = 0}, {_i < (count vehicles)}, {_i = _i + 1}] do
		{
		
	//	See https://community.bistudio.com/wiki/Locality_in_Multiplayer
		
		//	/**
		//Is the object local to the server
    
    
    
			veh = (vehicles select _i);
			[veh] spawn vehicleSaveModule;
      /**
			if(local veh) then
			{
				[veh] spawn vehicleSaveModule;
			}
			else
			{
			//Vehicle is stored on a players end, store the object
				getVehicleObject = _i;
				(owner veh) publicVariableClient "getVehicleObject";
			};
      
      **/
      
      
		//	**/
			
			
			sleep (0.1);
		};
		
		//Disable if we are saving once
		//running = false;
		
		not running;
	}
};