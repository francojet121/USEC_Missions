/*--------------------------------------------------------------------
  Author: Unity Security Force
  
  initPlayerLocal.sqf
  Initialization of scripts local to player
  Executed locally when player joins mission (includes both mission start and JIP). Executed after initServer and before initPlayerServer and init.
  
  Arguments: [player:Object, didJIP:Boolean]
--------------------------------------------------------------------*/

// Types a structured text on the screen, letter by letter, cursor blinking.
[ 
  [ 
    ["Unity Security Force", "<t size = '0.7' underline = '1'>%1</t><br/>"],
    ["Betelgeuse"],
    ["FOB Tartarus"],
    ["Sahrani"],
    ["May 30, 2015", "<t size = '0.7' font='puristaMedium'>%1</t>", 70]
  ], 1, 0.75, "<t align = 'center' shadow = '1' size = '1.0'>%1</t>"
] spawn BIS_fnc_typeText;

// =======================================

//Ensure that spawned player entity has no items
removeHeadgear player:
removeGoggles player;
removeVest player;
removeBackpack player;
removeUniform player;
removeAllWeapons player:
removeAllAssignedItems player;

/////////////////////////////////////////////////////////////////////////////////////////
// NUKE RELATED STUFF
/////////////////////////////////////////////////////////////////////////////////////////
mdh_nuke_destruction_zone	= 800;	// DESTRUCTION ZONE OF NUKE IN METERS, USE 0 TO DEACTIVATE
mdh_nuke_camshake			= 1;	// CAEMRASHAKE AT NUKEDETONATION 1=ON, 0=OFF
mdh_nuke_ash				= 1;	// ASH AFTER NUKEDETONATION 1=ON, 0=OFF
mdh_nuke_colorcorrection	= 1;	// COLLORCORRECTION AFTER NUKEDETONATION 1=ON, 0=OFF
/////////////////////////////////////////////////////////////////////////////////////////
