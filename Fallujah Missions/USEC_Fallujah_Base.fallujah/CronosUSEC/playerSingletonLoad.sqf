_playerObject = (_this select 0);
_id = getPlayerUID _playerObject;
responsePacket = [];
//Load the players stats
_serverInitPlayer = ["retrieveInfantry", _id] call invoke_java_method;

	
if ( _serverInitPlayer == "ready") then {
	_updateInfo = true;
		
	while{_updateInfo} do
	{
		_serverReply = ["getPlayerVariables", _id] call invoke_java_method;

		//	if(_serverReply == "error") then {
		//		hintSilent "An error occurred when trying to retrieve gear";
		//		kick _playerObject;
		//	};
			
		if(_serverReply == "done") then {
			_updateInfo = false;
			(owner _playerObject) publicVariableClient "responsePacket";
			responsePacket = [];
			_playerObject setVariable["loaded", "true"];
		} else {
			_code = (compile _serverReply);
			responsePacket = responsePacket + [_code];
		};
	};
		
}else {
	_uniformCargoReply = ["argumentTest", "Error loading player because init player returned this ", _serverInitPlayer ] call invoke_java_method;
	//kick _playerObject;
};
