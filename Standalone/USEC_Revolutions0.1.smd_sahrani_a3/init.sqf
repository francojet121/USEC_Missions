/*--------------------------------------------------------------------
  Author: Unity Security Force

  init.sqf
  Initialization scripts for USEC Training Mission
--------------------------------------------------------------------*/

/**********************************************
  Execution on all clients and server
  Put client and server code in this part
**********************************************/
// Chronos - Comment for local testing!
//#include "CronosUSEC\chronosInit.sqf"

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

