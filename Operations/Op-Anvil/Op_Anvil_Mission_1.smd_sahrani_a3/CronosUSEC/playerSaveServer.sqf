playerSaveModule = compile (preprocessFile "CronosUSEC\playerSingletonSave.sqf");


"playerUnit" addPublicVariableEventHandler{
	_unit = (_this select 1);
	_id = (getPlayerUID _unit);
	[_unit, _id] spawn playerSaveModule;
};


"playerDied" addPublicVariableEventHandler{
	_arg = (_this select 1);
	
	_unit = _arg select 0;
	_id = (getPlayerUID _unit);

	_killedBy = _arg select 1;
	
	//playerDied
	_serverReply = ["playerDied", _id, _killedBy] call invoke_java_method;
	_unit setVariable["loaded", "false"];
	
	
};

addMissionEventHandler ["HandleDisconnect", {

	_unitObj = (_this select 0);
	_id = (_this select 2);
	
	if (canMove _unitObj) then {
		_unitObj setVariable["disconnecting", "true"];
		[_unitObj, _id] spawn playerSaveModule;
		
	};
	
//	_namevar = (_this select 3);
	//_serverReply = ["argumentTest", "Player Disconnected", _id] call invoke_java_method;
//	};

}];