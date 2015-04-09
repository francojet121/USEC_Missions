/*--------------------------------------------------------------------
  Author: Unity Security Force

  init.sqf
  Initialization scripts for USEC Training Mission
--------------------------------------------------------------------*/

/**********************************************
  Execution on all clients and server
  Put client and server code in this part
**********************************************/


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

