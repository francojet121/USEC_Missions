_playerObject = (_this select 0);
_id = getPlayerUID _playerObject;
_playerOwner = (owner _playerObject);
responsePacket = [];
//Load the players stats
_serverInitPlayer = ["retrieveInfantry", _id] call invoke_java_method;
_playerReady = _serverInitPlayer select [0, 5];
_queueSize = parseNumber (_serverInitPlayer select [5, 10] );
_receivedPackages = 0;


//Figure out how many packages we can expect	
if ( _playerReady == "ready") then {
	_updateInfo = true;
		
	while{_updateInfo} do
	{
		_serverReply = ["getPlayerVariables", _id] call invoke_java_method;

		if(_serverReply == "error") then {
        //Bad things happend, stop executing
        _updateInfo = false;
		};
			
		if(_serverReply == "done") then {
    
    //Did we loose a package?
    //_codePacketTest = ["argumentTest", "Queue Size:  ", _queueSize ] call invoke_java_method;
    //_codePacketTest = ["argumentTest", "Received Packages", _receivedPackages ] call invoke_java_method;
    
      //We have receieved all packages, huzzah!
      if (_queueSize == _receivedPackages) then {
        
        //_codePacketTest = ["argumentTest", "Huzzah", _receivedPackages ] call invoke_java_method;
      
        _updateInfo = false;
        _playerOwner publicVariableClient "responsePacket";
        responsePacket = [];
        _playerObject setVariable["loaded", "true"];
      }else {
        _errorReport = ["argumentTest", "Failed to receive all packages, resetting for player ", _id ] call invoke_java_method;
        
        //Reset
        responsePacket = [];
        _serverInitPlayer = ["retrieveInfantry", _id] call invoke_java_method;
        _queueSize = parseNumber (_serverInitPlayer select [5, 10] );
        _receivedPackages = 0;
      };

		} else {
    
      _playerID = _serverReply select [0, 17];
      //_codePacketTestID = ["argumentTest", "Selected PLAYERID is   ", _playerID ] call invoke_java_method;

      if (_playerID == _id ) then
      {
        _packageLength = count _serverReply;
        _codePacket = _serverReply select [17, _packageLength];
        //_codePacketTest = ["argumentTest", "Code Package came back as  ", _codePacket ] call invoke_java_method;
        
        _code = (compile _codePacket);
        responsePacket = responsePacket + [_code];
        
        _receivedPackages = _receivedPackages + 1;
      };
    

		};
	};
		
}else {
	_unknownErrorEvent = ["argumentTest", "Error loading player because init player returned this ", _serverInitPlayer ] call invoke_java_method;
	//kick _playerObject;
};
