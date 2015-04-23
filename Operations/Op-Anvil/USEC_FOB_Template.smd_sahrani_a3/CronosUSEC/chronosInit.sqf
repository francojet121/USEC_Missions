enableSaving [false, false];
sleep 0.5;

private["_h"];
_h = [] execVM "CronosUSEC\jni.sqf";
waitUntil {scriptDone _h};


if (isDedicated) then {
  []spawn compile preprocessFile "CronosUSEC\vehicleLoad.sqf";
  []spawn compile preprocessFile "CronosUSEC\vehicleSaveServer.sqf";
  []spawn compile preprocessFile "CronosUSEC\playerLoadServer.sqf";
  []spawn compile preprocessFile "CronosUSEC\playerSaveServer.sqf";
  []spawn compile preprocessFile "CronosUSEC\chronosServerInit.sqf";
} else {
  if (hasInterface) then {
    player enableSimulation false;
    waitUntil {!isNull player}; 

    []spawn compile preprocessFile "CronosUSEC\playerLoadClient.sqf";
    []spawn compile preprocessFile "CronosUSEC\playerSaveClient.sqf";
    []spawn compile preprocessFile "CronosUSEC\vehicleSaveClient.sqf";
    []spawn compile preprocessFile "CronosUSEC\chronosClientInit.sqf";
  };
};

#include "serverHandlePlayerCorpses.sqf";
