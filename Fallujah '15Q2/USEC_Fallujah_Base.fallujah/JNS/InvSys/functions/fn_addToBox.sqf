_configBackpack = configFile >> "CfgVehicles" >> _x;
_configWeaponSimulation = getText (configFile >> "CfgWeapons" >> _x >> "simulation");

if ((getText (_configBackpack >> "vehicleClass") == "Backpacks") && (getNumber (_configBackpack >> "maximumLoad") > 0)) then {
  _object addBackpackCargoGlobal [_x,1];
} else {
  if (_configWeaponSimulation == "Weapon" || _configWeaponSimulation == "Binocular") then {
    _object addWeaponCargoGlobal [_x,1];
  } else {
    _object addItemCargoGlobal [_x,1];
  };
};