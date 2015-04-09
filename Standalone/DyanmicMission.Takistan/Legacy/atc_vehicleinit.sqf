_vehicle = _this select 0;
hint "veh";
_eh = _vehicle addEventHandler ["GetIn", {SpawnVM = _this execVM "atc_actions.sqf";}];
_eh = _vehicle addEventHandler ["GetOut", {SpawnVM = _this execVM "atc_actions.sqf";}];
