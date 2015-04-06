_object = [_this, 0, this] call BIS_fnc_param;

_object setObjectTexture [0, "usec_resources\images\LHD\lhdmain.paa"];

_object addAction ["Open Garage", {
  hintSilent "Retrieving Garage, please stand by ...";

  //Request Server to retrieve list from server
  createGarageList = player;
  publicVariableServer "createGarageList";
}, nil, 6, true, true, "", "_this distance _target < 3"];
