_vehicleID = (_this select 0);


_responsePacket = [];
//Load the vehicle stats
_updateInfo = true;
	
while{_updateInfo} do
{
	_serverReply = ["getVehicle", _vehicleID] call invoke_java_method;	
	
	if(_serverReply == "done") then {
		_updateInfo = false;
		//(owner _playerObject) publicVariableClient "responsePacket";
		//player enableSimulation false;
		{	
			call _x;
		}
			forEach _responsePacket;		
//					player enableSimulation true;
		_responsePacket = [];
	} else {
			_code = (compile _serverReply);
			//call _code;
			
			_responsePacket = _responsePacket + [_code];
			};
};
