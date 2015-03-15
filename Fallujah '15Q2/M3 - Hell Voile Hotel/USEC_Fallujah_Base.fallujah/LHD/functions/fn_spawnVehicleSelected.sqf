_display = findDisplay 50001;
	
	_selectedVehicleText = _display displayCtrl 4805;
	_selectedVehicleID = _display displayCtrl 4806;
	_selectedVehicleDate = _display displayCtrl 4807;
	_selectedVehicleUsedBy = _display displayCtrl 4808;
	_selectedVehicleHealth = _display displayCtrl 4812;
	
	
	
	if(lnbCurSelRow 4701 == -1) exitWith {};

	_selectedRow = lnbCurSelRow 4701;
	
	//hintSilent format ["Selected Row was: %1", _selectedRow];
	
	//_className = lnbData[4701,[(lnbCurSelRow 4701),0]];
	//_displayName = lnbData[4701,[(lnbCurSelRow 4701),1]];
	
	_vehicleClass = (LHA_garage select _selectedRow) select 1;
	_vehicleID = (LHA_garage select _selectedRow) select 0;
	_vehicleLastUsedDate = (LHA_garage select _selectedRow) select 3;
	_vehicleLastUsedName = (LHA_garage select _selectedRow) select 2;
	
	_vehicleHealth = (LHA_garage select _selectedRow) select 4;
	
	
	_displayName = getText(configFile >> "CfgVehicles" >> _vehicleClass >> "displayName");
	
	if (count _displayName > 20) then{
		//hintSilent format ["Shortening the name of : %1", _displayName];
		_displayName = _displayName select [0,19];
	};
	
	if (count _vehicleID > 20) then{ 
		//hintSilent format ["Shortening the name of : %1", _displayName];
		_vehicleID = _vehicleID select [0,20];
	};
	
	_selectedVehicleText ctrlSetText _displayName;
	_selectedVehicleID ctrlSetText _vehicleID;
	_selectedVehicleDate ctrlSetText _vehicleLastUsedDate;
	_selectedVehicleUsedBy ctrlSetText _vehicleLastUsedName;
	_selectedVehicleHealth ctrlSetText _vehicleHealth;
	
	LHA_SelectedInventoryVehicle = _selectedRow;