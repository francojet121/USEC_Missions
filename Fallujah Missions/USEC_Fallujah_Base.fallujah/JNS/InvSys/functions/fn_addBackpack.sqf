_configBackpack = configFile >> "CfgVehicles" >> _x;

if (getText (_configBackpack >> "vehicleClass") == "Backpacks") then {
  _player addBackpackGlobal _x;
};
