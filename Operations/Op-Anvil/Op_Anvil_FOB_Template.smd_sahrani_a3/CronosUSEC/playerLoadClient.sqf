player addEventHandler ["respawn", {

	//hintSilent "Player Respawned";
	//Respawn, load from backend
	
	waitUntil {!isNull player}; 
	waitUntil {isTouchingGround player};

	player enableSimulation false;
	player allowDamage false;

	removeHeadgear player:
	removeGoggles player;
	removeVest player;
	removeBackpack player;
	removeUniform player;
	removeAllWeapons player:
	removeAllAssignedItems player;

	
	playerRespawned = player;
	publicVariableServer "playerRespawned";

	
}];



//Show Image

cutRsc ["ChronosLoadingScreen","PLAIN"];

player enableSimulation false;
player allowDamage false;
removeHeadgear player:
removeGoggles player;
removeVest player;
removeBackpack player;
removeUniform player;
removeAllWeapons player:
removeAllAssignedItems player;

playerLoadPacket = "";

"responsePacket" addPublicVariableEventHandler{
	_playerId = getPlayerUID player;
	_packetOwnerId = (_this select 1) select 0;
	playerLoadPacket = (_this select 1) select 1;
  _expectedPackages = (_this select 1) select 2;
	
	if (_packetOwnerId == _playerId) then {
	
	
  //cutText ["", "PLAIN"];
  
	[] spawn{
    
		{	
			call _x;
      sleep 0.5;
			//player groupChat format[": %1", _x];
		}
		forEach playerLoadPacket;
    
    //Validate that all the gear has been loaded
    playerUnit = [player, "validate"];
		publicVariableServer "playerUnit";
    //Ensure player is done loading, correct stance etc before allow user control
    
    }
    
	} else{
	    titleText ["", "BLACK IN", 0];
			titleText ["Loading of character failed, critical error. Please disconnect and reconnect completely", "black"]; titleFadeOut 9999;
			[] spawn {sleep 5; endMission "Critical Error";};
	  };

};

FNC_ShowLoading =  {hint "Loading Completed";};
FNC_ShowProgressBar = {
	[] spawn {
            [60, [], "FNC_ShowLoading", 'Preparing Chronos for operations please stand by ...'] call AGM_Core_fnc_progressBar;
            sleep 60; 
            playerObject = player;
            publicVariableServer "playerObject";
            };
};


if (isNil "ChronosLoaded") then{
    call FNC_ShowProgressBar;
 }else{

    if (ChronosLoaded == "true") then{
      playerObject = player;
      publicVariableServer "playerObject";
    } 
    else{
        call FNC_ShowProgressBar;
    };
    
  };







