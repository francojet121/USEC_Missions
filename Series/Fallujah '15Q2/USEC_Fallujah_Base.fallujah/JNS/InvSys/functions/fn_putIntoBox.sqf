// Add gear loop
{
  // If array element IS String
  if (typeName _x == "STRING") then {

    _configBackpack = configFile >> "CfgVehicles" >> _x;
    _configWeaponSimulation = getText (configFile >> "CfgWeapons" >> _x >> "cursor");
    
    if ((getText (_configBackpack >> "vehicleClass") == "Backpacks") && (getNumber (_configBackpack >> "maximumLoad") >= 0)) then {
      _object addBackpackCargoGlobal [_x,1];
    } else {
      if (_configWeaponSimulation != "" || _configWeaponSimulation == "Binocular") then {
        _object addWeaponCargoGlobal [_x,1];
      } else {
        _object addItemCargoGlobal [_x,1];
      };
    };
  
  // If array element is NOT String (eg. IS Array)
  } else {
    _object addItemCargoGlobal _x;
    
  };
} forEach _loadoutArray;
