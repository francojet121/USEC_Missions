//This is where we initialize all the GUI, what is visible and fetch the necessary data;

		disableSerialization;
    
  LHA_SelectedBay = -1;
  LHA_ActiveObject = player;
	LHA_nearbyVehicles = [];
	LHA_SelectedInventoryVehicle = -1;
		
		waitUntil{!isNull (findDisplay 50001)};

		_display = findDisplay 50001;
		_homePage = _display displayCtrl 4500;
		
		_car = 0;
		_air = 0;
		_sea = 0;

		for "_i" from 0 to (count (LHA_garage) - 1) step 1 do {
			_vehicleEntry = (LHA_garage select _i);
			_vehicleClass =  _vehicleEntry select 1;
			if (_vehicleClass isKindOf "Land") then {
			_car = _car+1;
			};
			if (_vehicleClass isKindOf "Air") then {
			_air = _air+1;
			};
			
			if (_vehicleClass isKindOf "Ship") then {
			_sea = _sea+1;
			};
		};
		
		
		_text = format ["Welcome to the USEC LHD Embarkation Debarkation interface. There is currently %1 ground vehicles, %2 air and %3 sea going vehicles available in the garage", _car, _air, _sea];
		_homePage ctrlSetText _text;
		
		_acitivityLogPage = _display displayCtrl 4600;
		//Clear all content from the page
		lnbClear _acitivityLogPage;
		
    
    
    for "_i" from 0 to (count (LHA_GarageActivityLog) - 1) step 1 do {
    _acitivityLogPage lnbAddRow[LHA_GarageActivityLog select _i];
    };
    
    /**
		//Fill Activity Table with data
		for "_i" from 0 to 50 step 1 do {
		_acitivityLogPage lnbAddRow["2LT D. Andersen withdrew B_Heli_Light_01_F at 09/08/2014 19:28"];
		_acitivityLogPage lnbAddRow["2LT D. Andersen stored B_Heli_Light_01_F at 09/08/2014 19:28"];
		};
    **/
		
		
		_inventoryStatus = _display displayCtrl 4701;
		//Clear all content from the page
		lnbClear _inventoryStatus;
		
		//Retrieve vehicles from LHA Garage and input into table
		for "_i" from 0 to (count (LHA_garage) - 1) step 1 do {
			_vehicleEntry = (LHA_garage select _i);
			_vehicleClass =  _vehicleEntry select 1;
//			"B_Heli_Transport_01_F";
			_displayName = getText(configFile >> "CfgVehicles" >> _vehicleClass >> "displayName");
			_inventoryStatus lnbAddRow["", _displayName, "100%"];
			
			
			_picture = getText(configFile >> "CfgVehicles" >> _vehicleClass >> "picture");
			
			
			_inventoryStatus lnbSetPicture[[_i,0],_picture];
//			_inventoryStatus lnbSetData[[_i,0],_vehicleClass]; //Set the classname to index/column 0
		};
		
		
		
		
		
		//hintSilent format ["Hello there chap %1", typeOf   (_nearbyVehicles select 0)];
		
		
		
		_nearbyVehiclesDisplay = _display displayCtrl 4900;
		//Clear all content from the page
		lnbClear _nearbyVehiclesDisplay;

		//_nearbyVehicles =  nearestObjects [(getPos (vehicle USECLhd)), ["landVehicle","Air","Ship"], 5900];
			LHA_nearbyVehicles = nearestObjects [(getPos (player)), ["landVehicle","Air","Ship"], 200];
		
			_vehiclesNotToStore = [];
		{ 
		
			//_vehicleName = vehicleVarName _x;
			_vehicleName = _x getVariable ["vehicleChronosID","None"];
			
			_vehicleNamePrefix = _vehicleName select [0, 4];
		
		
			if ( _vehicleName == ""  ) then{
				_vehiclesNotToStore = _vehiclesNotToStore + [_x];
			};
			
			if ( _vehicleNamePrefix != "USEC"  ) then {
				_vehiclesNotToStore = _vehiclesNotToStore + [_x];
			};
			
		} forEach LHA_nearbyVehicles;
			
		LHA_nearbyVehicles = LHA_nearbyVehicles -_vehiclesNotToStore;
		
		
		
			for "_i" from 0 to (count (LHA_nearbyVehicles) - 1) step 1 do {
			
			_vehicleEntry = (LHA_nearbyVehicles select _i);
			
			_vehicleClass =  typeOf _vehicleEntry;
//			"B_Heli_Transport_01_F";
			_displayName = getText(configFile >> "CfgVehicles" >> _vehicleClass >> "displayName");
			
			_vehicleDamageVal = damage _vehicleEntry;
			_vehicleDamageStr = str ((1.0 - _vehicleDamageVal )*100.) ;
			_vehicleDamage = _vehicleDamageStr select [0, 4];
			_vehicleDamage =  _vehicleDamage+ "%";
			
			
			//_vehicleDamage = str (_vehicleDamageVal);
			
			_nearbyVehiclesDisplay lnbAddRow["", _displayName, _vehicleDamage];
			
			
			_picture = getText(configFile >> "CfgVehicles" >> _vehicleClass >> "picture");
			
			
			_nearbyVehiclesDisplay lnbSetPicture[[_i,0],_picture];
//			_inventoryStatus lnbSetData[[_i,0],_vehicleClass]; //Set the classname to index/column 0
		};
		
		
		
		
		
		
		call LHD_Garage_fnc_hideallmenus;
		
		//[true]call func_usec_lha_hideAllInventoryStatus;
		
		//Shows the home screen
		call LHD_Garage_fnc_NavHomeFunction;
		
		
		
		