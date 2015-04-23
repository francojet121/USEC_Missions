private ["_marker"];
_marker = _this select 0;

_marker addEventHandler ["FiredNear", {
  private ["_playerFiring"];
	playerFired = _this;
	//publicVariableServer "playerDied";
	publicVariableServer "playerFired";
	//hintSilent "Player Died";
	_playerFiring = _this select 1;
	playerName = name _playerFiring;
		
	message = format ["%1 discharged their weapon in a no-fire zone" , playerName];
	[message,"hint",nil,false] call BIS_fnc_MP;
}];


