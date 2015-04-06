

		_selectedRow = lnbCurSelRow 4900;
		
		if(_selectedRow == -1) exitWith {hint "You have not selected a vehicle";};
		
		_vehicleToBeStored = LHA_nearbyVehicles select _selectedRow;
		
		if (isEngineOn _vehicleToBeStored) exitWith {
			hint "You cannot store a vehicle while the engine is running";
		};
		
		if ((count (crew _vehicleToBeStored)) > 0) exitWith {
			hint "You cannot store an occupied vehicle";
		};
		
//		if ((damage _vehicleToBeStored) == 1) exitWith {
//			hint "You cannot store a destroyed vehicle";
//		};
		
    storeVehicleGarage = [ getPlayerUID player, name player, _vehicleToBeStored];
    publicVariableServer "storeVehicleGarage";
		
		
		LHA_SelectedBay = -1;
		closeDialog 0;
    
    hintSilent "Vehicle Stored";