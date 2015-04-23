playerSaveModule = compile (preprocessFile "CronosUSEC\playerSingletonSave.sqf");


"playerUnit" addPublicVariableEventHandler{
  private ["_arg", "_unit", "_id", "_type"];
  
  _arg = (_this select 1);
  
	_unit = (_arg select 0);
  _type = (_arg select 1);
  
	_id = (getPlayerUID _unit);
	[_unit, _id, _type] spawn playerSaveModule;
};


"playerDied" addPublicVariableEventHandler{
  private ["_arg", "_unit", "_id", "_killedBy", "_serverReply"];
	_arg = (_this select 1);
	
	_unit = _arg select 0;
	_id = (getPlayerUID _unit);

	_killedBy = _arg select 1;
	
	//playerDied
	_serverReply = ["playerDied", _id, _killedBy] call invoke_java_method;
	_unit setVariable["loaded", "false"];
	
	
};