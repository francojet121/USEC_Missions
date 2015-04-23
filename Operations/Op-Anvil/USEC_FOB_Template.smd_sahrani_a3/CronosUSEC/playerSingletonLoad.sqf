private ["_playerObject", "_id", "_playerOwner", "_serverInitPlayer", "_playerReady", "_queueSize", "_receivedPackages", "_updateInfo", "_serverReply", "_errorReport", "_playerID", "_packageLength", "_codePacket", "_code"];
_playerObject = (_this select 0);
_playerObject hideObjectGlobal true;
_id = getPlayerUID _playerObject;
_playerOwner = (owner _playerObject);
responsePacket = [];
//Load the players stats
_serverInitPlayer = ["retrieveInfantry", _id] call invoke_java_method;
_playerReady = _serverInitPlayer select [0, 5];
_queueSize = parseNumber (_serverInitPlayer select [5, 10] );
_receivedPackages = 0;
_name = name _playerObject;

//Figure out how many packages we can expect	
if ( _playerReady == "ready") then {
	_updateInfo = true;
		
	while{_updateInfo} do
	{
		_serverReply = ["getPlayerVariables", _id] call invoke_java_method;

		if(_serverReply == "error") then {
        //Bad things happend, stop executing
        _updateInfo = false;
        _playerOwner publicVariableClient "terminatePlayer";
		};
			
		if(_serverReply == "done") then {
    
    //Did we loose a package?
//    _codePacketTest = ["argumentTest", "Queue Size:  ", _queueSize ] call invoke_java_method;
//    _codePacketTest = ["argumentTest", "Received Packages", _receivedPackages ] call invoke_java_method;
//    _codePacketTest = ["argumentTest", "Packages Received", responsePacket ] call invoke_java_method;
	
      //We have received all packages, huzzah!
      if (_queueSize == _receivedPackages) then {

        showLoadingBar =  _queueSize * 0.5 + 10;
        _playerOwner publicVariableClient "showLoadingBar";
        
        _updateInfo = false;
        	/**
          {	
          _codePacketTest = ["argumentTest", "Executing", _x ] call invoke_java_method;
           call _x;
           sleep 0.1;
           
          }
          forEach responsePacket;
          **/
        
         responsePacket = [_id, responsePacket, _queueSize];
        _playerOwner publicVariableClient "responsePacket";
        responsePacket = [];

        
      }else {
        _errorReport = ["errorReport", "Failed to receive all packages", "playerload", _id, _name] call invoke_java_method;
        
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
      } else {
		_errorReport = ["errorReport", "Received incorrect packages", "playerload", _id, _name] call invoke_java_method;
		_playerOwner publicVariableClient "terminatePlayer";
	  };
    

		};
	};
		
}else {
	_unknownErrorEvent = ["argumentTest", "Error loading player because init player returned this ", _serverInitPlayer ] call invoke_java_method;
	_playerOwner publicVariableClient "terminatePlayer";
	//kick _playerObject;
};
