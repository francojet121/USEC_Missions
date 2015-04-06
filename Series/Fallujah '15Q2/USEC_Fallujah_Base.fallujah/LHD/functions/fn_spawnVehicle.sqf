
	
	if ( LHA_SelectedBay == -1)  exitWith {hint "No bay selected";};
	
	_selectedBay = bay1;
	_selectedBayVeh = (vehicle bay1);
	
	
	
	switch (LHA_SelectedBay) do
		{
		   case 1:
		   {
			  _selectedBay =  bay1;

		   };	
		   case 2:
		   {
			  _selectedBay =  ( bay2);
		   };
		   case 3:
		   {
			  _selectedBay =  ( bay3);
		   };
		   case 4:
		   {
			  _selectedBay =  ( bay4);
		   };
		   case 5:
		   {
			  _selectedBay =  ( bay5);
		   };   
		   case 6:
		   {
			  _selectedBay =  ( bay6);
		   };  
		   case 7:
		   {
			  _selectedBay =  ( bay7);
		   };  
		   case 8:
		   {
			  _selectedBay =  ( bay8);
		   };  
		   case 9:
		   {
			  _selectedBay =  ( bay9);
		   };     
		};
	
	_selectedBayVeh =  (vehicle _selectedBay);
			  
			  
	
			  
	//LHA_SelectedBay

		_selectedRow = lnbCurSelRow 4701;
		
		
		if(_selectedRow == -1) exitWith {hint "You have not selected a vehicle";};
		
		_vehicleClass = (LHA_garage select _selectedRow) select 1;
		_vehicleID = (LHA_garage select _selectedRow) select 0;
		
		_displayName = getText(configFile >> "CfgVehicles" >> _vehicleClass >> "displayName");
		
		_position = getPosASL _selectedBayVeh;
		_direction = direction _selectedBayVeh;
		
		
		_lat = _position select 0;
		_lon = _position select 1;
		//_elevation = getPosASL lhdCommandCenter select 2;
		
		
		_elevation = _position select 2;
		
		
		//Safety add
		_elevation = _elevation + 0.02;
		
		_nearbyVehicles =  nearestObjects [[_lat, _lon, _elevation], ["Car","Air","Ship", " Motorcycle", "Tank"], 10];
		
		_bays = [bay1, bay2, bay3, bay4, bay5, bay6, bay7, bay8, bay9];
		
		_nearbyVehicles = _nearbyVehicles - _bays;
		
		if ( count _nearbyVehicles > 0)  exitWith {hint "A vehicle is currently occupying the selected bay";};
		
		
		if(isNil "_position") exitWith {hint "The spawn point marker doesn't exist?";};
		
    
    //Send info to the server to get the vehicle created
    createVehicleGarage = [ getPlayerUID player, _vehicleID, [_lat, _lon, _elevation], _direction, name player];
    publicVariableServer "createVehicleGarage";


      //Uncomment for locally created vehicles
    /**
    
		//_vehicle = _vehicleClass createVehicle _position;
		_vehicle = createVehicle [_vehicleClass, [_lat, _lon, _elevation], [], 0, "NONE"] ;
		_vehicle allowDamage false;
		//_vehicle enableSimulationGlobal false;
		
		//_vehicle setVehicleVarName (_vehicleID );
		_vehicle setVariable["vehicleChronosID", _vehicleID, true];
		
		
		_vehicle setPosASL [_lat, _lon, _elevation]; //Make sure it gets set onto the position.
		_vehicle setDir _direction; //Set the vehicles direction the same as the marker.
		
		//Vehicle has been spawned, now it can take damage
		
		//_vehicle enableSimulationGlobal true;
		_vehicle allowDamage true;
		
		**/
		
		//hint format["You have spawned a %1 at %2",_displayName, _elevation];
		
		//Remove entry temp fix
		//LHA_garage = LHA_garage - (LHA_garage  select _selectedRow);
		
		
		//Reset the selected bay
		LHA_SelectedBay = -1;
		
		//Close the dialog
		closeDialog 0;