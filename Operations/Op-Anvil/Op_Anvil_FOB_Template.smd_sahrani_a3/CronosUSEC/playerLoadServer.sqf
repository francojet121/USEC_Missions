//Done Server Side

playerLoadModule = compile (preprocessFile "CronosUSEC\playerSingletonLoad.sqf");

"playerObject" addPublicVariableEventHandler {
  private ["_unit"];
	_unit = (_this select 1);
	[_unit] spawn playerLoadModule;
};


"playerRespawned" addPublicVariableEventHandler{

  private ["_playerObject"];
	_playerObject = _this select 1;
	
	waitUntil {!isNull _playerObject}; 

	playerObject = _playerObject;

	publicVariableServer "playerObject";
};

