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
	
	playerLoadPacket = (_this select 1);
	player enableSimulation false;
	[] spawn{
		{	
			call _x;
			//player groupChat format["call _x = %1", _x];
		}
		forEach playerLoadPacket;
    
    //Ensure player is done loading, correct stance etc before allow user control
    sleep 3;
    
    player allowDamage true;
    player enableSimulation true;
      
      //Remove Image
      cutText ["", "PLAIN"];
      
	};

};

if (isNil "ChronosLoaded") then{
  titleText ["", "BLACK IN", 0];
	titleText ["Chronos is not yet loaded - please try again in 60 seconds", "black"]; titleFadeOut 9999;
	[] spawn {sleep 65; endMission "Chronos Not Loaded";};
}else{

  //hintSilent format ["Chronos is doing something %1", ChronosLoaded ];
  
  if (ChronosLoaded == "true") then{
  
    playerObject = player;
    publicVariableServer "playerObject";
  } 
  else{
  
    titleText ["", "BLACK IN", 0];
    titleText ["Chronos is not yet loaded - please try again in 60 seconds", "black"]; titleFadeOut 9999;
    [] spawn {sleep 65; endMission "Chronos Not Loaded";};
  
  };



};






