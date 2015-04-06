		_display = findDisplay 50001;
		_lhaHomeMenu = _display displayCtrl 4500;
		_lhaHomeMenu ctrlShow false;
		
		_lhaActivityLog = _display displayCtrl 4600;
		_lhaActivityLog ctrlShow false;
		
		
		[false] call LHD_Garage_fnc_hideAllInventoryStatus;
		[false] call LHD_Garage_fnc_hideAllStoreVehicles;