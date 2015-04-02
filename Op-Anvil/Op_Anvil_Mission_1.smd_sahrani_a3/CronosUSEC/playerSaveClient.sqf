counter = 0;

sleep(3);

addMissionEventHandler ["Draw3D", {
	if (counter > 360 and !(isNull player) && canMove player) then
	{
		playerUnit = player;
		publicVariableServer "playerUnit";
		counter = 0;
		
		//player globalChat "Saved";
	};
	
	counter = counter + 1;
}];

player addEventHandler ["killed", {
	playerDied = _this;
	publicVariableServer "playerDied";
	
	//hintSilent "Player Died";
}];
