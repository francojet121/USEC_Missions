"openGarage" addPublicVariableEventHandler {

  private ["_args"];
	_args = (_this select 1);
  
  LHA_garage = _args select 0;
  LHA_GarageActivityLog = _args select 1;
  
  //Garage has been retrieved from the server, open the dialog  
  USEC_DebarkationControl = createDialog "USEC_DebarkationControl";
  
  hint "";
};


//An error occured
"terminatePlayer" addPublicVariableEventHandler {
    call AGM_Interaction_fnc_hideMenu;
    titleText ["", "BLACK IN", 0];
    titleText ["Loading failed, your connection has been terminated", "black"]; titleFadeOut 9999;
    [] spawn {sleep 3; endMission "Critical Error";};
};

//Chronos_fnc_saveToChronos = compile preprocessFileLineNumbers "CronosUSEC\saveToChronos.sqf";
"showLoadingBar" addPublicVariableEventHandler {
  _loadingTime = (_this select 1);
  _loadingText = "Fetching Player data. Please standby";
  
  
FNC_PlayerLoadComplete =  {
    hint "Loading Completed";
    [30, "Server is experiencing high load, please be patient"] call FNC_ShowProgressBar;
};
  
FNC_ShowProgressBar = {
  _loadingTime = _this select 0;
  _loadingText = _this select 1;
  
  [_loadingTime, [], "FNC_PlayerLoadComplete;", _loadingText] call AGM_Core_fnc_progressBar;
  };
  [_loadingTime, _loadingText] call FNC_ShowProgressBar;
   //[_loadingTime, [], "hintSilent 'Loading';", 'Fetching Player data. Please standby'] call AGM_Core_fnc_progressBar;
};

"loadingDone" addPublicVariableEventHandler {

  call AGM_Interaction_fnc_hideMenu;
  player allowDamage true;
  player enableSimulation true;
  
  cutText ["", "PLAIN"];
};


/**
This event is executed on the client once all armory data has been loaded and is ready for use
**/
"armoryData" addPublicVariableEventHandler {
                                                                                                                                                              
  private ["_args"];
	_args = (_this select 1);
  _type = _args select 0;
  _armoryData = _args select 1;
  
  {	
    player groupChat format["ClassName: %1, SubCategory: %2, Description: %3, Quantity: %4", _x select 0, _x select 1, _x select 2, _x select 3];
  }
  forEach _armoryData;
};

