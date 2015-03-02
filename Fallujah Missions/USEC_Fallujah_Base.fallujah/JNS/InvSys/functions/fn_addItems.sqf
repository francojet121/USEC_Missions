_configItemSimulation = getText (configFile >> "CfgWeapons" >> _x >> "simulation");

switch (_configItemSimulation) do {
  case "ItemMap": {_player linkItem _x;};
  case "ItemGPS": {_player linkItem _x;};
  case "ItemRadio": {_player linkItem _x;};
  case "ItemCompass": {_player linkItem _x;};
  case "ItemWatch": {_player linkItem _x;};
};
