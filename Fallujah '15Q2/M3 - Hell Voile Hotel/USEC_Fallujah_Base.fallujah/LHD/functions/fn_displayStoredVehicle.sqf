
	
	_display = findDisplay 50001;
	
	_selectedVehicleText = _display displayCtrl 4906;
	_selectedVehicleRepairStatus = _display displayCtrl 4907;
	_selectedVehicleID = _display displayCtrl 4908;
	_selectedVehicleOccupants = _display displayCtrl 4909;
	_selectedVehicleEngineRunning = _display displayCtrl 4911;
	
	
	
	if(lnbCurSelRow 4900 == -1) exitWith { };

	_selectedRow = lnbCurSelRow 4900;
	
	//hintSilent format ["Selected Row was: %1", _selectedRow];
	
	
	//_vehicleClass = (LHA_nearbyVehicles select _selectedRow);

  
	_vehicleToBeStored = LHA_nearbyVehicles select _selectedRow;
	
	//if(_vehicleDamage == 1) exitWith {hint "You cannot store a destroyed vehicle!"};
	
	_crewCount = (count (crew _vehicleToBeStored));
	
	if( _crewCount > 0) exitWith {hint "You cannot store vehicle with passengers!"};


	_vehicleDamageVal = damage _vehicleToBeStored;
	_vehicleDamageStr = str ((1.0 - _vehicleDamageVal )*100) ;
	_vehicleDamage = _vehicleDamageStr select [0, 4];
	_vehicleDamage =  _vehicleDamage+ "%";
	
	_vehicleID = _vehicleToBeStored getVariable ["vehicleChronosID","None"];
//	_vehicleID = vehicleVarName _vehicleToBeStored;
	_vehicleRepairStatus = _vehicleDamage;
	
	
	
	_engineRunng = "No";
	
	if (isEngineOn _vehicleToBeStored) then{
		_engineRunng = "Yes";
	};
	
	_vehicleCrewCount =  str (count (crew _vehicleToBeStored));
	
	
	
	_vehicleClass =  typeOf _vehicleToBeStored;
	_displayName = getText(configFile >> "CfgVehicles" >> _vehicleClass >> "displayName");


	if (count _displayName > 20) then{
		_displayName = _displayName select [0,19];
	};

	if (count _vehicleID > 20) then{
		//hintSilent format ["Shortening the name of : %1", _displayName];
		_vehicleID = _vehicleID select [0,20];
	};	
	
	
	_selectedVehicleText ctrlSetText _displayName;
	_selectedVehicleID ctrlSetText _vehicleID;
	_selectedVehicleRepairStatus ctrlSetText _vehicleRepairStatus;
	//_selectedVehicleID ctrlSetText _vehicleID;
	//_selectedVehicleRepairStatus ctrlSetText "Repair status eh";
	
	
	_selectedVehicleOccupants ctrlSetText _vehicleCrewCount;
	_selectedVehicleEngineRunning ctrlSetText _engineRunng;
	
	

	//HERE
	//_selectedRow = lnbCurSelRow 4900;
	//hintSilent("Selected a vehicle");