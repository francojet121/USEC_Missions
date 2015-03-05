/*--------------------------------------------------------------------
  Author: Unity Security Force

  init.sqf
  Initialization scripts
--------------------------------------------------------------------*/

/**********************************************
  Execution on all clients and server
  Put client and server code in this part
**********************************************/
// Chronos - Uncomment before playing!
//#include "CronosUSEC\chronosInit.sqf"


// The following functions will be executed on the specificed Headless Client, if that one does NOT exist it will fall-back to another Headless Client and if NONE are present, fall-back to execution on Server
_headlessClientInit1 = {
  // Put script initializations for Headless Client 1 here
  null = [] execVM "cos/cosInit.sqf";
};
_headlessClientInit2 = {
  // Put script initializations for Headless Client 2 here
  
};
_headlessClientInit3 = {
  // Put script initializations for Headless Client 3 here
  
};
#include "USEC\headlessClientInit.sqf"

setViewDistance 3000;

// Friendly Fire safe limit. Raises user rating high enough to prevent AI turning on you, unless you're really bad.
player addRating 90000;

// SQF functions cannot continue running after loading a saved game, do not delete this line
enableSaving [false, false];


/*********************************************
  All clients stop executing here
  DO NOT PUT ANY EXTRA CODE IN THIS PART!
**********************************************/
if (!isServer) exitWith {};

// Execution stops until the mission begins (past briefing), do not delete this line
sleep 1;
/**********************************************
  Execution only on server
  Put server-only code in this part
**********************************************/

